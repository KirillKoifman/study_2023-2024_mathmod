# РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ

### Факультет физико-математических и естественных наук 

<br/>
<br/>
<br/>
<br/>

ОТЧЕТ
ПО ЛАБОРАТОРНОЙ РАБОТЕ №1
===============
## Система контроля версий Git

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
дисциплина:  Математическое моделирование

Студент: Койфман Кирилл Дмитриевич

Группа: НПИбд-01-21

<br/>
<br/>
<br/>
<br/>

## Введение.
### Цель работы.

Создать и настроить рабочее пространство для выполнения работы. Получить навыки работы с системой контроля версий Git.

### Задача.
Создать и настроить репозиторий курса с помощью Git и выполнить задания из файла по работе с Git.

## Ход работы

1. Для начала установим имя, почту, а также настроим core.autocrlfс параметрами true и input, чтобы все переводы строк текстовых файлов в главном репозитории были одинаковы. И добавим отображение Unicode (рис.1 - рис.2):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_1.png)
<br/>*РИС.1*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_2.png)
<br/>*РИС.2*

2. Теперь создаим проект "Hello World!": 
Для этого создадим пустой каталог с именем
hello, затем войдём в него и создадим там файл с именем hello.html (рис.3):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_3.png)
<br/>*РИС.3*

Также создадим git репозиторий из этого каталога, выполнив команду git init (рис.4) и добавим файл в репозиторий (рис.5):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_4.png)
<br/>*РИС.4*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_5.png)
<br/>*РИС.5(коммитить нечего)*

3. Добавим кое-какие HTML-теги к нашему приветствию (рис.6) и проверим статус:
4. Теперь проиндексируем изменения (рис.7) 

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_6.png)
<br/>*РИС.6*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_7.png)
<br/>*РИС.7(файл был изменён и проиндексирован)*

Создадим коммит (рис.8):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_8.png)
<br/>*РИС.8(коммит был успешно сделан)*

Изменим страницу «Hello, World», чтобы она содержала стандартные теги <html>
и <body>, и добавим изменения в индекс, после чего ещё раз изменим файл и создадим коммит (рис.9 - рис.11):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_9.png)
<br/>*РИС.9*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_10.png)
<br/>*РИС.10*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_11.png)
<br/>*РИС.11(hello.html имеет незафиксированные
изменения, но уже не в буферной зоне)*

Теперь добавим второе изменение в индекс, а затем проверим состояние с
помощью командыgit status (рис.12):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_12.png)
<br/>*РИС.12(изменения были успешно закоммичены)*

Проверим список произведенных изменений в разных форматах (рис.13, рис.14):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_13.png)
<br/>*РИС.13(спиосок ранее сделанных коммитов с прилагающейся информацией)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_14.png)
<br/>*РИС.14(спиосок ранее сделанных коммитов с прилагающейся информацией:
- в однострочном формате;
- в однострочном формате, последние 2;
- в однострочном формате, сделанные за последние 3 минуты)*

Вернёмся к предыдущей версии с помощью git checkout (рис.15):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_16.png)
<br/>*РИС.16(успешно откатились до последнего коммита и вывели последний вариант файла hello.html)*

Назовём текущую версию страницы hello первой (v1) и поднимемся к предущему коммиту и ему тоже присвоем тег (рис.17):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_17.png)
<br/>*РИС.17*

Теперь попробуем попереключаться между двумя отмеченными версиями (рис.18):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_18.png)
<br/>*РИС.18*

Проверим доступные теги (рис.19):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_19.png)
<br/>*РИС.19*

5. Теперь уделим внимание отмене локальных изменения:
Переместимся на ветку master и изменим hello.html (рис.20 - рис.21):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_20.png)
<br/>*РИС.20*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_21.png)
<br/>*РИС.21(файл был изменён, но не проиндексирован, поэтому мы успешно его откатили до предыдущей версии)*

6. Теперь займёмся процесом отмены проиндексированных изменений:
Переместимся на ветку master и изменим hello.html:
Внесём изменение в файл hello.html в виде нежелательного комментария, проиндексируем его и проверим состояние, после чего выполним сброс буферной зоны к HEAD (рис.22 - рис.23). Теперь переключимся на версию коммита (рис.24):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_22.png)
<br/>*РИС.22*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_23.png)
<br/>*РИС.23*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_24.png)
<br/>*РИС.24(рабочий каталог снова чист)*

7. Попробуем создать коммит, а потом отменить его с помощью создания следующего коммита (рис.25 - рис.26):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_25.png)
<br/>*РИС.25*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_26.png)
<br/>*РИС.26(сделали неправильный коммит)*

Чтобы отменить коммит, нам необходимо сделать коммит, который удаляет изме-
нения, сохраненные нежелательным коммитом. После этого проверим лог (рис.27):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_27.png)
<br/>*РИС.27(нежелытельный коммит сохранился в истории)*

8. А сейчас попробуем удалить коммит из ветки:
Предположим, мы делаем коммит, и сразу понимаем, что это была ошибка. Было бы
неплохо иметь команду «возврата», которая позволила бы нам сделать вид, что
неправильного коммита никогда и не было:
Вновь проверим историю коммитов и отметим тегом последний (рис.28):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_28.png)
<br/>*РИС.28*

Сбросим ветку до нужной точки (рис.29):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_29.png)
<br/>*РИС.29*


![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_30.png)
<br/>*РИС.30*

9. Удалим тег oops и коммиты, на которые он
ссылался, сборщиком мусора (рис.31)

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_31.png)
<br/>*РИС.31(«oops» больше не будет отображаться в репозитории)*

10. Также попробуем внести изменения в сделанный коммит (рис.32 - рис.35):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_32.png)
<br/>*РИС.32*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_33.png)
<br/>*РИС.33(сделали коммит)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_34.png)
<br/>*РИС.34*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_35.png)
<br/>*РИС.35(заменили предыдущий коммит новым)*

11. Сейчас мы собираемся создать структуру нашего репозитория. Давайте перенесем
страницу в каталог lib (рис.36)

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_36.png)
<br/>*РИС.36(успешно перенесли)*

13. Добавим файл index.html в наш репозиторий (рис.37 - рис.39):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_37.png)
<br/>*РИС.37*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_38.png)
<br/>*РИС.38*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_39.png)
<br/>*РИС.39(можно увидеть кусок страницы hello в маленьком окошке)*

14. Рассмотрим детальней каталог .git (рис.40), где можно увидеть:
- информацию git;
- базу данных объектов;
- файл конфигурации;
- информацию о ветках, тегах;

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_40.png)
<br/>*РИС.40*

15. Исследуем информацию о наших коммитах с помощью объектов git (рис.41 - рис.42):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_41.png)
<br/>*РИС.41(получили содержимое файла hello.html последней версии)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_42.png)
<br/>*РИС.42*

16. Создадим новую ветку (рис.43 - рис.46):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_44.png)
<br/>*РИС.43(переключимся на новую ветку и закоммитим изменения)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_43.png)
<br/>*РИС.44(создадим таблицу стилей в новой ветве)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_45.png)
<br/>*РИС.45(изменим основную страницу)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_46.png)
<br/>*РИС.46(изменим вторую страницу)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_47.png)
<br/>*РИС.47(закоммитим изменения)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_48.png)
<br/>*РИС.48(результат hello.html)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_49.png)
<br/>*РИС.49(результат index.html)*

17. Теперь у нас есть 2 ветки, проверим информацию о них и попробуем произвести несколько оперций с ними (рис.50 - рис.54):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_50.png)
<br/>*РИС.50(информация о последних коммитах)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_51.png)
<br/>*РИС.51(переключимся на master и проверим содержимое hello.html, после чего вернёмся к style и сделаем тоже самое)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_52.png)
<br/>*РИС.52(вернёмся в master и добавим новый файл. И сделаем коммит)*

19. Сделаем коммит изменения README.md в ветку master (рис.53):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_53.png)
<br/>*РИС.53(теперь есть 2 отличниме ветки)*

20. Давайте сольём эти ветки в одну (рис.54):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_54.png)
<br/>*РИС.54(успешно слили ветки)*

21. Создадим искусственный конфликт при слиянии веток (рис.55 - рис.56):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_55.png)
<br/>*РИС.55(внесём изменения в ветке master)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_56.png)
<br/>*РИС.56(ветки вновь отделены)*

22. Решим созданный нами конфликт при слиянии веток (рис.57 - рис.59):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_57.png)
<br/>*РИС.57(в файле можно увидеть причину конфликта)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_58.png)
<br/>*РИС.58(отредкатируем файл, чтобы исправить конфликт)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_59.png)
<br/>*РИС.59(сделаем коммит. Ветки вновь успешно слились)*

23. Теперь произведём сброс ветки style (рис.60):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_60.png)
<br/>*РИС.60(в истории больше нет коммитов слияний)*

24. Также попробуем произвезти сброс ветки style (рис.61 - рис.62):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_61.png)
<br/>*РИС.61*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_62.png)
<br/>*РИС.62*

25. Воспользуемся командной base, чтобы вернуться в точку до 1-го слияния и перенести изменения из ветки master в ветку style (рис.63):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_63.png)
<br/>*РИС.63(репозиторий находится в состоянии до выполнения слияния)*

26. Теперь сольём изменения style в ветку master (рис.64):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_64.png)
<br/>*РИС.64(git выполнил ускоренное слияние-перемотку без каких-либо конфликтов)*

27. А сейчас займёмся клонированием репозитория (рис.65):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_65.png)
<br/>*РИС.65(перейдём в рабочий каталог и клинируем репозиторий hello)*

28. Проверим содержимое клонированного репозитория (рис.66):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_66.png)
<br/>*РИС.66(те же информация и коммиты, что и у исходного репозитория)*

29. Проверим, что такое origin (рис.67):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_67.png)
<br/>*РИС.67(получили информацию об исходной репозитории)*

30. Проверим доступные ветки в нашем репозитории (рис.68):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_68.png)
<br/>*РИС.68(можем увидеть как локальные ветки, так и удалённые)*

31. Попробуем внести изменения в оригинальный репозиторий, после чего извлечём и сольём изменения из удалённой ветки в текущую (рис.69 - рис.72):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_69.png)
<br/>*РИС.69(изменим файл)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_70.png)
<br/>*РИС.70(добавим изменения и сделаем коммит)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_71.png)
<br/>*РИС.71(команда git fetch извлекла новые коммиты из удаленного репозитория, но не слила их с нашими наработками в локальных ветках)*

32. Произведём слияние извлечённых изменения (рис.72):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_72.png)
<br/>*РИС.72(теперь изменения можно увидеть)*

33. Давайте добавим наблюдателя, ветку которая будет отслеживать удалённую ветку (рис.73):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_73.png)
<br/>*РИС.73(Теперь мы можем видеть ветку style в списке веток и логе)*

35. Создадим чистый репозиторий для расшаривания (рис.74)

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_74.png)
<br/>*РИС.74*

36. Добавим удалённый репозиторий к оригинальному (рис.75):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_75.png)
<br/>*РИС.75*

37. Так как чистые репозитории, как правило, расшариваются на каком-нибудь сете-
вом сервере, нам необходимо отправить наши изменения в другие репозитории (рис.76 - рис.77):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_76.png)
<br/>*РИС.76(изменим файл)*

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_77.png)
<br/>*РИС.77(отправим изменения)*

38. А теперь извлечём эти изменения (рис.78):

![pic](https://raw.githubusercontent.com/KirillKoifman/study_2023-2024_mathmod/master/labs/lab1/screenshots/Screenshot_78.png)
<br/>*РИС.78(получили отправленные изменения)*

## Заключение
В ходе проделанной лабораторной работы мной были усвоены основыне навыки создания и настройки рабочего пространства и работы с системой контроля версий Git.