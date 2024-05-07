﻿#language: ru

@tree

Функционал: Проверка заполнения количество услуг в документе Заказ

Как Менеджер по продажам я хочу
создать документ Заказ
чтобы проверить  заполнения количества услуг

Контекст:

	Дано я подключаю TestClient "Менеджер по продажам" логин "Менеджер по продажам" пароль ""
	Дано я закрываю все окна клиентского приложения
	Дано я запоминаю строку "5,00" в переменную "КоличествоТовара"

Сценарий: Проверка заполнения количество услуг в документе Заказ

* Открытие формы создания Заказа
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"

* Заполнение шапки документа

	И из выпадающего списка с именем 'Организация' я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем 'Склад' я выбираю точное значение 'Склад отдела продаж'

* Добавление услуги в ТЧ Товары	

	И в таблице 'Товары' я нажимаю на кнопку с именем 'КомандаПодбор'
	Тогда открылось окно "Подбор товара"
	И в таблице 'СписокТоваров' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000036" | "Услуги"       |
	И в таблице 'СписокТоваров' я перехожу на один уровень вниз
	И в таблице 'СписокТоваров' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000037" | "Доставка"       |
	И в таблице 'СписокТоваров' я выбираю текущую строку
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "$КоличествоТовара$"
	И в таблице 'Товары' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ОК'
	Тогда в таблице 'Товары' поле 'Количество' имеет значение '$КоличествоТовара$'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "$КоличествоТовара$"

		