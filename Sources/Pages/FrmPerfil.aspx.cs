using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

namespace CATALOGO_CLIENTES.Sources.Pages
{
    public partial class FrmPerfil : System.Web.UI.Page
    {

        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        public static int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = int.Parse(Session["usuariologueado"].ToString());
            if (Session["usuariologueado"]==null)
            {
                Response.Redirect("/Sources/Pages/FrmLogin.aspx");
            }
            else
            {
             
                    using (SqlCommand cmd=new SqlCommand("perfil", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if(dr.Read())
                        {
                            image.ImageUrl = "/Sources/Pages/FrmImagen.aspx?id="+id;
                            this.tbNombres.Text = dr["Nombres"].ToString();
                            this.tbApellidos.Text = dr["Apellidos"].ToString();
                            this.tbFecha.Text = dr["Fecha"].ToString();
                                 //tbFecha.Text = DateTime.Now.ToString("dd-MM-yyyy");
                            this.tbUsuario.Text = dr["Usuario"].ToString();
                            dr.Close();
                        }
                        con.Close();
                    }
            }
        }
        void MetodoOcultar()
        {
            if (contrasenia.Visible == false)
            {
                contrasenia.Visible = true;
                BtnGuardar.Visible = true;
                BtnCambiar.Text = "Cancelar";
                lblErrorClave.Text = "";
            }
            else
            {
                contrasenia.Visible = false;
                BtnGuardar.Visible = false;
                BtnCambiar.Text = "Cambiar contraseña";
                lblErrorClave.Text = "";
            }
        }

        protected void BtnAplicar_Click(object sender, EventArgs e)
        {
            int tamanioarchivo;
            byte[] imagen = FUImage.FileBytes;
            tamanioarchivo = int.Parse(FUImage.FileContent.Length.ToString());
            if (tamanioarchivo >= 2097151000)
            {
                lblError.Text = "el tamaño de la imagen debe ser menor a 10Mb!";
            }
            else if (FUImage.HasFile)
            {
                try
                {
                    using (con)
                    {
                        using (SqlCommand cmd = new SqlCommand("Cambiar imagen", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@imagen", SqlDbType.Image).Value = imagen;
                            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            lblError.Text = "";
                        }
                    }
                }

                catch (Exception exx)
                {
                    lblError.Text = exx.Message;
                }
            }
            else
            {
                lblError.Text = "No se ha cargado una imagen de perfil nueva!";
            }
        }

        protected void BtnCambiar_Click(object sender, EventArgs e)
        {
            MetodoOcultar();
        }

        protected void Eliminar (object sender, EventArgs e)
        {
            using (con)
            {
                using (SqlCommand cmd = new SqlCommand("Eliminar", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Session.Remove("usuariologueado");
                    Response.Redirect("/Sources/Pages/FrmLogin.aspx");
                } 
            }
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            string contraseniasinverificar = tbClave.Text;
            Regex letras = new Regex(@"[a-zA-Z]");
            Regex numeros = new Regex(@"[0-9]");
            Regex especiales = new Regex("[!\"#\\$%&'()*+,-./:;=?@\\[\\]{|}~]");

            if (tbClave.Text == "" || tbClave2.Text == "")
            {
                lblErrorClave.Text = "Los campos no pueden quedar vacíos!";
            }
            else if (tbClave.Text != tbClave2.Text)
            {
                lblErrorClave.Text = "Las contraseñas no coinciden!";
            }
            else if (!letras.IsMatch(contraseniasinverificar))
            {
                lblErrorClave.Text = "las contraseñas deben contener letras!";
            }
            else if (!letras.IsMatch(contraseniasinverificar))
            {
                lblErrorClave.Text = " las contraseñas deben contener numeros!";
            }
            else
            {
                try
                {
                    using (con)
                    {
                        using (SqlCommand cmd = new SqlCommand("CambiarContrasenia", con))
                        {
                            string patron = "InfoToolsSV";
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                            cmd.Parameters.Add("@Clave", SqlDbType.VarChar).Value = tbClave.Text;
                            cmd.Parameters.Add("@Patron", SqlDbType.VarChar).Value = patron;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            MetodoOcultar();
                            lblErrorClave.Text = "";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblErrorClave.Text = ex.Message;
                }


            }
        }

    }
}