CREATE TEMPORARY TABLE TempLatestMembers AS
SELECT
    global_user_id,
    MAX(last_update_date) AS max_last_update_date
FROM MemberTable
GROUP BY global_user_id
HAVING COUNT(DISTINCT member_name) > 1;

CREATE TEMPORARY TABLE TempLatestMemberNames AS
SELECT
    TLM.global_user_id,
    MT.member_name
FROM MemberTable MT
JOIN TempLatestMembers TLM ON MT.global_user_id = TLM.global_user_id AND MT.last_update_date = TLM.max_last_update_date;


UPDATE AppointmentTable A
SET A.appointment_member = (
    SELECT TLN.member_name
    FROM TempLatestMemberNames TLN
    WHERE TLN.global_user_id = (
        SELECT M.global_user_id
        FROM MemberTable M
        WHERE M.member_name = A.appointment_member
    )
)
WHERE EXISTS (
    SELECT 1
    FROM TempLatestMembers TLM
    WHERE TLM.global_user_id = (
        SELECT M.global_user_id
        FROM MemberTable M
        WHERE M.member_name = A.appointment_member
    )
);

