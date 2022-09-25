{% marco get_tables() %}
    {% set query %}
        select table_name from information_schema.tables
    {% endset %}

    {% if execute %}
        {% set tables = run_query(query).columns }
    {% endif %}

    {% for table in tables %}
        {{table}}
    {% endfor %}

{% endmacro %}