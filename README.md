--sql
create database db_kasir_xiirpl_satya_laksamana_wahyurianto ;
use db_kasir_xiirpl_satya_laksamana_wahyurianto
create table pelanggan ( 
PelangganID int(11) primary key auto_increment, 
NamaPelanggan varchar(255) not null, 
Alamat text, 
NomorTelepon varchar(15) 
); 
create table produk ( 
ProdukID int(11) primary key auto_increment, 
NamaProduk varchar(255) not null, 
Harga decimal(10,2) not null, 
Stok int(11) not null 
); 
create table penjualan ( 
PenjualanID int(11) primary key auto_increment, 
TanggalPenjualan date not null, 
TotalHarga decimal(10,2), 
PelangganID int(11), 
FOREIGN KEY (PelangganID) REFERENCES pelanggan(PelangganID) 
); 
create table detailpenjualan ( 
DetailID int(11) primary key auto_increment, 
PenjualanID int(11), 
ProdukID int(11), 
JumlahProduk int(11) not null, 
Subtotal decimal(10,2) not null, 
FOREIGN KEY (PenjualanID) REFERENCES penjualan(PenjualanID), 
FOREIGN KEY (ProdukID) REFERENCES produk(ProdukID) 
); 
insert into pelanggan(NamaPelanggan,Alamat,NomorTelepon)values 
('Andi Wijaya','Jakarta','81234567890'),('Budi Santoso','Bandung','81298765432'),('Siti Aisyah','Surabaya','81367891234'),('Rina 
Marlina','Yogyakarta','81278934561'),('Dedi Suhendra','Medan','81345678912'),('Eko Prasetyo','Semarang','81356789123'),('Fajar 
Rahman','Makasar','81312345678'),('Gita Purnama','Bali','81398765432'),('Hana Kartika','Malang','81376543219'),('Indra 
Setiawan','Palembang','81367812345'); 
insert into produk(NamaProduk,Harga,Stok)values('Laptop Asus','10000000','15'),('HP Samsung','5000000','20'),('TV 
LG','3500000','10'),('Kulkas Sharp','4000000','12'),('Mesin Cuci','3000000','8'),('AC Parasonic','6500000','10'),('Speaker 
JBL','2000000','25'),('Smartwatch Apple','7000000','15'),('Ipad Pro','12000000','10'),('Monitor Dell','4500000','30'),('Keyboard 
Logitech','1500000','30'),('Mouse Razer','1200000','22'),('Printer Epson','2800000','15'),('Kamera Sony','9000000','5'),('Hard Disk 
Seagate','1800000','25'),('Flashdisk Sandisk','500000','50'),('Proyektor BenQ','5500000','8'),('Power Bank 
Anker','750000','40'),('Tripod Kamera','600000','12'),('Drone DJI','15000000','4'); 
insert into penjualan(TanggalPenjualan,TotalHarga,PelangganID)values('2024-1-2','18500000','1'),('2024-2
2','16500000','2'),('2024-3-2','23000000','3'),('2024-4-2','7200000','4'),('2024-5-2','13600000','5'),('2024-6-2','8500000','6'),('2024-7
2','25600000','7'),('2024-8-2','16500000','8'),('2024-9-2','17500000','9'),('2024-10-2','18000000','10'); 
insert into 
detailpenjualan(PenjualanID,ProdukID,JumlahProduk,Subtotal)values('1','1','1','10000000'),('1','2','1','5000000'),('1','3','1','3500000'
 ),('2','4','1','4000000'),('2','5','2','6000000'),('2','6','1','6500000'),('3','7','2','4000000'),('3','8','1','7000000'),('3','9','1','12000000'),('4','1
 0','1','4500000'),('4','11','1','1500000'),('4','12','1','1200000'),('5','13','1','2800000'),('5','14','1','9000000'),('5','15','1','1800000'),('6','16
 ','3','1500000'),('6','17','1','5500000'),('6','18','2','1500000'),('7','19','1','600000'),('7','20','1','15000000'),('7','1','1','10000000'),('8','2','
 2','10000000'),('8','3','1','3500000'),('8','4','1','3000000'),('9','5','1','6500000'),('9','6','2','4000000'),('9','7','1','7000000'),('10','8','1','12
 000000'),('10','9','1','4500000'), 
('10','10','1','1500000'); 
Select 
penjualan.PenjualanID,penjualan.TanggalPenjualan,penjualan.TotalHarga,pelanggan.NamaPelanggan,produk.NamaProduk,detail
 penjualan.JumlahProduk,produk.Harga,detailpenjualan.Subtotalfrom penjualanjoin pelanggan on pelanggan.PelangganID 
=penjualan.PelangganIDjoin detailpenjualan on detailpenjualan.PenjualanID =penjualan.PenjualanIDjoin produk on 
produk.ProdukID = detailpenjualan.ProdukID; 
mysqldump -u root db_kasir_xiirpl_satya_laksamana_wahyurianto > db_kasir_xiirpl_satya_laksamana_wahyurianto.sql ;
mysqldump -u root db_kasir_xiirpl_satya_laksamana_wahyurianto < db_kasir_xiirpl_satya_laksamana_wahyurianto.sql ;
