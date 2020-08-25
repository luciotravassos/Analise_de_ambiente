SELECT DISTINCT c.responsibility_name
           FROM applsys.fnd_user_resp_groups a,
                fnd_responsibility_tl c,
                fnd_application_tl d
          WHERE UPPER (c.responsibility_name) like '%ALBRAS%PO%'
            AND a.responsibility_id = c.responsibility_id
            AND a.responsibility_application_id = d.application_id