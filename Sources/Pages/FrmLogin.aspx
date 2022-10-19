<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="CATALOGO_CLIENTES.Sources.Pages.FrmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <meta name="viewport" content="width-device-width; initial-scale=1.0" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <title>Inicio de sesión</title>
</head>
<body>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

    <form id="FrmLogin" runat="server" class="container d-flex justify-content-center align-items-center">
        <div class="col-5">
            <div class="form-control card card-body align-items-center">
                <div class="modal-title align-items-center h3"
                <asp:Label runat="server" Text="Inicio de sesión" Font-Size="Larger"></asp:Label>
            </div>
            <br />
            <div class="input-group">
                <asp:TextBox runat="server" CssClass="form-control" placeholder="User" ID="tbUsuario"></asp:TextBox>
            </div>
                 <br />
                 <br />
                 <br />
             <div class="input-group">
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Password"  TextMode="Password" ID="tbClave"></asp:TextBox>
            </div>
            <br />
                 <br />
                 <br />
                 <br />
            <div class="input-group">
                <asp:TextBox runat="server" CssClass="form-control btn btn-dark" Text="LOGIN" OnClick="Iniciar"></asp:TextBox>
            </div>
            <br />
            <br />
            <div>
                <asp:Label runat="server" ID="lblError" CssClass="alert-danger"></asp:Label>
                <br />
                <asp:Label runat="server" Text="¿No tienes cuenta?, Registrate"></asp:Label>
                 <asp:LinkButton runat="server" Text="Aqui" OnClick="Registrarse"></asp:LinkButton>
            </div>
        </div>
        <div>
        </div>
    </form>
</body>
</html>
