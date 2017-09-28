Banner Slide by Category V.1.0 by Vxinfosystem.com

Banner  on a specified category.
This extension is used to display banner on a specific category. That have specified in admin settings.
Features:
1.	This extension do not overwrite the core files of the opencart.
2.	 Show banner's image Slide relate product category page.
3.	 easy to manage banner's image for category.
4.	 1 banner can relate multi category.
5.	 Integrated with current Slideshow extension
6.	Easy to be integrated with custom template
Intallation:
Steps to install the extension.
Step one:  Create database table 'banner_to_category' on your database by script as below
CREATE TABLE `banner_to_category` (
  `banner_image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `banner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`banner_image_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

Step Two: 	First of all vQmod should be install.
Step Three:	Download the extension
Step Four:	Unzip the extension on root directory of opencart installation.
Step Five:	Xml file will position on right place in opencart.
Step Six:
1 .go to admin page
2 .go to menu system > design > banner to create banner
3 .press insert to insert banner's page
  add detail banner add image and save you will see category box for select to this image banner .
4 .check categories to banner image 
5 .press save 
6 .exit by press cancel

Step Seven:
1. go to admin page menu Extensions > modules 
2 .press edit module Slideshow
3 .add module and select banner from ' Step Three ' and select layout 'category'
4 .add module and select banner from ' Step Three ' and select layout 'product'
5 .save.
Step Eight:	Installation complete.Now enjoy. 


