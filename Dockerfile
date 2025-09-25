FROM debian:bookworm-slim

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y fortune-mod cowsay netcat-openbsd bash 

ENV PATH="/usr/games:${PATH}"

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]
