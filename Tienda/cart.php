<?php
  session_start();
  include './php/conexion.php';
  if(isset($_SESSION['carrito'])){
    if($_GET['id']){
      $arreglo=$_SESSION['carrito'];
      $encontro=false;
      $numero=0;
      for($i=0;$i<count($arreglo);$i++){
        if($arreglo[$i]['Id'] == $_GET['id']){
          $encontro= true;
          $numero=$i;
        }
      }
      if($encontro == true){
        $arreglo[$numero]['Cantidad'] = $arreglo[$numero]['Cantidad']+$_GET['cant'];
        $_SESSION['carrito']=$arreglo;
      }else{
        $nombre="";
        $precio="";
        $imagen="";
        $res = $conexion->query('select * from producto where idProducto='.$_GET['id']) or die($conexion->error);
        $fila = mysqli_fetch_row($res);
        $nombre=$fila[1];
        $precio=$fila[3];
        $imagen=$fila[6];
        $arregloNuevo = array(
          'Id'=>$_GET['id'],
          'Nombre'=>$nombre,
          'Precio'=>$precio,
          'Imagen'=>$imagen,
          'Cantidad'=>$_GET['cant']
        );
        array_push($arreglo,$arregloNuevo);
        $_SESSION['carrito']=$arreglo;
      }
    }
  }else{
    if(isset($_GET['id'])){
      $nombre="";
      $precio="";
      $imagen="";
      $res = $conexion->query('select * from producto where idProducto='.$_GET['id']) or die($conexion->error);
      $fila = mysqli_fetch_row($res);
      $nombre=$fila[1];
      $precio=$fila[3];
      $imagen=$fila[6];
      $arreglo[] = array(
        'Id'=>$_GET['id'],
        'Nombre'=>$nombre,
        'Precio'=>$precio,
        'Imagen'=>$imagen,
        'Cantidad'=>$_GET['cant']
      );
      $_SESSION['carrito']=$arreglo;
    }
  }
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Tienda </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
  </head>
  <body>
  
  <div class="site-wrap">
  <?php include("./layouts/header.php"); ?> 

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Imagen</th>
                    <th class="product-name">Producto</th>
                    <th class="product-price">Precio</th>
                    <th class="product-quantity">Cantidad</th>
                    <th class="product-total">Total</th>
                    <th class="product-remove">Quitar</th>
                  </tr>
                </thead>
                <tbody>
                <?php
                    if(isset($_SESSION['carrito'])){
                      $arreglocarrito=$_SESSION['carrito'];
                      //print_r($arreglocarrito);
                      for($i=0;$i<count($arreglocarrito);$i++){
                        //print_r($arreglocarrito[$i]);
                  ?>

                  <tr>
                    <td class="product-thumbnail">
                      <img src="images/<?php echo $arreglocarrito[$i]['Imagen']; ?>" alt="Image" class="img-fluid">
                    </td>
                    <td class="product-name">
                      <h2 class="h5 text-black"><?php echo $arreglocarrito[$i]['Nombre']; ?></h2>
                    </td>
                    <td><?php echo $arreglocarrito[$i]['Precio']; ?></td>
                    <td>
                      <div class="input-group mb-3" style="max-width: 120px;">
                        <div class="input-group-prepend">
                          <button class="btn btn-outline-primary js-btn-minus btnInc" type="button">&minus;</button>
                        </div>
                        <input type="text" class="form-control text-center txtCantidad"
                        data-precio= "<?php echo $arreglocarrito[$i]['Precio']; ?>"
                        data-id= "<?php echo $arreglocarrito[$i]['Id']; ?>"
                        value="<?php echo $arreglocarrito[$i]['Cantidad']; ?>" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                        <div class="input-group-append">
                          <button class="btn btn-outline-primary js-btn-plus btnInc" type="button">&plus;</button>
                        </div>
                      </div>

                    </td>
                    <td class="cant<?php echo $arreglocarrito[$i]['Id'];?>"><?php echo $arreglocarrito[$i]['Precio']*$arreglocarrito[$i]['Cantidad'];?></td>
                    <td><a href="#" class="btn btn-primary btn-sm btnEliminar" data-id="<?php echo $arreglocarrito[$i]['Id'] ?>">X</a></td>
                  </tr>
                  <?php
                      }
                    }
                  ?>

                </tbody>
              </table>
            </div>
          </form>
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6 mb-3 mb-md-0">
                <button class="btn btn-primary btn-sm btn-block">ACtualizar Carro</button>
              </div>
              <div class="col-md-6">
                <button class="btn btn-outline-primary btn-sm btn-block">Continuar Comprando</button>
              </div>
            </div>
            <!-- <div class="row">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">Coupon</label>
                <p>Enter your coupon code if you have one.</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
              </div>
              <div class="col-md-4">
                <button class="btn btn-primary btn-sm">Apply Coupon</button>
              </div>
            </div>
          </div> -->
          <div class="col-md-12 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Total del Carro</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">Subtotal</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">Q230.00</strong>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">Q230.00</strong>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-12">
                    <button class="btn btn-primary btn-lg py-3 btn-block" onclick="window.location='checkout.php'">Proceder al Cobro</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- <?php include("./layouts/footer.php"); ?>  -->
  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
  <script>
    $(document).ready(function(){
      $(".btnEliminar").click(function(event){
        event.preventDefault();
        var id = $(this).data('id');
        var boton = $(this);
        $.ajax({
          method: 'POST',
          url: './php/eliminarCarrito.php',
          data:{
            id:id
          }
        }).done(function(respuesta){
          //alert(respuesta);
          boton.parent('td').parent('tr').remove();
        });
      });
      $(".txtCantidad").keyup(function(){
        var cantidad = $(this).val();
        var precio = $(this).data('precio');
        var id = $(this).data('id');
        incrementar(cantidad, precio,id);
      });
      $(".btnInc").click(function(){
        var cantidad = $(this).parent('div').parent('div').find('input').val();
        var precio = $(this).parent('div').parent('div').find('input').data('precio');
        var id = $(this).parent('div').parent('div').find('input').data('id');
        incrementar(cantidad, precio,id);
      });
      function incrementar(cantidad, precio,id){
        var mult = parseFloat(cantidad)*parseFloat(precio);
        $(".cant"+id).text(mult);
        $.ajax({
          method: 'POST',
          url: './php/actualizar.php',
          data:{
            id:id, cantidad:cantidad
          }
        }).done(function(respuesta){
          //alert(respuesta);
          
        });
      }
    });
  </script>
    
  </body>
</html>