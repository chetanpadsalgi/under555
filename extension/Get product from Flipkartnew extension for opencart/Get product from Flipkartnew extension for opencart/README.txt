/******************  INSTALLATION  ********************/

copy ALL from "upload" folder into your opencart installation root (the directory where your opencart is installed)
"Get product from Flipkartnew" is now installed on your store

note, that this extension requires VQMOD installed

if you have no VQMOD and you have no idea how to get it, here are 3 variants to resolve this:
	1) contact phenomena44@gmail.com and i will install and test this application on your side for you (this is completely free)
	2) or use this tutorial to install VQMOD: https://code.google.com/p/vqmod/wiki/Install_OpenCart
	3) or use the manual installation of this extension without VQMOD (see below)
 
/**************** MANUAL INSTALLATION *******************/
			 
open file /admin/controller/catalog/product.php
FIND: 
	public function insert() {
				   
REPLACE WITH: 
	public function insert() {
		$this->document->addScript('/getSingleProduct/js/flipkartnew.js');
							
FIND: 
	public function update() {
				   
REPLACE WITH: 
	public function update() {
	$this->document->addScript('/getSingleProduct/js/flipkartnew.js');
					



			 
			 
/****************  USAGE *******************/
			 
	Now, go to admin panel -> catalog -> products -> insert 
	below the "Product Name" field in the General Tab you will see "Get product from Flipkartnew" link

			 		 
			 
/******************  SPECIAL CASES  ********************/

1) if your opencart store is installed NOT into the domain root folder ("public_html" folder as a usual), but in some subdirectory (for example http://yourdomain.com/store/), do the following:
	
	open file: /getSingleProduct/js/flipkartnew.js
	FIND ALL: GetSingleProduct_flipkartnew.rootLocation = "";
    REPLACE  WITH: GetSingleProduct_flipkartnew.rootLocation = "/{YOUR_OPENCART_SUBFOLDER_LOCATION}";
	
	if you installing it via vqmod:
	open file /{YOUR_OPENCART_SUBFOLDER_LOCATION}/vqmod/xml/get_the_product_from_flipkartnew.xml
	FIND: /getSingleProduct/
	REPLACE WITH: /{YOUR_OPENCART_SUBFOLDER_LOCATION}/getSingleProduct/ 
	
	if you installing it manually:
	open file /{YOUR_OPENCART_SUBFOLDER_LOCATION}/admin/controller/catalog/product.php
	FIND: /getSingleProduct/
	REPLACE WITH: /{YOUR_OPENCART_SUBFOLDER_LOCATION}/getSingleProduct/ 
	
	
2) if you have renamed your admin folder, do the following:

	open file: /getSingleProduct/js/flipkartnew.js
	FIND ALL: GetSingleProduct_flipkartnew.adminLocation = "admin";
    REPLACE  WITH: GetSingleProduct_flipkartnew.adminLocation = "{YOUR_ADMIN_LOCATION_FOLDER_NAME}";
	
	
/******************  MIJOSHOP INSTALLATION  ********************/
copy ALL from "upload" folder into the "/components/com_mijoshop/opencart/" folder of your mijoshop installation root

open file "/components/com_mijoshop/opencart/getSingleProduct/js/flipkartnew.js"
FIND: GetSingleProduct_flipkartnew.mijoshopInstallation = 0;
REPLACE  WITH: GetSingleProduct_flipkartnew.mijoshopInstallation = 1;

open file "/components/com_mijoshop/opencart/vqmod/xml/get_the_product_from_flipkartnew.xml"
FIND ALL: $this->document->addScript('/getSingleProduct
REPLACE  WITH: JFactory::getDocument()->addScript('/components/com_mijoshop/opencart/getSingleProduct


	
	
/****************  CONTACT FOR SUPPORT *******************/
feel free to contact phenomena44@gmail.com if you have any problems using this extension