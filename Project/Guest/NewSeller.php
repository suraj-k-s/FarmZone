<?php
include('../Assets/Connection/Connection.php');

if(isset($_POST["btnsave"]))
{
	$photo = $_FILES['filephoto']['name'];
	$path = $_FILES['filephoto']['tmp_name'];
	move_uploaded_file($path,"../Assets/Files/Seller/Photo/".$photo);
	
	$proof = $_FILES['fileproof']['name'];
	$pathproof = $_FILES['fileproof']['tmp_name'];
	move_uploaded_file($pathproof,"../Assets/Files/Seller/Proof/".$proof);
   
	$user="select * from tbl_user where user_email='".$_POST["txtemail"]."'";
	$uresult=$Conn->query($user);
	
	$farmer="select * from tbl_farmer where farmer_email='".$_POST["txtemail"]."'";
	$fresult=$Conn->query($farmer);
	
	$seller="select * from tbl_seller where seller_email='".$_POST["txtemail"]."'";
	$sresult=$Conn->query($seller);
	
	$admin="select * from tbl_admin where admin_email='".$_POST["txtemail"]."'";
	$adminresult=$Conn->query($admin);

	
	if($adminresult->num_rows>0 || $uresult->num_rows>0 || $fresult->num_rows>0 || $sresult->num_rows>0 )
	{
		?>
		<script>
        alert("Email Already Exist !!!");
        window.location="NewUser.php";
        </script>
    <?php
	}





	$insQry="insert into tbl_seller(seller_name,seller_email,seller_address,seller_contact,place_id,seller_password,seller_proof,seller_photo)values('".$_POST["txtname"]."','".$_POST["txtemail"]."','".$_POST["txtaddress"]."','".$_POST["txtcontact"]."','".$_POST["selplace"]."','".$_POST["txtpassword"]."','".$photo."','".$proof."')";
	if($Conn->query($insQry))
	{
		?>
        <script>
		alert("Data Inserted");
		</script>
        <?php
	}
}


?>
<?php
include("Head.php"); 
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<form action="" method="post" enctype="multipart/form-data" name="form1" id="form1">
  <table align="center" width="383" height="318" border="1">
   <tr>
      <td>District</td>
      <td><label for="sel_district"></label>
        <select name="sel_district" id="sel_district" onChange="getPlace(this.value)">
          <option>-----Select-----</option>

         
      <?php
					$selQuery="select * from tbl_district";
					$result=$Conn->query($selQuery);
					while($data=$result->fetch_assoc())
						{
	
			?>
            <option value="<?php echo $data['district_id']?>"><?php echo $data['district_name']?></option>
            
            <?php
						}
			?>
      </select></td>
    </tr>
    <tr>
      <td>Place</td>
      <td><p>
        <label for="txtplace"></label>
        <label for="selplace"></label>
        <select name="selplace" id="selplace">
         <option>-----Select-----</option>
        </select>
      </p></td>
    </tr>
    <tr>
      <td>Name</td>
      <td><label for="txtname"></label>
      <input type="text" name="txtname" id="txtname" required=""/></td>
    </tr>
    <tr>
      <td>Address</td>
      <td><label for="txtaddress"></label>
      <input type="text" name="txtaddress" id="txtaddress" required="" /></td>
    </tr>
    <tr>
      <td>Contact</td>
      <td><label for="txtcontact"></label>
      <input name="txtcontact" type="text" id="txtcontact" required="" pattern="([0-9]{10,10})"/></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><label for="txtemail"></label>
      <input type="email" name="txtemail" id="txtemail" required="" /></td>
    </tr>
   <tr>
      <td>Password</td>
      <td><label for="txtpassword"></label>
      <input name="txtpassword" type="password" id="txtpassword" required="" /></td>
    </tr>
    <tr>
      <td>Photo</td>
      <td><label for="fileimage"></label>
      <input name="filephoto" type="file" id="fileimage" required=""/></td>
    </tr>
    <tr>
      <td>Proof</td>
      <td><label for="fileproof"></label>
      <input type="file" name="fileproof" id="fileproof" required=""/></td>
    </tr>
    
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="btnsave" id="btnsave" value="Save" />
        <input type="reset" name="btncancel" id="btncancel" value="Cancel" />
      </div></td>
    </tr>
  </table>
</form>
</body>
<?php
include("Foot.php"); 
?>
<script src="../Assets/Jquery/jQuery.js"></script>
<script>
function getPlace(did)
{

	$.ajax({
	  url:"../Assets/AjaxPages/AjaxPlace.php?did="+did,
	  success: function(html){
		$("#selplace").html(html);
	  }
	});
}
</script>
</html>