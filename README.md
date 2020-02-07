# SmaCard
Application for managing point-cards and coupons
<p align="center">
<img width="483" alt="スクリーンショット 2020-02-07 16 24 24" src="https://user-images.githubusercontent.com/57832553/74009358-5795aa80-49c6-11ea-8fa6-76b178cb71e8.png">
</p>

## :memo:　Description
SmaCard is management tool for point-cards and coupons.
- User can add favorite cards from card list display, and manage what points each card has.
- Administrator can edit each user's card information via reading QR-code.
- Thanks to QR-code, administrator can edit simply and directly!

<h3 align="center">:smiley: User Screen</h3>

<p>
  <img width="350" alt="スクリーンショット 2020-02-07 14 28 44" src="https://user-images.githubusercontent.com/57832553/74003545-4d6bb000-49b6-11ea-961b-704dd43f57b2.png">
  <img width="350" align="right" alt="スクリーンショット 2020-02-07 14 28 02" src="https://user-images.githubusercontent.com/57832553/74008596-9a568300-49c4-11ea-9dc4-23ea9b80b328.png">
</p>

<h3 align="center">:sunglasses: Administrator Screen</h3>
<p align="center">
<img width="700" alt="test" src="https://user-images.githubusercontent.com/57832553/74010765-911be500-49c9-11ea-82d3-6f19ecbbeb69.png">
</p>

***DEMO:***


<h1 align="center">SmaCard</h1>
<p align="center">
<a href="https://guides.rubyonrails.org/"><img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/7a6c27cd-09cb-b9e7-7b1b-1cb56dfbee0c.png" height="60px;" /></a>
</p>
<p align="center">
<a href="http://haml.info/"><img src="https://user-images.githubusercontent.com/57832553/74001312-78520600-49ae-11ea-9f29-33f42bd75df4.png" height="60px;" /></a>
<a href="https://sass-lang.com/styleguide/brand"><img src="https://user-images.githubusercontent.com/57832553/73996999-a29cc700-49a0-11ea-8f87-2ce847edfeea.png" height="60px;" /></a>
<a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/57832553/73933784-96712500-4920-11ea-974f-23b73e2c6113.png" height="50px;" /></a>
<a href="https://docs.docker.com/"><img src="https://user-images.githubusercontent.com/57832553/73936026-3cbf2980-4925-11ea-97b2-274bd60a8fb5.png" height="60px;" /></a>
<a href="https://aws.amazon.com/jp/aws-jp-introduction/aws-jp-webinar-service-cut/"><img src="https://user-images.githubusercontent.com/57832553/73935917-fec20580-4924-11ea-9b42-36715e8d4ede.png" height="60px;" /></a>
</p>

## :cloud: Infrastructure Configuration Diagram
<p align="center">
<img width="518" alt="スクリーンショット 2020-01-09 19.39.05.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/9fdc0354-dc5c-4c13-3ecb-cd43976926e1.png">
</p>

## :globe_with_meridians: App URL

### **https://www.smacard66.com/cards/top**  


## :speech_balloon: Installation

```
$ git clone https://github.com/sunadoi/card_management.git
$ cd card_management
$ docker-compose build
$ docker-compose run --rm app rails db:create
$ docker-compose run --rm app rails db:migrate
$ docker-compose -f development.yml up -d
```


## :eyes: E-R Diagram

<img width="884" alt="スクリーンショット 2020-02-03 16.11.18.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/7dace54c-a636-d9f4-4c05-68fc6f1791a4.png">


## :smile: Author
- <a href="https://github.com/sunadoi/card_management">Github</a>
- <a href="https://twitter.com/suna_tech">Twitter</a>
- <a href="https://qiita.com/y-suna">Qiita</a>
