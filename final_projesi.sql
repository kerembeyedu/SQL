------Üyeler Tablosunun Oluşturulma Sorgusu------

CREATE TABLE members 
   (id SERIAL PRIMARY KEY,
    kullanici_adi VARCHAR(50) NOT NULL UNIQUE,
    eposta VARCHAR(100) NOT NULL UNIQUE,
    sifre VARCHAR(255) NOT NULL,
    kayit_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ad VARCHAR(50),
    soyad VARCHAR(50) );
	


------Kategoriler Tablosunun Oluşturulma Sorgusu------
CREATE TABLE categories 
   (id SMALLINT PRIMARY KEY, 
    kategori_adi VARCHAR(100) NOT NULL UNIQUE);

	

------Eğitimler Tablosunun Oluşturulma Sorgusu------

CREATE TABLE courses 
   (id SERIAL PRIMARY KEY,
    adi VARCHAR(200) NOT NULL,
    aciklama TEXT,
    baslangic DATE,
    bitis DATE,
    egitmen_bilgisi VARCHAR(100),
    category_id SMALLINT,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL);
	





------Katılım Tablosunun Oluşturulma Sorgusu------

CREATE TABLE enrollments 
   (id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE);



------Sertifikalar Tablosunun Oluşturulma Sorgusu------

CREATE TABLE certificates 
   (id SERIAL PRIMARY KEY,
    sertifika_kodu VARCHAR(100) NOT NULL UNIQUE,
    verilis_tarihi DATE NOT NULL);



------Sertifika Atama Tablosunun Oluşturulma Sorgusu------

CREATE TABLE certificate_assignments 
   (id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL,
    certificate_id INTEGER NOT NULL,
    alim_tarihi DATE NOT NULL,
    FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE,
    FOREIGN KEY (certificate_id) REFERENCES certificates(id) ON DELETE CASCADE);



------Blog Yazıları Tablosunun Oluşturulma Sorgusu------

CREATE TABLE blog_posts 
   (id SERIAL PRIMARY KEY,
    baslik VARCHAR(255) NOT NULL,
    icerik TEXT NOT NULL,
    yayin_tarihi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    yazar_id INTEGER NOT NULL,
    FOREIGN KEY (yazar_id) REFERENCES members(id) ON DELETE CASCADE);

