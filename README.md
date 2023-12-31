# Разработка приложения "Банк" на Flask

## Введение
Приложение "Банк" - это веб-приложение, разработанное на Flask, предназначенное для управления банковскими операциями. Оно включает в себя функции перевода денег, просмотра истории счетов, обращения в поддержку и создания отчетов.

## Доступность приложения
**Ссылка на приложение**: [http://bank-0xmisha-0c7e001888b2.herokuapp.com](http://bank-0xmisha-0c7e001888b2.herokuapp.com)  
*Примечание*: Приложение доступно онлайн, когда хостинг активен. Для локального запуска см. раздел "Установка и запуск".

## Роли пользователей
В приложении предусмотрены следующие роли пользователей:

| Роль | Логин | Пароль | Функции |
|------|-------|--------|---------|
| Клиент | misha | misha | Переводы, просмотр счетов, обращения в поддержку |
| Поддержка | vlad_support | vlad_support | Работа с обращениями, доступ к данным клиентов |
| Менеджер | ann_mngr | ann_mngr | Создание и просмотр отчетов |
| Генеральный директор | oleg_ceo | oleg_ceo | Просмотр отчетов |

## Технические детали
### Требования к системе
* Python 3.11
* Flask
* Docker
* Зависимости, указанные в файле `requirements.txt`

### Установка и запуск
Для установки и локального запуска приложения следуйте инструкциям:
1. Клонируйте репозиторий: `git clone https://github.com/0xmisha/bank.git`
2. Перейдите в директорию проекта: `cd bank`
3. Соберите приложение: `docker-compose up`.
4. Откройте приложение в браузере по адресу: `http://localhost:8000/`.
