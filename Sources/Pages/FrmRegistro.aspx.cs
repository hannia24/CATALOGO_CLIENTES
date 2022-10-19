using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Data;

namespace CATALOGO_CLIENTES.Sources.Pages
{
    public partial class FrmRegistro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void Cancelar(object sender, EventArgs e)
        {
            Response.Redirect("/Sources/Pages/FrmLogin.aspx");

        }
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        protected void Registrar(object sender, EventArgs e)
        {
            int tamanioimagen = int.Parse(FUImage.FileContent.Length.ToString());
            string contraseniasinverificar = tbClave.Text;
            Regex letras = new Regex(@"[a-zA-Z]");
            Regex numeros = new Regex(@"[0-9]");
            Regex especiales = new Regex("[!\"#\\$%&'()*+,-./:;=?@\\[\\]{|}~]");
            con.Open();
            SqlCommand usuario = new SqlCommand("ContarUsuario", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            usuario.Parameters.Add("@usuario", SqlDbType.VarChar).Value = tbUsuario.Text;
            int user = Convert.ToInt32(usuario.ExecuteScalar()); 
            if(tbNombres.Text==""||tbApellidos.Text==""||tbFecha.Text==""||tbUsuario.Text=="")
            {
                IblError.Text = "Los campos no pueden quear vacios!";
            }
            else if(user>=1)
            {
                IblError.Text = "el usuario"+tbUsuario.Text+" ya existe!";
            }
            else if(tbClave.Text!=tbClave2.Text)
            {
                IblError.Text = "Las contraseñas no coinciden!";
            }
            else if(!letras.IsMatch(contraseniasinverificar))
            {
                IblError.Text = "las contraseñas deben contener letras!";
            }
            else if (!numeros.IsMatch(contraseniasinverificar))
            {
                IblError.Text = " las contraseñas deben contener numeros!";
            }
            else if(!especiales.IsMatch(contraseniasinverificar))
            {
                IblError.Text = "No se ha cargadi una imagen de perfil";
            }
            else if (tamanioimagen>= 2097151000)
            {
                IblError.Text = "El tamaño de la imagen no puede ser mayor a 10Mb!";
            }
            else
            {
                byte[] imagen = FUImage.FileBytes;
                string patron = "InfoToolsSV";
                using (con)
                {
                    using (SqlCommand cmd=new SqlCommand("Registrar",con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@Nombres", SqlDbType.VarChar).Value = tbNombres.Text;
                        cmd.Parameters.Add("@Apellidos", SqlDbType.VarChar).Value = tbApellidos.Text;
                        cmd.Parameters.Add("@Fecha", SqlDbType.Date).Value = tbFecha.Text;
                        cmd.Parameters.Add("@Usuario", SqlDbType.VarChar).Value = tbUsuario.Text;
                        cmd.Parameters.Add("@Clave", SqlDbType.VarChar).Value = tbClave.Text;
                        cmd.Parameters.Add("@Patron", SqlDbType.VarChar).Value = patron;
                        cmd.Parameters.Add("@Imagen", SqlDbType.Image).Value = imagen;
                        cmd.Parameters.Add("@IdUsuario", SqlDbType.Int).Value = 0;
                        cmd.ExecuteNonQuery();
                    }
                    con.Close();
                    Response.Redirect("/Sources/Pages/FrmLogin.aspx");
                }
            }
        }
    }

}

