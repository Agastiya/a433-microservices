# Menggunakan image dasar Node.js versi 14 berdasarkan Alpine Linux
FROM node:14-alpine

# Mengatur direktori kerja di dalam container ke /app
WORKDIR /app

# Menyalin semua file dari direktori host ke direktori kerja di dalam container
COPY . .

# Mengatur variabel environtment NODE_ENV ke 'production'
ENV NODE_ENV=production

# Mengatur variabel environtment DB_HOST ke 'item-db'
ENV DB_HOST=item-db

# Menjalankan perintah npm untuk mengonfigurasi pengaturan SSL
# Jika tidak menjalankan perintah ini menghasilkan error "ERROR: failed to solve: process "/bin/sh -c npm install --production --unsafe-perm && npm run build""
RUN npm config set strict-ssl false

# Menginstal dependensi Node.js dalam mode production dan menjalankan perintah 'build'
RUN npm install --production --unsafe-perm && npm run build

# Menjalankan dengan port 8080 yang akan digunakan oleh container
EXPOSE 8080

# Menjalankan aplikasi dengan perintah 'npm start' saat container berjalan
CMD ["npm", "start"]