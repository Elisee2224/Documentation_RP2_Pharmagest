PGDMP         -                |        
   PharmaGest    15.5    15.5 "               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            !           1262    16406 
   PharmaGest    DATABASE     �   CREATE DATABASE "PharmaGest" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE "PharmaGest";
                postgres    false            �            1255    16440    after_user_delete()    FUNCTION     	  CREATE FUNCTION public.after_user_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO deleted_users (username, firstname, lastname, mdp_pharm)
    VALUES (OLD.username, OLD.firstname, OLD.lastname, OLD.mdp_pharm);
    RETURN OLD;
END;
$$;
 *   DROP FUNCTION public.after_user_delete();
       public          postgres    false            �            1255    16428    update_last_logins()    FUNCTION     �   CREATE FUNCTION public.update_last_logins() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE useraccounts
    SET last_logins = NEW.last_login
    WHERE username = NEW.username;
    RETURN NEW;
END;
$$;
 +   DROP FUNCTION public.update_last_logins();
       public          postgres    false            �            1259    16431    deleted_users    TABLE     )  CREATE TABLE public.deleted_users (
    id_deleted_users integer NOT NULL,
    username character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    mdp_pharm character varying(255),
    deleted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.deleted_users;
       public         heap    postgres    false            �            1259    16430 "   deleted_users_id_deleted_users_seq    SEQUENCE     �   CREATE SEQUENCE public.deleted_users_id_deleted_users_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.deleted_users_id_deleted_users_seq;
       public          postgres    false    219            "           0    0 "   deleted_users_id_deleted_users_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.deleted_users_id_deleted_users_seq OWNED BY public.deleted_users.id_deleted_users;
          public          postgres    false    218            �            1259    16443    fournisseur    TABLE       CREATE TABLE public.fournisseur (
    id_fournisseur integer NOT NULL,
    nom_fournisseur character varying(20) NOT NULL,
    prenom_fournisseur character varying(20) NOT NULL,
    adresse_fournisseur text,
    tel_fournisseur integer,
    email_fournisseur character varying(40)
);
    DROP TABLE public.fournisseur;
       public         heap    postgres    false            �            1259    16442    fournisseur_id_fournisseur_seq    SEQUENCE     �   CREATE SEQUENCE public.fournisseur_id_fournisseur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.fournisseur_id_fournisseur_seq;
       public          postgres    false    221            #           0    0    fournisseur_id_fournisseur_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.fournisseur_id_fournisseur_seq OWNED BY public.fournisseur.id_fournisseur;
          public          postgres    false    220            �            1259    16421 	   user_logs    TABLE     �   CREATE TABLE public.user_logs (
    id_userlogs integer NOT NULL,
    username character varying(50) NOT NULL,
    last_login timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.user_logs;
       public         heap    postgres    false            �            1259    16420    user_logs_id_userlogs_seq    SEQUENCE     �   CREATE SEQUENCE public.user_logs_id_userlogs_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.user_logs_id_userlogs_seq;
       public          postgres    false    217            $           0    0    user_logs_id_userlogs_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.user_logs_id_userlogs_seq OWNED BY public.user_logs.id_userlogs;
          public          postgres    false    216            �            1259    16413     useraccounts_id_useraccounts_seq    SEQUENCE     �   CREATE SEQUENCE public.useraccounts_id_useraccounts_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.useraccounts_id_useraccounts_seq;
       public          postgres    false            �            1259    16414    useraccounts    TABLE     m  CREATE TABLE public.useraccounts (
    id_useraccounts integer DEFAULT nextval('public.useraccounts_id_useraccounts_seq'::regclass) NOT NULL,
    username character varying(50) NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    mdp_pharm character varying(55),
    last_logins timestamp(6) without time zone
);
     DROP TABLE public.useraccounts;
       public         heap    postgres    false    214            y           2604    16434    deleted_users id_deleted_users    DEFAULT     �   ALTER TABLE ONLY public.deleted_users ALTER COLUMN id_deleted_users SET DEFAULT nextval('public.deleted_users_id_deleted_users_seq'::regclass);
 M   ALTER TABLE public.deleted_users ALTER COLUMN id_deleted_users DROP DEFAULT;
       public          postgres    false    219    218    219            {           2604    16446    fournisseur id_fournisseur    DEFAULT     �   ALTER TABLE ONLY public.fournisseur ALTER COLUMN id_fournisseur SET DEFAULT nextval('public.fournisseur_id_fournisseur_seq'::regclass);
 I   ALTER TABLE public.fournisseur ALTER COLUMN id_fournisseur DROP DEFAULT;
       public          postgres    false    221    220    221            w           2604    16424    user_logs id_userlogs    DEFAULT     ~   ALTER TABLE ONLY public.user_logs ALTER COLUMN id_userlogs SET DEFAULT nextval('public.user_logs_id_userlogs_seq'::regclass);
 D   ALTER TABLE public.user_logs ALTER COLUMN id_userlogs DROP DEFAULT;
       public          postgres    false    216    217    217                      0    16431    deleted_users 
   TABLE DATA           o   COPY public.deleted_users (id_deleted_users, username, firstname, lastname, mdp_pharm, deleted_at) FROM stdin;
    public          postgres    false    219   �*                 0    16443    fournisseur 
   TABLE DATA           �   COPY public.fournisseur (id_fournisseur, nom_fournisseur, prenom_fournisseur, adresse_fournisseur, tel_fournisseur, email_fournisseur) FROM stdin;
    public          postgres    false    221   $+                 0    16421 	   user_logs 
   TABLE DATA           F   COPY public.user_logs (id_userlogs, username, last_login) FROM stdin;
    public          postgres    false    217   A+                 0    16414    useraccounts 
   TABLE DATA           n   COPY public.useraccounts (id_useraccounts, username, firstname, lastname, mdp_pharm, last_logins) FROM stdin;
    public          postgres    false    215   �,       %           0    0 "   deleted_users_id_deleted_users_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.deleted_users_id_deleted_users_seq', 3, true);
          public          postgres    false    218            &           0    0    fournisseur_id_fournisseur_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.fournisseur_id_fournisseur_seq', 1, false);
          public          postgres    false    220            '           0    0    user_logs_id_userlogs_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.user_logs_id_userlogs_seq', 34, true);
          public          postgres    false    216            (           0    0     useraccounts_id_useraccounts_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.useraccounts_id_useraccounts_seq', 10, true);
          public          postgres    false    214            �           2606    16439     deleted_users deleted_users_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.deleted_users
    ADD CONSTRAINT deleted_users_pkey PRIMARY KEY (id_deleted_users);
 J   ALTER TABLE ONLY public.deleted_users DROP CONSTRAINT deleted_users_pkey;
       public            postgres    false    219            �           2606    16450    fournisseur fournisseur_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.fournisseur
    ADD CONSTRAINT fournisseur_pkey PRIMARY KEY (id_fournisseur);
 F   ALTER TABLE ONLY public.fournisseur DROP CONSTRAINT fournisseur_pkey;
       public            postgres    false    221                       2606    16427    user_logs user_logs_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.user_logs
    ADD CONSTRAINT user_logs_pkey PRIMARY KEY (id_userlogs);
 B   ALTER TABLE ONLY public.user_logs DROP CONSTRAINT user_logs_pkey;
       public            postgres    false    217            }           2606    16419    useraccounts useraccounts_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.useraccounts
    ADD CONSTRAINT useraccounts_pkey PRIMARY KEY (id_useraccounts, username);
 H   ALTER TABLE ONLY public.useraccounts DROP CONSTRAINT useraccounts_pkey;
       public            postgres    false    215    215            �           2620    16429    user_logs after_user_login    TRIGGER     |   CREATE TRIGGER after_user_login AFTER INSERT ON public.user_logs FOR EACH ROW EXECUTE FUNCTION public.update_last_logins();
 3   DROP TRIGGER after_user_login ON public.user_logs;
       public          postgres    false    222    217            �           2620    16441     useraccounts user_delete_trigger    TRIGGER     �   CREATE TRIGGER user_delete_trigger AFTER DELETE ON public.useraccounts FOR EACH ROW EXECUTE FUNCTION public.after_user_delete();
 9   DROP TRIGGER user_delete_trigger ON public.useraccounts;
       public          postgres    false    215    223               q   x�U�A�0��+��D^�!����=$Z�����9�f@k,���t{<c��C�b�T�$h� ^�[�Z{Wc�}��s^w��_W�:�f�\�`6lB�T��(y�^������            x������ � �         |  x�u�K�[AE��*�]}귖L�A�̼�d��qUÛ��>W�p���x����&~���� �9�	+�a� ;sa.���??�}<oHx5APJ@V~:Y�����R�nF�آ����1�*���	@��� ��o�'��ڂsd�;�V����Ҕ���9�/h�e�����:�7�դ�K��r�8hˌE&�}C�פ���
оDyN'�3��Ub�*�["G��O�<r���8�u�֒�"ŧ�޹Jl��eh�.�ʻ閨J�P,K9F[�E�<�pK�tK4��`n���[�Uß
*�[��Q����s#ҎT#	�lĸ�ʎz�d8���zN�����ɘd��*��O޾�4't��c���c�`"�&���         �   x�MOM�0=���?��O\w�O��e��V��M�߻n*�K�#/!�������t=F/�B*�	�q�1�b�ЦP�2�WD�{q1�f����8+d>�
��u�MCe��^� �~ɡ�q�c��c[t���<�ع��ƻ�6���:%���.Z�%��6:���*5��	��<�"%Z��B�9�Fp     