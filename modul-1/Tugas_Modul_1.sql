-- Membuat Database
CREATE DATABASE universitas_trunojoyo;

-- Menggunakan Database
USE universitas_trunojoyo;

-- Tabel Mahasiswa
CREATE TABLE Mahasiswa (
    NIM INT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat VARCHAR(255),
    Tanggal_Lahir DATE,
    Program_Studi VARCHAR(100),
    Tanggal_Mulai_Kuliah DATE
);

-- Tabel Dosen
CREATE TABLE Dosen (
    NIDN INT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat VARCHAR(255),
    Tanggal_Lahir DATE,
    Program_Studi VARCHAR(100)
);

-- Tabel Status_Mahasiswa
CREATE TABLE Status_Mahasiswa (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NIM_Mahasiswa INT,
    Status ENUM('Berhenti Kuliah', 'Lulus'),
    Tanggal DATE,
    FOREIGN KEY (NIM_Mahasiswa) REFERENCES Mahasiswa(NIM)
);

-- Tabel Mata_Kuliah
CREATE TABLE Mata_Kuliah (
    Kode_Mata_Kuliah VARCHAR(20) PRIMARY KEY,
    Nama_Mata_Kuliah VARCHAR(100),
    SKS INT,
    Program_Studi VARCHAR(100),
    NIDN_Dosen INT,
    FOREIGN KEY (NIDN_Dosen) REFERENCES Dosen(NIDN)
);

-- Tabel Pendaftaran_Mata_Kuliah
CREATE TABLE Pendaftaran_Mata_Kuliah (
    ID_Pendaftaran INT AUTO_INCREMENT PRIMARY KEY,
    NIM_Mahasiswa INT,
    Kode_Mata_Kuliah VARCHAR(20),
    Semester VARCHAR(20),
    FOREIGN KEY (NIM_Mahasiswa) REFERENCES Mahasiswa(NIM),
    FOREIGN KEY (Kode_Mata_Kuliah) REFERENCES Mata_Kuliah(Kode_Mata_Kuliah)
);

