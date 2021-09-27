-------------------- ʹ�ô��봴������Լ�� --------------------
-- Լ�����ࣺ����Լ����PK-Primary Key����Ψһ��Լ����UQ-Unique��
-- ���Լ����CK-Check����Ĭ��ֵԼ����DF-Default�������Լ����FK-Foreign Key��



-- ����Լ�����﷨
-- Alter table ����
-- Add constraint �Լ�дΪǰ׺��Լ������ Լ������ Լ��˵��(�ֶ� �� ���ʽ �� ֵ)


-- 1. �� ID ����Ϊ����
Alter table Teacher
Add constraint PK_Teacher_ID primary key(ID)


-- 2. ���� name ΪΨһ��
if exists(select * from sysobjects where name='UQ_Teacher_Name')
	Alter table teacher Drop constraint UQ_Teacher_Name
Alter table Teacher
Add constraint UQ_Teacher_Name unique(Name)


-- 3. ��������Ϊ 0~100 ֮��
Alter table Teacher
Add constraint CK_Teacher_Age check(Age>0 and Age <=100)


-- 4. Ϊ birthday ���Ĭ��Լ��ֵ
Alter table Teacher
Add constraint DF_Teacher_Birthday default('1990-1-1') for Birthday		-- for ��˵��Ϊ��һ���ֶ����Ĭ��ֵ


-- 5. Ϊ class ������Լ��
Alter table Teacher			-- �ӱ��ĳһ���ֶ�		����			�����ĳһ���ֶ�
with nocheck				-- �������������
Add constraint FK_Teacher_Class foreign key(Class) references class(IdClass)
on delete set null