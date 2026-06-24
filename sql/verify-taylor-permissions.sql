-- Lists every action granted to Taylor through her roles.
SELECT
  u.name AS user_name,
  r.label AS role,
  a.description AS action
FROM user_define u
JOIN user_role_rela urr ON u.id = urr.user_id
JOIN role_define r ON urr.role_id = r.id
JOIN role_action_rela rar ON r.id = rar.role_id
JOIN action_define a ON rar.action_id = a.id
WHERE u.name = 'Taylor'
ORDER BY a.id;
