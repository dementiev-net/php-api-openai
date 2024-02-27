create table chat_history
(
    id                int auto_increment
        primary key,
    hid               varchar(50)   not null,
    human             text          null,
    ai                text          null,
    prompt_tokens     int default 0 null,
    completion_tokens int default 0 null,
    total_tokens      int default 0 null
);

INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (112, 'fe265610-fc14-485b-8b05-9564fa3c27b0', 'Напиши функцию на PHP которая генерирует случайное число. Объяснять код не нужно', 'Конечно! Вот простая функция на PHP, которая генерирует случайное число:

```php
function generateRandomNumber() {
    return rand();
}
```

Эта функция будет возвращать случайное число при каждом ее вызове. Вы можете использовать ее следующим образом:

```php
$randomNumber = generateRandomNumber();
echo $randomNumber;
```

Код не требует каких-либо дополнительных пояснений. Если у вас возникнут вопросы, не стесняйтесь задавать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (113, 'fe265610-fc14-485b-8b05-9564fa3c27b0', 'Напиши функцию на PHP которая генерирует случайное число. Объяснять код не нужно', 'Конечно, вот функция, которая генерирует случайное число в заданном диапазоне:

```php
function generateRandomNumber($min, $max) {
    return rand($min, $max);
}
```

Вы можете использовать эту функцию, указав минимальное и максимальное значения:

```php
$randomNumber = generateRandomNumber(1, 100);
echo $randomNumber;
```

Этот код будет генерировать случайное число в диапазоне от 1 до 100 и выводить его. Если у вас возникнут дополнительные вопросы, пожалуйста, дайте знать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (114, 'fe265610-fc14-485b-8b05-9564fa3c27b0', 'а на perl?', 'Конечно! Вот пример функции на Perl, которая генерирует случайное число в заданном диапазоне:

```perl
sub generateRandomNumber {
    my ($min, $max) = @_;
    return int(rand($max - $min + 1)) + $min;
}
```

Вы можете использовать эту функцию, указав минимальное и максимальное значения:

```perl
my $randomNumber = generateRandomNumber(1, 100);
print $randomNumber;
```

Код будет генерировать случайное число в диапазоне от 1 до 100 и выводить его. Если у вас возникнут дополнительные вопросы, пожалуйста, дайте знать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (115, 'fe265610-fc14-485b-8b05-9564fa3c27b0', 'А на c#', 'Конечно! Вот пример функции C#, которая генериру случайное число в заданном диапазоне:

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        int randomNumber = GenerateRandomNumber(1, 100);
        Console.WriteLine(randomNumber);
    }

    static int GenerateRandomNumber(int min, int max)
    {
        Random random = new Random();
        return random.Next(min, max + 1);
    }
}
```

Вы можете использовать эту функцию, указав минимальное и максимальное значения:

```csharp
int randomNumber = GenerateRandomNumber(1, 100);
Console.WriteLine(randomNumber);
```

Код будет генерировать случайное число в диапазоне от 1 до 100 и выводить его. Если у вас возникнут дополнительные вопросы, пожалуйста, дайте знать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (120, 'eb4fd606-09a7-4474-a10a-a15af38e1492', 'Напиши функцию на PHP которая генерирует случайное число. Объяснять код не нужно', 'Да, конечно! Вот простая функция на PHP, которая генерирует случайное число:

```php
function generateRandomNumber() {
    return mt_rand();
}
```

Эта функция будет возвращать случайное число при каждом ее вызове. Здесь используется функция `mt_rand()`, которая предоставляет более качественную генерацию случайных чисел, чем функция `rand()`. 

Вы можете использовать эту функцию следующим образом:

```php
$randomNumber = generateRandomNumber();
echo $randomNumber;
```

Вызов этой функции генерирует случайное число и выводит его. Если у вас возникнут ещеопросы, не стесняйтесь спрашивать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (121, 'eb4fd606-09a7-4474-a10a-a15af38e1492', 'А на PERL', 'Конечно! Вот пример функции на Perl, которая генерирует случайное число:

```perl
sub generateRandomNumber {
    return int(rand());
}
```

Эта функция будет возвращать случайное целое число при каждом ее вызове. В Perl функция `rand()` генерирует случайное число между 0 и 1.

Вы можете использовать эту функцию следующим образом:

```perl
my $randomNumber = generateRandomNumber();
print $randomNumber;
```

Вызов этой функции генерирует случайное число и выводит его. Если у вас возникнут еще вопросы, не стесняйтесь спрашивать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (122, 'eb4fd606-09a7-4474-a10a-a15af38e1492', 'А на c++', 'Конечно! Вот пример функции на C++, которая генерирует случайное число:

```cpp
#include <iostream>
#include <cstdlib>
#include <ctime>

int generateRandomNumber() {
    srand(time(0));
    return rand();
}

int main() {
    int randomNumber = generateRandomNumber();
    std::cout << randomNumber << std::endl;
    return 0;
}
```

Эта функция будет генерировать случайное число при каждом ее вызове. В данном случае, используется функция `rand()`, которая возвращает случайное положительное число.

Вы можете использовать эту функцию в функции `main()` следующим образом:

```cpp
int randomNumber = generateRandomNumber();
std::cout << randomNumber << std::endl;
```

Вызов этой функции генерирует случайное число и выводит его. Если у вас возникнут еще вопросы, не стесняйтесь спрашивать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (123, 'eb4fd606-09a7-4474-a10a-a15af38e1492', 'А на питоне?', 'Конечно! Вот пример функции на Python, которая генерирует случайное число:

```python
import random

def generateRandomNumber():
    return random.randint(1, 100)  # Генерируем случайное число от 1 до 100

randomNumber = generateRandomNumber()
print(randomNumber)
```

В этом примере используется модуль `random` встроенный в Python для генерации случайных чисел. Функция `randint()` генерирует случайное целое число в заданном диапазоне (1-100 в данном случае).

Вы можете использовать эту функцию, чтобы сгенерировать и вывести случайное число. Если у вас возникнут дополнительные вопросы, не стесняйтесь задавать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (137, '8281b237-4482-493b-827a-dcfb3c1d8d41', 'Роль: Ты профессиональный копирайтер
Объект: На сайте размещен продукт Модуль "карта сайта"
Действие: Сгенерируй для него:
Название (100 символов)
Краткое описане (200 символов с HTML разметкой)
Детальное описане (200 символов с HTML разметкой)
SEO Ключевые слова (100 символов)
SEO Описание (100 символов со смайликами)
Кточняющая информация: Битрикс24, модуль, 1С, дополнительный функционал

Формат ответа: JSON с ключами:
NAME->Название
PREVIEW_TEXT->Краткое описане
DETAIL_TEXT->Детальное описане
ELEMENT_META_KEYWORDS->SEO Ключевые слова
ELEMENT_META_DESCRIPTION->SEO Описание', '```json
{
    "NAME": "МодульКарта сай\' с расширенным функционалом для Битрикс24 и 1С",
 "PREVIEW_TEXT": "<p>Этот модуль обеспечивает быстрое и удобное создание карты сайта с помощью удобного инструмента. Улучшите навигацию по сайту для ваших посетителей!</p>",
    "DETAIL_TEXT": "<p>Модуль \'Карта сайта\' предоставляет возможность настройки глубины сканирования, добавления разделов и кастомизации внешнего вида карты сайта. Идеальное решение для улучшения внутренней структуры сайта!</p>",
    "ELEMENT_META_KEYWORDS": "Битрикс24, модуль, 1С, карта сайта, навигация",
    "ELEMENT_META_DESCRIPTION": "Оптимизируйте навигацию на вашем сайте с помощью модуля \'Карта сайта\' от Bitrix24! ?️"
}
```', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (138, '8281b237-4482-493b-827a-dcfb3c1d8d41', 'test', 'Тестирование успешно пройд! Если у в есть ещеопросы илина дальнейшая помощь, не стесняйтесь спшивать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (139, '8281b237-4482-493b-827a-dcfb3c1d8d41', 'test', 'Test successful! If you have any more questions or need assistance, feel free ask.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (140, '8281b237-4482-493b-827a-dcfb3c1d8d41', 'тест', 'Тест успешен! Если у вас есть какие-бо другие вопросы или вам нужна помощь, пожалуйста, неесняйтесь спрашивать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (141, '8281b237-4482-493b-827a-dcfb3c1d8d41', 'тест', 'Тестирование успешно пройдено! Если уас есть ещ вопросы вам нужна помощь, пожалуйста, неесняйтесь спраивать.', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (142, '8281b237-4482-493b-827a-dcfb3c1d8d41', 'Как тебя зову?', 'Меня зовут Assistant. Чем му помочь', 0, 0, 0);
INSERT INTO chat_history (id, hid, human, ai, prompt_tokens, completion_tokens, total_tokens) VALUES (143, '8281b237-4482-493b-827a-dcfb3c1d8d41', 'Роль: Ты профессиональный копирайтер
Объект: На сайте размещен продукт Модуль "карта сайта"
Действие: Сгенерируй для него:
Название (100 символов)
Краткое описане (300 символов с HTML разметкой)
Детальное описане (1000 символов с HTML разметкой)
SEO Ключевые слова (400 символов)
SEO Описание (200 символов со смайликами)
Кточняющая информация: Битрикс24, модуль, 1С, дополнительный функционал

Формат ответа: JSON с ключами:
NAME->Название
PREVIEW_TEXT->Краткое описане
DETAIL_TEXT->Детальное описане
ELEMENT_META_KEYWORDS->SEO Ключевые слова
ELEMENT_META_DESCRIPTION->SEO Описание
', '```json
{
    "NAME": "МодульКарта сай Pro\' для уучшения навигации    "PREVIEW_TEXT": "<p>Пысьте удобствоания своегота с помощ нашего Модуля \'Карта сайта\', который позволит посетителям легко находить нужную информацию.</p>",
    "DETAIL_TEXT": "<p>Модуль \'Карта сайта Pro\' предоставляет широкие возможности по настройке структуры сайта, автоматическому созданию карты сайта, добавлению категорий и метаданных для лучшей организации контента.</p>",
    "ELEMENT_META_KEYWORDS": "Битрикс24, модуль \'Карта сайта\', 1С, навигация, управление сайтом, оптимизация",
    "ELEMENT_META_DESCRIPTION": "Улучшите навигацию на сайте с помощью Модуля \'Карта сайта Pro\' от компании! ?️ Повысьте уровень удобства для ваших посетителей."
}
```', 0, 0, 0);
