<%@ Page Title="" Language="C#" MasterPageFile="~/Sources/Pages/MP.Master" AutoEventWireup="true" CodeBehind="FrmPerfil.aspx.cs" Inherits="CATALOGO_CLIENTES.Sources.Pages.FrmPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Mi perfil
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <fieldset class="row">
            <div class="container text-black-50 row">
                <div class="col-6 row justify-content-center">
                    <div class="align-items-center col-auto">
                        <fieldset>
                            <div class="row">
                                <asp:image runat="server" ID="image" CssClass="form-control img-thumbnail" Height="300" />
                            </div>
                            <br />
                             <di class="row"v>
                                <asp:Fileupload runat="server" ID="FUImage" CssClass="form-control form-control-sm" />
                            </di>
                            <br />
                             <div class="row">
                                <asp:Button runat="server" ID="BtnAplicar" CssClass="form-control btn btn-black" Text="Aplicar cambios" OnClick="BtnAplicar_Click" />
                            </div>
                        </fieldset>
                    </div>
                    <div class="row">
                        <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                    </div>
                </div>
                <div class="col-6 row justify-content-center">
                    <div class="align-items-center col-auto">
                        <fieldset>
                            <legend>
                               <i class="fa fa-database">Datos personales </i> 
                            </legend>
                            <asp:Table runat="server" Enabled="false">
                                <asp:tablerow>
                                    <asp:TableCell>  
                                        <asp:Label runat="server" CssClass="col-form-label" Text="Nombres:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button runat="server" CssClass="form-control" ID="tbNombres" />
                                    </asp:TableCell>
                                </asp:tablerow>
                                <asp:tablerow>
                                    <asp:TableCell> 
                                        <asp:Label runat="server" CssClass="col-form-label" Text="Apellidos:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell> 
                                        <asp:Button runat="server" CssClass="form-control" ID="tbApellidos" />
                                    </asp:TableCell>
                                </asp:tablerow>
                                <asp:tablerow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" CssClass="col-form-label" Text="Fecha de nacimiento:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell> 
                                        <asp:Button runat="server" CssClass="form-control" ID="tbFecha" />
                                    </asp:TableCell>
                                </asp:tablerow>
                            </asp:Table>
                        </fieldset>
                        <br />
                        <fieldset>
                            <legend>
                                <i class="fa fa-key">Datos de sesión</i>
                            </legend>
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" CssClass="col-form-label" Text="Usuario:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="tbUsuario" Enabled="false"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Button runat="server" CssClass="form-control btn btn-warning" ID="BtnCambiar" Text="Cambiar contraseña:" OnClick="BtnCambiar_Click"></asp:Button>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Button runat="server" CssClass="form-control btn btn-success" ID="BtnGuardar" Text="Guardar:" Onclick="BtnGuardar_Click" Visible="false" ></asp:Button>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <asp:Table runat="server" ID="contrasenia" Visible="false">
                                <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label runat="server" CssClass="col-form-label" Text="Contraseña:"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="tbClave" placeholder="New password:" TextMode="Password"></asp:TextBox>
                                </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                         <asp:Label runat="server" CssClass="col-form-label" Text="Repetir Contraseña:"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                         <asp:TextBox runat="server" CssClass="form-control" ID="tbClave2" placeholder="New password Again:" TextMode="Password"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <asp:Label runat="server" ID="lblErrorClave" CssClass="alert-danger"></asp:Label>
                        </fieldset>
                    </div>
                </div>
            </div>
        </fieldset>
        <br />
        <br />
        <div class="container d-flex justify-content-end">
            <asp:Button runat="server" class="btn btn-danger" Text="Eliminar Cuenta" OnClick="Eliminar" />
        </div>
    </div>
</asp:Content>
