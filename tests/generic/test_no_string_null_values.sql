{% test no_string_null_values(model, column_name) %}
    {# 
        Custom generic тест на проверку отсутствия строкового значения 'null' в столбце.
        Возвращает строки, где текст равен 'null'.
    #}
    SELECT
        *
    FROM {{ model }}
    WHERE lower({{ column_name }}) = 'null'

{% endtest %}