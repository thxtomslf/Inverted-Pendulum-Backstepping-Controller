# Перевернутый маятник на подвижном основании

## Цель работы
Получить математическую модель перевёрнутого маятника на подвижном основании в трёх разных случаях, используя формализм Лагранжа. Реализовать моделирование полученных моделей. Реализовать стабилизацию маятника в вертикальном положении с использованием метода backstepping, исследовать различные варианты линий переключения и параметров управления. Реализовать стабилизацию маятника в вертикальном положении с использованием метода backstepping в среде SimInTech.

## Получение математической модели перевернутого маятника на подвижной основе

Для получения математической модели перевернутого маятника на подвижном основании рассмотрим рисунок
<img width="284" alt="image" src="https://github.com/user-attachments/assets/917e704b-0c25-4b63-a6c1-7692777ee66b">


Распишем Лагранжиан:
<img width="771" alt="image" src="https://github.com/user-attachments/assets/c1e89d7b-7227-4e1b-877d-16c423876b97">

Получим систему уравнений:
<img width="474" alt="image" src="https://github.com/user-attachments/assets/cb499f98-d127-40d8-bf17-96cfcb2a54e8">

b - коэффициент демпфирования обратной матрицы;

<img width="697" alt="image" src="https://github.com/user-attachments/assets/da50f15b-b071-4df0-9d7f-e46db40121f8">

Получим систему:

<img width="982" alt="image" src="https://github.com/user-attachments/assets/e133e74b-a8f1-4ee9-b144-bdfcf687e224">

## Получение математической модели перевернутого маятника на подвижном основании на негоризонтальной поверхности с ограничением на движения каретки

<img width="301" alt="image" src="https://github.com/user-attachments/assets/001c691f-3458-4b12-8228-45ede16bab8c">


Полученная система:
<img width="873" alt="image" src="https://github.com/user-attachments/assets/506faedf-ed75-44d0-ad4b-74fc84a889b4">

## Реализация управления методом backstepping для движения перевернутого маятника на подвижном основании

Выведем управления для стабилизации углового положения маятника методом backstepping. Для этого рассмотрим первые два уравнения системы:

<img width="480" alt="image" src="https://github.com/user-attachments/assets/9e241c18-53b3-4ed1-8514-b5adf7237812">

Для упрощения вычислений введем следующие замены:

<img width="703" alt="image" src="https://github.com/user-attachments/assets/a3d99821-99bc-4221-91fc-022848da576d">

Избавимся от двух производных второго порядка в одном уравнении:
<img width="658" alt="image" src="https://github.com/user-attachments/assets/9d0a6dda-47e4-4f61-8f5b-dc2d27cf6c93">

Рассмотрим первое уравнение. Примем \theta 2 в качестве виртуального управления. Найдем такое желаемое значение \theta 2 desired (стабилизационную функцию)  , при котором первая подсистема стабилизируется. Для этого зададим функцию Ляпунова, стабилизирующую первый интегратор:
<img width="233" alt="image" src="https://github.com/user-attachments/assets/b87d350c-b529-4990-b8c9-617e7fe53351">

Тогда ее производная должна быть отрицательно определенной:


<img width="1110" alt="image" src="https://github.com/user-attachments/assets/4dd0752a-dde7-4be7-ab4e-61486dcf5adf">

<img width="1192" alt="image" src="https://github.com/user-attachments/assets/3b88985f-d006-491d-8557-6d332e31796f">


<img width="1074" alt="image" src="https://github.com/user-attachments/assets/f726dd37-4942-433d-ac94-813f99c91707">


## Полная версия

https://disk.yandex.ru/d/vsvOtKpCcWEn2Q



