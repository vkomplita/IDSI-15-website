package ch.unige.idsi15.swisstool;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
 
@Entity
public class Duck {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long duckId;
    private String idqrcode ;
    private double longitude;
    private double latitude;
    private String description;
    private String address;
    private String title;
	public Long getDuckId() {
		return duckId;
	}
	public void setDuckId(Long duckId) {
		this.duckId = duckId;
	}
	
	public String getIdqrcode() {
		return idqrcode;
	}
	public void setIdqrcode(String idqrcode) {
		this.idqrcode = idqrcode;
	}
	
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}


	
	
	
	
	
	
   
}
