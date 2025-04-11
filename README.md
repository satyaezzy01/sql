
# 📦 Database `dbkasir` - Dokumentasi Setup

Panduan ini menjelaskan langkah-langkah untuk membuat dan mengelola database kasir sederhana menggunakan MySQL melalui Command Prompt.

---

## 📌 Langkah Awal

### 1. Buka CMD
```bash
cmd
```

### 2. Masuk ke Direktori MySQL
```bash
cd c:\xampp\mysql\bin
```

### 3. Masuk ke MySQL
```bash
mysql -u root -p
```
> Tekan `Enter` jika tidak ada password.

---

## 🛠️ Pembuatan Database

### 4. Buat Database
```sql
create database dbkasir;
```

### 5. Gunakan Database
```sql
use dbkasir;
```

---

## 🧱 Struktur Tabel

### Tabel `pelanggan`
```sql
create table pelanggan (
  PelangganID int(11) primary key auto_increment,
  NamaPelanggan varchar(255) not null,
  Alamat text,
  NomorTelepon varchar(15)
);
```

### Tabel `produk`
```sql
create table produk (
  ProdukID int(11) primary key auto_increment,
  NamaProduk varchar(255) not null,
  Harga decimal(10,2) not null,
  Stok int(11) not null
);
```

### Tabel `penjualan`
```sql
create table penjualan (
  PenjualanID int(11) primary key auto_increment,
  TanggalPenjualan date not null,
  TotalHarga decimal(10,2),
  PelangganID int(11),
  FOREIGN KEY (PelangganID) REFERENCES pelanggan(PelangganID)
);
```

### Tabel `detailpenjualan`
```sql
create table detailpenjualan (
  DetailID int(11) primary key auto_increment,
  PenjualanID int(11),
  ProdukID int(11),
  JumlahProduk int(11) not null,
  Subtotal decimal(10,2) not null,
  FOREIGN KEY (PenjualanID) REFERENCES penjualan(PenjualanID),
  FOREIGN KEY (ProdukID) REFERENCES produk(ProdukID)
);
```

---

## 🔎 Pemeriksaan & Manipulasi

### Cek Struktur Tabel
```sql
desc pelanggan;
```

### Hapus Tabel
```sql
drop table nama_table;
```

### Lihat Semua Database
```sql
show databases;
```

### Lihat Semua Tabel
```sql
show tables;
```

### Ganti Nama Kolom (contoh typo)
```sql
ALTER TABLE penjualan CHANGE TangganPenjualan TanggalPenjualan DATE;
```

### Tambah Kolom Baru
```sql
alter table penjualan add TotalHarga decimal(10,2) after TanggalPenjualan;
```

---

## 📥 Insert Data

### 1. Insert 1 Data ke `pelanggan`
```sql
insert into pelanggan(NamaPelanggan,Alamat,NomorTelepon)
values('SatyalaksamanaWR','Patumbak 1','083836805218');
```

### 2. Insert Banyak Data ke `produk`
```sql
insert into produk (NamaProduk, Harga, Stok)
values 
  ('Laptop Asus', 10000000, 5),
  ('Mouse Logitech', 250000, 10);
```

### 3. Insert ke `penjualan`
```sql
insert into penjualan(PelangganID, TanggalPenjualan, TotalHarga)
values(1, '2025-02-14', 10250000);
```

### 4. Insert ke `detailpenjualan`
```sql
insert into detailpenjualan(PenjualanID, ProdukID, JumlahProduk, Subtotal)
values 
  (1, 1, 1, 10000000),
  (1, 2, 1, 250000);
```

---

## 📊 Menampilkan Data

### Join Semua Tabel
```sql
select * from detailpenjualan
inner join penjualan on penjualan.PenjualanID = detailpenjualan.PenjualanID
inner join pelanggan on pelanggan.PelangganID = penjualan.PelangganID
inner join produk on produk.ProdukID = detailpenjualan.ProdukID;
```

### Join dengan Kolom Tertentu
```sql
select 
  penjualan.PenjualanID,
  penjualan.TanggalPenjualan,
  penjualan.TotalHarga,
  pelanggan.NamaPelanggan,
  produk.NamaProduk,
  detailpenjualan.JumlahProduk,
  produk.Harga,
  detailpenjualan.Subtotal
from penjualan
join pelanggan on pelanggan.PelangganID = penjualan.PelangganID
join detailpenjualan on detailpenjualan.PenjualanID = penjualan.PenjualanID
join produk on produk.ProdukID = detailpenjualan.ProdukID;
```

---

## 💾 Backup dan Restore

### Backup Database
```bash
mysqldump -u root dbkasir > dbkasir.sql
```

### Restore Database
```bash
mysqldump -u root dbkasir < dbkasir.sql
```

---

> Dokumen ini digunakan untuk membantu proses setup dan manipulasi data pada sistem kasir berbasis MySQL.
