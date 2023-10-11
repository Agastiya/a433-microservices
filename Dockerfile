# Menggunakan image node versi 14 (berbasis apline linux)
FROM node:14.21-alpine as builder

# Mengatur direktori kerja di dalam container ke /app
WORKDIR /app

# Menyalin package.json dan package-lock.json dari direktori host ke direktori kerja
COPY package*.json ./

# Menjalankan perintah npm untuk mengonfigurasi pengaturan SSL
# Jika tidak menjalankan perintah ini menghasilkan error "ERROR: failed to solve: process "/bin/sh -c npm install --production --unsafe-perm && npm run build""
RUN npm config set strict-ssl false

# Menjalankan npm ci untuk menginstal dependensi
RUN npm ci

# Menyalin semua berkas JavaScript dari direktori host ke direktori kerja
COPY ./*.js ./

# Mengekspos port 3000 yang akan digunakan
EXPOSE 3000

# Menjalankan perintah "node index.js" saat container berjalan
CMD [ "node", "index.js" ]