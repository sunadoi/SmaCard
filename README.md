デモ画像

<h2 align="center">SmaCard</h2>
<p align="center">
<a href="https://guides.rubyonrails.org/"><img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/7a6c27cd-09cb-b9e7-7b1b-1cb56dfbee0c.png" height="60px;" /></a>
<a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/57832553/73933784-96712500-4920-11ea-974f-23b73e2c6113.png" height="60px;" /></a>
<a href="https://docs.docker.com/"><img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/731612aa-8de5-3212-e0b4-7fdabea0f750.png" height="60px;" /></a>
<a href="https://aws.amazon.com/jp/aws-jp-introduction/aws-jp-webinar-service-cut/"><img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/8bbc1eca-9bd7-b15e-56b4-12d5e39c349a.png" height="60px;" /></a>
</p>

## :cloud: Infrastructure Configuration Diagram
<p align="center">
<img width="518" alt="スクリーンショット 2020-01-09 19.39.05.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/9fdc0354-dc5c-4c13-3ecb-cd43976926e1.png">
</p>

## :globe_with_meridians: App URL

### **https://www.smacard66.com/cards/top**  


## :speech_balloon: Usage

`$ git clone https://github.com/sunadoi/card_management.git`

`$ cd card_management`  

`$ docker-compose build`

`$ docker-compose run --rm app rails db:create`

`$ docker-compose run --rm app rails db:migrate`

`$ docker-compose -f development.yml up -d`


## :eyes: E-R Diagram

<img width="884" alt="スクリーンショット 2020-02-03 16.11.18.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/7dace54c-a636-d9f4-4c05-68fc6f1791a4.png">


## :smile: Author
- <a href="https://github.com/sunadoi/card_management">Github</a>
- <a href="https://twitter.com/suna_tech">Twitter</a>
- <a href="https://qiita.com/y-suna">Qiita</a>
