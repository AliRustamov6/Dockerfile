# Указываем родительский образ
FROM golang:1.20
# Указываем рабочий каталог
WORKDIR /app
# Копируем go.mod go.sum в текуший каталог
COPY go.mod go.sum ./
# Устанавливаем модули
RUN go mod download
# Копируем всё в текуший каталог
COPY . ./
# Скомпилируем приложение
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /parcell
# Устанавливаем команду для запуска контейнера
CMD ["/parcell"]