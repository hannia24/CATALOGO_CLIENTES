<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmRegistro.aspx.cs" Inherits="CATALOGO_CLIENTES.Sources.Pages.FrmRegistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width-device-width; initial-scale=1.0" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
       <script src="../JavaScript/JavaScript.js"></script>
        <title>Registro de usuarios</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center">
            <div class="col-8">
                <div class="form-control card card-body">
                    <div class="row justify-content-center">
                        <asp:Label runat="server" CssClass="row justify-content-center h3">Registro de Usuarios</asp:Label>
                    </div>
                    <fieldset>
                        <legend class="row justify-content-center">Datos Personales</legend>
                        <div class="input-group">
                            <asp:Label ID="Label1" CssClass="form-control" runat="server" Text="Nombres:"></asp:Label>
                             <asp:TextBox ID="tbNombres" CssClass="form-control" runat="server" placeholder="ej. Hannia"></asp:TextBox>
                        </div>
                        <br />
                         <div class="input-group">
                            <asp:Label ID="Label2" CssClass="form-control" runat="server" Text="Apellidos:"></asp:Label>
                             <asp:TextBox ID="tbApellidos" CssClass="form-control" runat="server" placeholder="ej. Anota"></asp:TextBox>
                        </div>
                        <br />
                         <div class="input-group">
                            <asp:Label ID="Label3" CssClass="form-control" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
                             <asp:TextBox ID="tbFecha" CssClass="form-control" runat="server" placeholder="Date"></asp:TextBox>
                        </div>
                    </fieldset>
                    <br />
                    <fieldset>
                        <legend class="row justify-content-center">Datos de inicio de sesión</legend>
                        <div class="input-group">
                          <asp:Label ID="Label4" CssClass="form-control" runat="server" Text="Usuario:"></asp:Label>
                             <asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" placeholder="ej. Hannia"></asp:TextBox>
                        </div>
                        <br />
                         <div class="input-group">
                          <asp:Label ID="Label5" CssClass="form-control" runat="server" Text="Contraseña:"></asp:Label>
                             <asp:TextBox ID="tbClave" CssClass="form-control" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                            </div>
                        <br />
                        <div class="input-group">
                          <asp:Label ID="Label6" CssClass="form-control" runat="server" Text="Repetir Contraseña:"></asp:Label>
                             <asp:TextBox ID="tbClave2" CssClass="form-control" runat="server" TextMode="Password" placeholder="Password Again"></asp:TextBox>
                            </div>
                        <br />
                        <div class="row justify-content-center">
                          <asp:Image runat="server" CssClass="img-thumbnail" Width="150" Height="150" ImageUrl="../imagenes/add-img.png" />
                            </div>
                        <div class="row justify-content-center"> 
                            <asp:FileUpload runat="server" CssClass="small form-control" ID="FUImage"  onchange="mostrarimagen(this)"/>
                        </div>
                    </fieldset>
                    <br />
                    <asp:Label runat="server" CssClass="alert-danger" ID="IblError"></asp:Label>
                    <br />
                    <div class="row">
                        <asp:Button runat="server" CssClass="form-control btn btn-success" text="Completar Registro" OnClick="Registrar" />
                        <br />
                         <asp:Button runat="server" CssClass="form-control btn btn-warning" text="Cancelar" OnClick="Cancelar" />
                    </div>
                </div>
            </div>
        </div>    
        
    </form>
</body>
</html>
