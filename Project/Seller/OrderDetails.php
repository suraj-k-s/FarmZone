<?php
ob_start();
include("Head.php");
session_start();
include("../Assets/Connection/Connection.php");
$selQry="select *from tbl_sellerproductbooking b inner join tbl_sellercart c on c.spbooking_id=b.spbooking_id inner join tbl_sellerproduct p on p.sproduct_id=c.sproduct_id where p.seller_id='".$_SESSION["sid"]."' and b.spbooking_status!='0' and c.scart_status!='0'";
$res=$Conn->query($selQry);
if(isset($_GET["cid"]))

	{
		$upQry="update tbl_sellercart set scart_status='".$_GET["sts"]."' where scart_id='".$_GET["cid"]."' ";
		if($Conn->query($upQry))
		{
			?>
            <script>
				window.location="OrderDetails.php";
			</script>
            <?php
		}
	}
	?>
    
            	

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>


<body>
	<br><br><br><br><br>
<h1 align="center">Order Details</h1>
<div id="tab" align="center">
<div align="center">
  <table  border="1">
    <tr>
      <td>SlNo</td>
      <td>Name</td>
      <td>Photo</td>
      <td>Quantity</td>
      <td>Price</td>
      <td>Total Amount</td>
      <td>Action</td>
    </tr>
    <?php 
	$i=0;
	while($row=$res->fetch_assoc())
	{
		$quantity=$row["scart_quantity"];
		$price=$row["sproduct_rate"];
		$totalamount=$quantity*$price;
		$i++;
		?>
        <tr>
            <td><?php echo $i;?></td> 
            <td><?php echo $row["sproduct_name"];?></td> 
            <td><img src="../Assets/Files/Photo/<?php echo $row["sproduct_photo"];?>" width="47" /></td>
            <td><?php echo $row["scart_quantity"];?></td>
            <td><?php echo $row["sproduct_rate"];?></td>
            <td><?php echo $totalamount;?></td>
	        <td>
                <?php  if($row["spbooking_status"]==2 && $row["scart_status"]==1)
					{
						
						?>
                        payment completed /
                        <a href="OrderDetails.php?cid=<?php echo $row ["scart_id"];?>&sts=2">Pack product</a>
                        <?php 
					}
					else if($row["spbooking_status"]==2 && $row["scart_status"]==2)
					{
						?>
                        product packed /
                        <a href="OrderDetails.php?cid=<?php echo $row ["scart_id"];?>&sts=3">Ship Product</a>
                        <?php 
					}
					else if($row["spbooking_status"]==2 && $row["scart_status"]==3)
					{
						?>
                        product shipped /
                        <a href="OrderDetails.php?cid=<?php echo $row ["scart_id"];?>&sts=4">Product Delivered</a>
                        <?php 
					}
					else if($row["spbooking_status"]==2 && $row["scart_status"]==4)
					{
						?>
                       Order Completed
                        <?php 
					}
					?>
                    </td>
                    
				
       </tr>
<?php
	}
	?>
  </table>
</div>
</div>
</body>
<?php 
include("Foot.php");
ob_flush();
?>
</html>