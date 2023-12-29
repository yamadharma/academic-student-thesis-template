# Tempalate for Student's thesis

## Скачайте репозиторий

- Создайте свой репозиторий из шаблона:
``` shell
gh repo create <название_репозитория> --template=yamadharma/academic-student-thesis-template --public
```

- Клонируйте его рекурсивно:
``` shell
gh repo clone <название_репозитория> -- --recursive
```

## Создание рабочего каталога

- Создайте рабочий каталог:

``` shell
make prepare
```

- Теперь можно работать с проектом:

``` shell
cd bachalor
make
```

