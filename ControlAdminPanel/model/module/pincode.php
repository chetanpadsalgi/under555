<?php
class ModelModulepincode extends Model {
		public function createTable(){
			$query = $this->db->query("CREATE TABLE IF NOT EXISTS `pincheck` (`id` int(5) NOT NULL AUTO_INCREMENT, `pincode` int(10) NOT NULL, `service_available` varchar(5) NOT NULL, PRIMARY KEY (`id`))");
		}
	}
?>