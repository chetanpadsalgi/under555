GetSingleProduct_flipkart = {};
if (window.isset == undefined) {
    window.isset = function(val) {
        try {
            eval('window.isset.tmp='+val);
            return (window.isset.tmp != undefined && window.isset.tmp != null);
        } catch(e) {
            return false;
        }
    }

}

/*  CUSTOM SETTINGS THERE */
if(!isset("GetSingleProduct_assembly") || !isset("GetSingleProduct_assembly.rootLocation") || !isset("GetSingleProduct_assembly.adminLocation") ){
	GetSingleProduct_flipkart.rootLocation = "";
	GetSingleProduct_flipkart.adminLocation = "admin";
}else{
	GetSingleProduct_flipkart.rootLocation = GetSingleProduct_assembly.rootLocation;
	GetSingleProduct_flipkart.adminLocation = GetSingleProduct_assembly.adminLocation;
}
GetSingleProduct_flipkart.imageFolderName = "";
/*  END OF CUSTOM SETTINGS */




/* SYSTEM SETTINGS */
GetSingleProduct_flipkart.marketName = "Flipkart";
GetSingleProduct_flipkart.ParsingScriptName = "flipkart";
GetSingleProduct_flipkart.IDENTIFIER = "flipkart";
GetSingleProduct_flipkart.semafor = 0;
GetSingleProduct_flipkart.tempStore = "";
GetSingleProduct_flipkart.lastImageNum = 0;
GetSingleProduct_flipkart.ocVersion = 5;
// unique for each donor market
GetSingleProduct_flipkart.fields = {
								"title" : 'Get Product Name (will appear in the "General" tab)',
								"spec" : 'Get Product Specification (will appear in the "General" tab)',
								"desc" : 'Get Meta Tag Description (will appear in the "General" tab)',
								"keywords" : 'Get Meta Tag Keywords (will appear in the "General" tab)',
								"price" : 'Get Price (will appear in the "Data" tab)',
								"images" : 'Get All Images (will appear in the "Image" tab)',
								};



/*
 *  при обновлении модулей этот блок копируется только с заменой IDENTIFIER
 */
/**************************   BEGIN OF PROTOTYPE BLOCK  *************************************/
if(isset("GetSingleProduct_assembly.rootLocation")) {GetSingleProduct_flipkart.rootLocation = GetSingleProduct_assembly.rootLocation;};
if(isset("GetSingleProduct_assembly.adminLocation")) {GetSingleProduct_flipkart.adminLocation = GetSingleProduct_assembly.adminLocation};
if(isset("GetSingleProduct_assembly.mijoshopInstallation")) {GetSingleProduct_flipkart.mijoshopInstallation = GetSingleProduct_assembly.mijoshopInstallation};
if(GetSingleProduct_flipkart.mijoshopInstallation > 0){
	GetSingleProduct_flipkart.adminLocation = "administrator";
}

GetSingleProduct_flipkart.LANG_IDS = new Array();
GetSingleProduct_flipkart.imageSystemLocation = 'data';
GetSingleProduct_flipkart.imageMijoshopLocation = '';
if(GetSingleProduct_flipkart.mijoshopInstallation > 0){
	GetSingleProduct_flipkart.imageMijoshopLocation = "/components/com_mijoshop/opencart";
}

GetSingleProduct_flipkart.initialForm_flipkart = '<div><p id="SPS_dialog_body_flipkart">URL: <input type="text" id="flipkart_import_parse_url" style="width:400px;" /><br /><br /><br />';
jQuery.each( GetSingleProduct_flipkart.fields, function( key, value ) {
	GetSingleProduct_flipkart.initialForm_flipkart += '<input type="checkbox" id="flipkart_import_parse_' + key + '" checked="checked"/>&nbsp;&nbsp;&nbsp;';
	GetSingleProduct_flipkart.initialForm_flipkart += '<label for="flipkart_import_parse_' + key + '">' + value + '</label><br /><br />';
	});
GetSingleProduct_flipkart.initialForm_flipkart += '<br /><input type="checkbox" id="flipkart_import_allLanguages" checked="checked"/>&nbsp;&nbsp;&nbsp;'
GetSingleProduct_flipkart.initialForm_flipkart += '<label for="flipkart_import_allLanguages"><b>Insert grabbed data in ALL language tabs</b></label><br />';
GetSingleProduct_flipkart.initialForm_flipkart += '<br /><input type="checkbox" id="flipkart_import_createSEO" checked="checked"/>&nbsp;&nbsp;&nbsp;'
GetSingleProduct_flipkart.initialForm_flipkart += '<label for="flipkart_import_createSEO"><b>Create SEO URL from product title</b></label><br /><br />';
GetSingleProduct_flipkart.initialForm_flipkart += '</p></div>';


if(jQuery.ui == undefined){
	document.write('<script type="text/javascript" src="../..' + GetSingleProduct_flipkart.rootLocation + '/getSingleProduct/js/jquery_ui/jquery-ui.min.js"></script>');
	document.write('<link type="text/css" href="../..' + GetSingleProduct_flipkart.rootLocation + '/getSingleProduct/js/jquery_ui/jquery-ui.min.css" rel="stylesheet" />');
}

jQuery(document).ready(function(){
	// get oc version
	var ver = 0;
	var getBootstr = 0;
	try { ver = jQuery("#footer").html().indexOf(" 1.4"); } catch(err){}
	if(ver > 1){ GetSingleProduct_flipkart.ocVersion = 4; }
	try { ver = jQuery("#footer").html().indexOf(" 2."); } catch(err){}
	if(ver > 1){ GetSingleProduct_flipkart.ocVersion = 2; }
	try { getBootstr = jQuery("html").html().indexOf("bootstrap.min.js"); } catch(err){}
	if(getBootstr > 1){ GetSingleProduct_flipkart.ocVersion = 2; }
	
	
	// элементы к которому цепляем ссылку
	GetSingleProduct_flipkart.targetElementWrapper = 'table.form';
	GetSingleProduct_flipkart.targetElement = 'span.required:first';
	if(GetSingleProduct_flipkart.ocVersion == 2){
		GetSingleProduct_flipkart.targetElementWrapper = 'div.tab-pane';
		GetSingleProduct_flipkart.targetElement = 'label.control-label:first';
	}
	
	if(GetSingleProduct_flipkart.ocVersion == 2){
		GetSingleProduct_flipkart.imageSystemLocation = 'catalog';
	}


	GetSingleProduct_flipkart.tabGeneral = "tab-general";
	if(jQuery("#" + GetSingleProduct_flipkart.tabGeneral).html() == null){
		GetSingleProduct_flipkart.tabGeneral = "tab_general";
	}
	GetSingleProduct_flipkart.tabData = "tab-data";
	if(jQuery("#" + GetSingleProduct_flipkart.tabData).html() == null){
		GetSingleProduct_flipkart.tabData = "tab_data";
	}
	// если tabData вообще не находим то всё лепим в tabGeneral
	if(jQuery("#" + GetSingleProduct_flipkart.tabData).html() == null){
		GetSingleProduct_flipkart.tabData = GetSingleProduct_flipkart.tabGeneral;
	}
	
	jQuery("#" + GetSingleProduct_flipkart.tabGeneral + " " + GetSingleProduct_flipkart.targetElementWrapper).find(GetSingleProduct_flipkart.targetElement).parent().append('<br />&nbsp;<a onclick="parse_flipkart(jQuery(this));" style="cursor:pointer;">Get product from ' + GetSingleProduct_flipkart.marketName + '</a>');
	jQuery("#" + GetSingleProduct_flipkart.tabData).append('<div id="dialog_flipkart_import" title="Copy product URL from ' + GetSingleProduct_flipkart.marketName + '"></div>');
	
	// get token
	var href = jQuery("li#dashboard a").attr("href");
	GetSingleProduct_flipkart.token = href.substr( href.indexOf("token=") + 6);

});


function parse_flipkart(obj){
	var lang_id = get_current_lang_flipkart(obj);
	jQuery( "#dialog_flipkart_import" ).html(GetSingleProduct_flipkart.initialForm_flipkart);
	if(GetSingleProduct_flipkart.ocVersion > 4){
		jQuery( "#dialog_flipkart_import" ).dialog({ width: 530 ,
												buttons: [{
		                                                  	text: "Get this product",
		                                                  	click: function() { get_form_data_flipkart(lang_id); }
		                                                  },{
		                                                	text: "Cancel",
		                                                    click: function() { if(GetSingleProduct_flipkart.semafor < 1){ jQuery(this).dialog("close");} }
		                                       }]});
		
	}else{
		jQuery( "#dialog_flipkart_import" ).dialog({ width: 530 ,
											buttons: {
		                                    	"Get this product": function() { get_form_data_flipkart(lang_id); },
		                                        "Cancel" : function() { if(GetSingleProduct_flipkart.semafor < 1){ jQuery(this).dialog("close");} }
		                                    }
										});
	}
}


function get_current_lang_flipkart(obj){
	if(GetSingleProduct_flipkart.ocVersion == 2){
		var res = obj.parent().parent().attr("id");
		res = SPS_flipkart_parse_str_replace("language" , "" , res);
		return res;
	}else{
		var attrName = obj.parent().parent().parent().find("td input:first").attr("name");
		var res = SPS_flipkart_parse_explode("description[" , attrName);
		if(res.length > 1){
			res = SPS_flipkart_parse_explode("]" , res[1]);
			if(res.length > 1){
				return res[0];
			}
		}
	}
	return 1;
}


function get_all_langsIDS_flipkart(){
	var RES_LANG_IDS = [];
	var targetList = 'div#languages a';
	if(GetSingleProduct_flipkart.ocVersion < 3){
		targetList = 'ul#language a';
	}
	jQuery(targetList).each(function(){
		var href = jQuery(this).attr("href");
		var id = href.substr(9);
		if(parseInt(id) > 0){
			RES_LANG_IDS.push(id);
		}
	});
	return RES_LANG_IDS;
}


function get_form_data_flipkart(lang_id){
	if(GetSingleProduct_flipkart.semafor < 1){
		
		var url = jQuery("#flipkart_import_parse_url").val();
		//console.log("url:" + url);
		switch(GetSingleProduct_flipkart.ocVersion){
			case 4:
			jQuery.each( GetSingleProduct_flipkart.fields, function( key, value ) {
				eval('window.' + key + ' = jQuery("#flipkart_import_parse_' + key + '").attr("checked") == true?"on":"off";');
			});
			var import_createSEO = jQuery("#flipkart_import_createSEO").attr("checked") == true?1:0;
			var import_allLanguages_flipkart = jQuery("#flipkart_import_allLanguages").attr("checked") == true?1:0;
			break;
			case 5:
			jQuery.each( GetSingleProduct_flipkart.fields, function( key, value ) {
				eval('window.' + key + ' = jQuery("#flipkart_import_parse_' + key + '").attr("checked") == "checked"?"on":"off";');
			});
			var import_createSEO = jQuery("#flipkart_import_createSEO").attr("checked") == "checked"?1:0;
			var import_allLanguages_flipkart = jQuery("#flipkart_import_allLanguages").attr("checked") == "checked"?1:0;
			break;
			case 2:
			jQuery.each( GetSingleProduct_flipkart.fields, function( key, value ) {
				eval('window.' + key + ' = jQuery("#flipkart_import_parse_' + key + '").prop("checked") == true?"on":"off";');
			});
			var import_createSEO = jQuery("#flipkart_import_createSEO").prop("checked") == true?1:0;
			var import_allLanguages_flipkart = jQuery("#flipkart_import_allLanguages").prop("checked") == true?1:0;
			break;
		}
		
		GetSingleProduct_flipkart.LANG_IDS = [];
		if(import_allLanguages_flipkart > 0){
			GetSingleProduct_flipkart.LANG_IDS = get_all_langsIDS_flipkart();
		}else{
			GetSingleProduct_flipkart.LANG_IDS.push(lang_id);
		}
		
		if(images == "on"){
			// COUNT IMAGES EXISTS 
			var img_exists = jQuery("div.image img");
			jQuery.each( img_exists, function( key, value ) {
				var id = this.id;
				if(id.length > 5){
					var num_id = id.substr(5);
					if(jQuery.isNumeric(num_id) == true){
						GetSingleProduct_flipkart.lastImageNum = GetSingleProduct_flipkart.lastImageNum + 1;
					}
					//jQuery('#image-row'+num_id).remove();
				}
			});
		}
		
		
		
		var product_name = parseName_flipkart(url);
		if(product_name !== false){
			GetSingleProduct_flipkart.tempStore = jQuery("#SPS_dialog_body_flipkart").html();
			GetSingleProduct_flipkart.semafor = 1;
			jQuery("#SPS_dialog_body_flipkart").html('<div style="width:100%;text-align:center;">Please, wait. This may take several minutes...</div>');
			
			// create  product images folder from here
			var folder = GetSingleProduct_flipkart.imageFolderName + get_folder_name_flipkart(product_name) + "" + Math.floor(Math.random()* 100000);
			var newFolderSystemPath = 'index.php?route=common/filemanager/create&token=';
			if(GetSingleProduct_flipkart.ocVersion < 3){
				newFolderSystemPath = 'index.php?route=common/filemanager/folder&token=';
			}
			if(GetSingleProduct_flipkart.mijoshopInstallation > 0){
				newFolderSystemPath = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=common/filemanager/create&token=';
			}
			if(GetSingleProduct_flipkart.ocVersion < 3){
				var folderPath = GetSingleProduct_flipkart.rootLocation + "/" + GetSingleProduct_flipkart.adminLocation + "/" + newFolderSystemPath + GetSingleProduct_flipkart.token + "&directory=";
				var folderData = {"folder" : folder};
			}else{
				var folderPath = GetSingleProduct_flipkart.rootLocation + "/" + GetSingleProduct_flipkart.adminLocation + "/" + newFolderSystemPath + GetSingleProduct_flipkart.token;
				var folderData = {"directory" : "" , "name" : folder};
			}
			
			// CREATE FOLDER QUERY
			jQuery.post(folderPath , folderData , function(data){
				var oData = data;
				/* для такой ошибки: <b>Warning</b>: mkdir(): Permission denied in <b>vq2-admin_controller_common_filemanager.php</b> on line <b>190</b>{"success":"Success: Directory created!"} */
				var error_on_creating_folder = 0
				if( typeof oData == "string" && ( oData.indexOf('success":"Success: Directory created!"}') > 1 || oData.indexOf('A file or directory with the same name already exists') > 1) ){
					error_on_creating_folder = 1;
				}
				if(oData.success == undefined  && error_on_creating_folder < 1 ){
					eval("var oData = " + data + ";");
				}
				if(oData.error !== undefined){
					// console.log("oData.error trying to create the folder");
					error_on_creating_folder = 1;
				}
				if(oData.success !== undefined || error_on_creating_folder > 0 ){
					var parseScriptLocationSystemPath = '';
					if(GetSingleProduct_flipkart.mijoshopInstallation > 0){
						parseScriptLocationSystemPath = '/components/com_mijoshop/opencart';
					}
					var parsingPath = GetSingleProduct_flipkart.rootLocation + parseScriptLocationSystemPath + "/getSingleProduct/" + GetSingleProduct_flipkart.ParsingScriptName + ".php";
					var parsingData = {
								"token" : GetSingleProduct_flipkart.token ,
								"tempdir" : folder,
								"imageLocation" : GetSingleProduct_flipkart.imageSystemLocation,
								"data[url]" : url,
								};
					jQuery.each( GetSingleProduct_flipkart.fields, function( key, value ) {
								eval('parsingData["data[" + key + "]"] = window.' + key + ';');
							});
					//console.log(parsingData);
					
					// SCRAPE DONOR MARKET QUERY
					jQuery.post(parsingPath , parsingData , function(data){
						var oData = data;
						if(oData.title == undefined && oData.spec == undefined && oData.main_image == undefined && oData.desc == undefined && oData.price == undefined && oData.keywords == undefined && oData.model == undefined && oData.sku == undefined){
							//console.log("beg");
							eval('var oData = ' + data + ';');
						}
						if(oData.title == undefined && oData.spec == undefined && oData.main_image == undefined && oData.desc == undefined && oData.price == undefined && oData.keywords == undefined && oData.model == undefined && oData.sku == undefined){
								alert("Cannot grab this product. Contact the developer for help.");
								jQuery("#SPS_dialog_body_flipkart").html(GetSingleProduct_flipkart.tempStore);
						}else{
							// INSERT DATA INTO PRODUCT FORM
							jQuery.each( GetSingleProduct_flipkart.fields, function( key, value ) {
								eval("var datakey = oData." + key + ";"); 
								eval("var windowkey = window." + key + ";"); 
								if(datakey !== undefined && windowkey == "on"){
									switch(key){
										// TITLE
										case 'title':
											jQuery.each( GetSingleProduct_flipkart.LANG_IDS, function( key, val ) {
												jQuery("input[name='product_description["+val+"][name]']").val(oData.title);
												jQuery("input[name='product_description["+val+"][meta_title]']").val(oData.title);
											});
											if(import_createSEO > 0){
												jQuery("input[name='keyword']").val( SPS_flipkart_prepare_seokeys(oData.title) );
											}
											break;
										// META DESCRIPTION
										case 'desc':
											jQuery.each( GetSingleProduct_flipkart.LANG_IDS, function( key, val ) {
												jQuery("textarea[name='product_description["+val+"][meta_description]']").html(oData.desc);
											});
											break;
										// META KEYWORDS
										case 'keywords':
											if(GetSingleProduct_flipkart.ocVersion !== 4){
												jQuery.each( GetSingleProduct_flipkart.LANG_IDS, function( key, val ) {
													jQuery("textarea[name='product_description["+val+"][meta_keyword]']").html(oData.keywords);
												});
											}else{
												jQuery.each( GetSingleProduct_flipkart.LANG_IDS, function( key, val ) {
													jQuery("textarea[name='product_description["+val+"][meta_keywords]']").html(oData.keywords);
												});
											}
											jQuery.each( GetSingleProduct_flipkart.LANG_IDS, function( key, val ) {
												jQuery("input[name='product_description["+val+"][tag]']").val(oData.keywords);
											});
											if(GetSingleProduct_flipkart.ocVersion !== 4){
												jQuery.each( GetSingleProduct_flipkart.LANG_IDS, function( key, val ) {
													jQuery("input[name='product_tag["+val+"]']").val(oData.keywords);
												});
											}else{
												jQuery.each( GetSingleProduct_flipkart.LANG_IDS, function( key, val ) {
													jQuery("input[name='product_tags["+val+"]']").val(oData.keywords);
												});
											}
											break;
										// DESCRIPTION
										case 'spec':
											try { 
												jQuery.each( GetSingleProduct_flipkart.LANG_IDS, function( key, val ) {
													jQuery("td#cke_contents_description" + val + " iframe").contents().find("body").html(oData.spec);
													jQuery("textarea#input-description" + val).parent().find("div.note-editor div.note-editable").html(oData.spec);
												});
												if(import_allLanguages_flipkart > 0){
													jQuery("iframe").contents().find("body").html(oData.spec);
												}else{
													try {
														var findID = 0;
														jQuery("iframe").each(function(){ 
															var ifrTITLE = jQuery(this).attr("title");
															var ifrID = SPS_flipkart_parse_explode("description" , ifrTITLE);
															if(ifrID.length > 1){
																ifrID = ifrTITLE.substr(ifrTITLE.indexOf("description") + 11);
																if(ifrID == lang_id){
																	jQuery(this).contents().find("body").html(oData.spec);
																	findID = 1;
																}
															}
														});
														// не нашли ар
														if(findID < 1){
															jQuery("iframe").contents().find("body").html(oData.spec);
														}
													}catch(err){}
												}
											} 
											catch(err){}
											break;
										// PRICE
										case 'price':
											jQuery("input[name='price']").val(oData.price);
											break;
										// MODEL
										case 'model':
											jQuery("input[name='model']").val(oData.model);
											break;
										// SKU
										case 'sku':
											jQuery("input[name='sku']").val(oData.sku);
											break;
										// UPC
										case 'upc':
											jQuery("input[name='upc']").val(oData.upc);
											break;
											
										// WEIGHT
										case 'weight':
											jQuery("input[name='weight']").val(oData.weight);
											break;
										// LENGTH
										case 'length_':
											jQuery("input[name='length']").val(oData.length_);
											break;
										// WIDTH
										case 'width':
											jQuery("input[name='width']").val(oData.width);
											break;
										// HEIGHT
										case 'height':
											jQuery("input[name='height']").val(oData.height);
											break;
											
										/*case 'sku':
											jQuery("input[name='sku']").val(oData.sku);
											break;
											*/
										default:
											break;
									}
								}
							});
			
							// main image
							var main_image = oData.main_image;
							if(main_image !== undefined){
								if(main_image.length > 0){
									var main_path = GetSingleProduct_flipkart.rootLocation + GetSingleProduct_flipkart.imageMijoshopLocation + "/image/" + GetSingleProduct_flipkart.imageSystemLocation + "/" + folder + "/main." + oData.main_image;
									jQuery("img#thumb").attr("src" , main_path);
									jQuery("img#preview").attr("src" , main_path);
									jQuery("input#image").val( GetSingleProduct_flipkart.imageSystemLocation + "/" + folder + "/main." + oData.main_image);
									// version 2
									jQuery("a#thumb-image img").attr("src" , main_path);
									jQuery("input#input-image").val(GetSingleProduct_flipkart.imageSystemLocation + "/" + folder + "/main." + oData.main_image);
								}
							}
							// other images
							var other_images = oData.other_images;
							if(other_images !== undefined && images == "on"){
								if(other_images.length > 0){
									var last_image_num = GetSingleProduct_flipkart.lastImageNum;
									for(var oth = last_image_num; oth < (other_images.length + last_image_num); oth++){
										addImage();
										var other_path = GetSingleProduct_flipkart.rootLocation + GetSingleProduct_flipkart.imageMijoshopLocation + "/image/" + GetSingleProduct_flipkart.imageSystemLocation + "/" + folder + "/" + parseInt(oth - last_image_num  + 1) + "." + oData.other_images[oth - last_image_num];
										jQuery("img#thumb"+oth).attr("src"  , other_path);
										jQuery("img#preview"+oth).attr("src"  , other_path);
										jQuery("input#image"+oth).val(GetSingleProduct_flipkart.imageSystemLocation + "/" + folder + "/" + parseInt(oth - last_image_num  + 1) + "." + oData.other_images[oth - last_image_num]);
										// version 2
										jQuery("a#thumb-image" + oth + " img").attr("src"  , other_path);
										jQuery("input#input-image"+oth).val(GetSingleProduct_flipkart.imageSystemLocation + "/" + folder + "/" + parseInt(oth - last_image_num  + 1) + "." + oData.other_images[oth - last_image_num]);
										
									}
								}
							}
							jQuery( "#dialog_flipkart_import" ).dialog('close');
							
						}
						GetSingleProduct_flipkart.semafor = 0;
					});
				}else{
					// TODO: cant create directory
					alert("Can`t create directory for images!");
					jQuery( "#dialog_flipkart_import" ).dialog('close');
				}
			});
		}else{
			alert("Can`t parse from this Url. Try another one.");
			jQuery( "#dialog_flipkart_import" ).dialog('close');
		}
	}
	GetSingleProduct_flipkart.semafor = 0;
}


function get_folder_name_flipkart(name){
	var out = name;
	var res = SPS_flipkart_parse_explode(" " , name);
	if(res.length > 5){
		out = res[0] + ' ' + res[1] + ' ' + res[2] + ' ' + res[3] + ' ' + res[4] + ' ' + res[5];
	}
	out = out.replace(/[^a-z0-9-\s]/gi, '').replace(/[_\s]/g, '-');
	return out;
}



function SPS_flipkart_parse_explode( delimiter, string ) {

	var emptyArray = { 0: '' };

	if ( arguments.length != 2
		|| typeof arguments[0] == 'undefined'
		|| typeof arguments[1] == 'undefined' )
	{
		return null;
	}

	if ( delimiter === ''
		|| delimiter === false
		|| delimiter === null )
	{
		return false;
	}

	if ( typeof delimiter == 'function'
		|| typeof delimiter == 'object'
		|| typeof string == 'function'
		|| typeof string == 'object' )
	{
		return emptyArray;
	}

	if ( delimiter === true ) {
		delimiter = '1';
	}

	return string.toString().split ( delimiter.toString() );
}

function SPS_flipkart_parse_implode( delimiter, arr ) {
	return ( ( arr instanceof Array ) ? arr.join ( delimiter ) : arr );
}

function SPS_flipkart_parse_str_replace(search, replace, subject) {
	return subject.split(search).join(replace);
}

function SPS_flipkart_prepare_seokeys(name) {
	var res = SPS_flipkart_parse_str_replace(" " , "-" , name);
	return res.replace(/[^a-z0-9-\s]/gi, '');
}

/************************** END OF PROTOTYPE BLOCK  *************************************/



/*
 * достаём название товара для имени папки с изображениями
 */

function parseName_flipkart(url){
	var res = SPS_flipkart_parse_explode("flipkart" , url);
	if(res.length > 1){
		res = SPS_flipkart_parse_explode("/" , res[1]);
		if(res.length > 3){
			res = res[1];
			res = SPS_flipkart_parse_str_replace("-" , " " , res);
			if(res.length > 3){
				return res;
			}else{
				return 'product ';
			}
		}else{
			return false;
		}
	}else{
		return false;
	}
}
