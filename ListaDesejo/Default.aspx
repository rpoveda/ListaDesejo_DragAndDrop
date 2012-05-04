<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ListaDesejoMistral.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lista de Desejos - Mistral</title>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.19.custom.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <link href="cs/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="cs/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $('.thumbnails > li').draggable({
                cursor: 'move',
                helper: 'clone',
                option: 'appendTo'
            });

            $('.well').droppable({
                accept: '.thumbnails li',
                drop: function (event, ui) {
                    var element = ui.draggable.clone();
                    element.find('.span3');
                    element.find('.label-important').css({ 'display': 'inline' }).append("<a href='#' class='delete_item' style='color:white'>Deletar</a>");
                    $('.repositorio').append(element).fadeIn(function() {
                        element.animate({ width: "150px" }, 'slow');
                    });
                }
            });

            $('.delete_item').live('click', function () {
                findItem($(this), 'span3').remove().fadeOut('slow');
                return false;
            });

            function findItem(obj, itemClass) {
                if (obj.hasClass(itemClass)) {
                    return obj;
                }
                else {
                    if (obj.parent() != null)
                        return findItem(obj.parent(), itemClass);
                    else
                        return null;
                }
            }
        });
    </script>
    <style type="text/css">
        body {
            padding: 20px 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div>
            <h1>
                Produtos</h1>
            <hr />
            <ul class="thumbnails">
                <asp:Repeater runat="server" ID="rptProdutos">
                    <ItemTemplate>
                        <li class="span3">
                            <div class="thumbnail">
                                <img alt='<%# DataBinder.Eval(Container.DataItem,"NomeProduto") %>' src='img/<%# DataBinder.Eval(Container.DataItem,"Img") %>' class='teste'/>
                                <div class="caption">
                                    <h5 class='h5'><%# DataBinder.Eval(Container.DataItem,"NomeProduto") %>
                                    <span class="label label-info"><%# DataBinder.Eval(Container.DataItem,"Valor") %></span><span class="label label-important" style='display: none'></span>
                                    </h5>
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        
        <div class="well" style="overflow: auto">
            <h1>Coloque seu produto aqui.</h1>
            <hr />
            <ul class="thumbnails repositorio">
                
            </ul>
        </div>

    </div>
    </form>
</body>
</html>
