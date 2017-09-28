<?php
	class ModelCatalogpincode extends Model {
		public function getPin($pincode) {
			return $this->db->query("select * from pincheck where pincode = '".$pincode."'")->rows;
		}
                public function getPincode($pincode) {
			return $this->db->query("select * from pincheck where pincode = '".$pincode."'")->rows;
		}
                public function checkPincode($pincode) {
			$query = $this->db->query("select COUNT(*) AS total from pincheck where pincode = '".$pincode."'");
                        return $query->row['total'];
		}
	}
?>