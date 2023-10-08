<?php
ob_start();
include("Head.php");
session_start();
include("../Assets/Connection/Connection.php");
	{
		$selQry="select * from tbl_sellerproductbooking b inner join tbl_sellercart c on c.spbooking_id = b.spbooking_id inner join  tbl_sellerproduct p on p.sproduct_id = c.sproduct_id inner join tbl_seller k on k.seller_id=p.seller_id where farmer_id='".$_SESSION["fid"]."' and spbooking_status>0 and scart_status>0"; 
	$res=$Conn->query($selQry);
	?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<br><br><br><br><br>
	<div id="tab" align="center">
<form id="form1" name="form1" method="post" action="">
<table border="1">
  <tr>
    <td>SlNo</td>
    <td>Name</td>
    <td>Photo</td>
    <td>Quantity</td>
    <td>Total amount</td>
    <td>seller Name</td>
    <td>Status</td>
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
    <td><?php echo  "$totalamount";?></td>
    <td><?php echo $row["seller_name"];?></td>
	<td>
    <?php 
	      if($row["spbooking_status"]==1 && $row["scart_status"]==1)
					{
						?>
                        payment Pending 
                        <?php 
					}
					else if($row["spbooking_status"]==2 && $row["scart_status"]==1)
					{
						?>
                      Payment Completed
                       
                        <?php 
					}
					else if($row["spbooking_status"]==2 && $row["scart_status"]==2)
					{
						?>
                       Product Packed
                      
                        <?php 
					}
					else if($row["spbooking_status"]==2 && $row["scart_status"]==3)
					{
						?>
                      Product Shipped
                        <?php 
					}
					else if($row["spbooking_status"]==2 && $row["scart_status"]==4)
					{
						?>
                           Order Completed /
                           
                           <a href="bill.php?id=<?php echo $row["scart_id"]; ?>">Bill</a>
                        <?php 
					}
					?>
                    </td>
                    
					
       </tr>
<?php
	}
	}
	
	?>
    
</table>

</form>
	</div>
</body>
<?php
include("Foot.php");
ob_flush();
?>
</html>