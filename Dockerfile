# Используем образ Go для сборки
FROM golang:1.21 AS build

WORKDIR /app

# Копируем исходный код
COPY main.go .

# Устанавливаем переменную окружения для работы без go.mod
ENV GO111MODULE=off

# Собираем приложение
RUN go build -o main .

# Используем легковесный образ для запуска
FROM alpine:latest

# Копируем скомпилированное приложение из образа сборки
COPY --from=build /app/main .

# Открываем порт
EXPOSE 8080

# Команда для запуска приложения
CMD ["./main"]