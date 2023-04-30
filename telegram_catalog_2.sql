PGDMP         9                {           telegram_catalog_2    14.3    14.3 R    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    16535    telegram_catalog_2    DATABASE     r   CREATE DATABASE telegram_catalog_2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Ukrainian_Ukraine.1251';
 "   DROP DATABASE telegram_catalog_2;
                postgres    false            �            1259    16536    basket_devices    TABLE     �   CREATE TABLE public.basket_devices (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "basketId" integer,
    "deviceId" integer
);
 "   DROP TABLE public.basket_devices;
       public         heap    postgres    false            �            1259    16539    basket_devices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.basket_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.basket_devices_id_seq;
       public          postgres    false    209            X           0    0    basket_devices_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.basket_devices_id_seq OWNED BY public.basket_devices.id;
          public          postgres    false    210            �            1259    16540    baskets    TABLE     �   CREATE TABLE public.baskets (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);
    DROP TABLE public.baskets;
       public         heap    postgres    false            �            1259    16543    baskets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.baskets_id_seq;
       public          postgres    false    211            Y           0    0    baskets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;
          public          postgres    false    212            �            1259    16544    brands    TABLE     �   CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.brands;
       public         heap    postgres    false            �            1259    16547    brands_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.brands_id_seq;
       public          postgres    false    213            Z           0    0    brands_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;
          public          postgres    false    214            �            1259    16548    device_infos    TABLE       CREATE TABLE public.device_infos (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer
);
     DROP TABLE public.device_infos;
       public         heap    postgres    false            �            1259    16553    device_infos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.device_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.device_infos_id_seq;
       public          postgres    false    215            [           0    0    device_infos_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.device_infos_id_seq OWNED BY public.device_infos.id;
          public          postgres    false    216            �            1259    16554    devices    TABLE     Y  CREATE TABLE public.devices (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    img character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);
    DROP TABLE public.devices;
       public         heap    postgres    false            �            1259    16560    devices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.devices_id_seq;
       public          postgres    false    217            \           0    0    devices_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;
          public          postgres    false    218            �            1259    16561    ratings    TABLE     �   CREATE TABLE public.ratings (
    id integer NOT NULL,
    rate integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "deviceId" integer
);
    DROP TABLE public.ratings;
       public         heap    postgres    false            �            1259    16564    ratings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ratings_id_seq;
       public          postgres    false    219            ]           0    0    ratings_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;
          public          postgres    false    220            �            1259    16565    type_brands    TABLE     �   CREATE TABLE public.type_brands (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);
    DROP TABLE public.type_brands;
       public         heap    postgres    false            �            1259    16568    type_brands_id_seq    SEQUENCE     �   CREATE SEQUENCE public.type_brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.type_brands_id_seq;
       public          postgres    false    221            ^           0    0    type_brands_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.type_brands_id_seq OWNED BY public.type_brands.id;
          public          postgres    false    222            �            1259    16569    types    TABLE     �   CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.types;
       public         heap    postgres    false            �            1259    16572    types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.types_id_seq;
       public          postgres    false    223            _           0    0    types_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;
          public          postgres    false    224            �            1259    16573    users    TABLE     '  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16579    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    225            `           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    226            �           2604    16580    basket_devices id    DEFAULT     v   ALTER TABLE ONLY public.basket_devices ALTER COLUMN id SET DEFAULT nextval('public.basket_devices_id_seq'::regclass);
 @   ALTER TABLE public.basket_devices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            �           2604    16581 
   baskets id    DEFAULT     h   ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);
 9   ALTER TABLE public.baskets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            �           2604    16582 	   brands id    DEFAULT     f   ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);
 8   ALTER TABLE public.brands ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            �           2604    16583    device_infos id    DEFAULT     r   ALTER TABLE ONLY public.device_infos ALTER COLUMN id SET DEFAULT nextval('public.device_infos_id_seq'::regclass);
 >   ALTER TABLE public.device_infos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16584 
   devices id    DEFAULT     h   ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);
 9   ALTER TABLE public.devices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    16585 
   ratings id    DEFAULT     h   ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);
 9   ALTER TABLE public.ratings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    16586    type_brands id    DEFAULT     p   ALTER TABLE ONLY public.type_brands ALTER COLUMN id SET DEFAULT nextval('public.type_brands_id_seq'::regclass);
 =   ALTER TABLE public.type_brands ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            �           2604    16587    types id    DEFAULT     d   ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);
 7   ALTER TABLE public.types ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            �           2604    16588    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            @          0    16536    basket_devices 
   TABLE DATA           ^   COPY public.basket_devices (id, "createdAt", "updatedAt", "basketId", "deviceId") FROM stdin;
    public          postgres    false    209   �`       B          0    16540    baskets 
   TABLE DATA           I   COPY public.baskets (id, "createdAt", "updatedAt", "userId") FROM stdin;
    public          postgres    false    211   �`       D          0    16544    brands 
   TABLE DATA           D   COPY public.brands (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    213   �a       F          0    16548    device_infos 
   TABLE DATA           d   COPY public.device_infos (id, title, description, "createdAt", "updatedAt", "deviceId") FROM stdin;
    public          postgres    false    215   7b       H          0    16554    devices 
   TABLE DATA           n   COPY public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId") FROM stdin;
    public          postgres    false    217   F�       J          0    16561    ratings 
   TABLE DATA           [   COPY public.ratings (id, rate, "createdAt", "updatedAt", "userId", "deviceId") FROM stdin;
    public          postgres    false    219   ͓       L          0    16565    type_brands 
   TABLE DATA           X   COPY public.type_brands (id, "createdAt", "updatedAt", "typeId", "brandId") FROM stdin;
    public          postgres    false    221   �       N          0    16569    types 
   TABLE DATA           C   COPY public.types (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    223   �       P          0    16573    users 
   TABLE DATA           T   COPY public.users (id, email, password, role, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    225    �       a           0    0    basket_devices_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.basket_devices_id_seq', 1, false);
          public          postgres    false    210            b           0    0    baskets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.baskets_id_seq', 10, true);
          public          postgres    false    212            c           0    0    brands_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.brands_id_seq', 9, true);
          public          postgres    false    214            d           0    0    device_infos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.device_infos_id_seq', 178, true);
          public          postgres    false    216            e           0    0    devices_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.devices_id_seq', 87, true);
          public          postgres    false    218            f           0    0    ratings_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);
          public          postgres    false    220            g           0    0    type_brands_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.type_brands_id_seq', 1, false);
          public          postgres    false    222            h           0    0    types_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.types_id_seq', 14, true);
          public          postgres    false    224            i           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 15, true);
          public          postgres    false    226            �           2606    16590 "   basket_devices basket_devices_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT basket_devices_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.basket_devices DROP CONSTRAINT basket_devices_pkey;
       public            postgres    false    209            �           2606    16592    baskets baskets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.baskets DROP CONSTRAINT baskets_pkey;
       public            postgres    false    211            �           2606    16594    brands brands_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_name_key;
       public            postgres    false    213            �           2606    16596    brands brands_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_pkey;
       public            postgres    false    213            �           2606    16598    device_infos device_infos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT device_infos_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.device_infos DROP CONSTRAINT device_infos_pkey;
       public            postgres    false    215            �           2606    16600    devices devices_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_name_key UNIQUE (name);
 B   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_name_key;
       public            postgres    false    217            �           2606    16602    devices devices_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_pkey;
       public            postgres    false    217            �           2606    16604    ratings ratings_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public            postgres    false    219            �           2606    16606    type_brands type_brands_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT type_brands_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.type_brands DROP CONSTRAINT type_brands_pkey;
       public            postgres    false    221            �           2606    16608 *   type_brands type_brands_typeId_brandId_key 
   CONSTRAINT     v   ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_brandId_key" UNIQUE ("typeId", "brandId");
 V   ALTER TABLE ONLY public.type_brands DROP CONSTRAINT "type_brands_typeId_brandId_key";
       public            postgres    false    221    221            �           2606    16610    types types_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.types DROP CONSTRAINT types_name_key;
       public            postgres    false    223            �           2606    16612    types types_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.types DROP CONSTRAINT types_pkey;
       public            postgres    false    223            �           2606    16614    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    225            �           2606    16616    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    225            �           2606    16617 +   basket_devices basket_devices_basketId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.basket_devices DROP CONSTRAINT "basket_devices_basketId_fkey";
       public          postgres    false    3218    209    211            �           2606    16622 +   basket_devices basket_devices_deviceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.basket_devices DROP CONSTRAINT "basket_devices_deviceId_fkey";
       public          postgres    false    217    209    3228            �           2606    16627    baskets baskets_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "baskets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.baskets DROP CONSTRAINT "baskets_userId_fkey";
       public          postgres    false    225    3242    211            �           2606    16632 '   device_infos device_infos_deviceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT "device_infos_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.device_infos DROP CONSTRAINT "device_infos_deviceId_fkey";
       public          postgres    false    215    217    3228            �           2606    16637    devices devices_brandId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.devices DROP CONSTRAINT "devices_brandId_fkey";
       public          postgres    false    3222    213    217            �           2606    16642    devices devices_typeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.devices DROP CONSTRAINT "devices_typeId_fkey";
       public          postgres    false    217    223    3238            �           2606    16647    ratings ratings_deviceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.ratings DROP CONSTRAINT "ratings_deviceId_fkey";
       public          postgres    false    3228    219    217            �           2606    16652    ratings ratings_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.ratings DROP CONSTRAINT "ratings_userId_fkey";
       public          postgres    false    225    219    3242            �           2606    16657 $   type_brands type_brands_brandId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.type_brands DROP CONSTRAINT "type_brands_brandId_fkey";
       public          postgres    false    213    221    3222            �           2606    16662 #   type_brands type_brands_typeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.type_brands DROP CONSTRAINT "type_brands_typeId_fkey";
       public          postgres    false    223    3238    221            @      x������ � �      B   �   x�}�A� ��u9E��2�PT����颉����}@���K�&@hb}��#%��"N�7��7�n���Z^�(��	��9���'O�GJ˞e*'���A���H6�+�+�RH���T��ǭ?W���咇��PO�ꖹ�nӓz�r>�������J7�۝��m�      D   �   x�}���0��s=E㤡�,�` n\aT�TTVx�s� q��Oo�8�q�]w����F=6�"-�6d�\�/�|���D�i'��Ǭ�b�,)�ُR���D��2a��3�U�!��Ϩ�@OD/�4G)      F      x��]�rǕ�M<�(�-[r8�����-ʒ˶$&�d˕*�# 3X\(A�HQ+vDYRD_d˷x����H���^A/�z�=�t�`nH3�c�"��}���>�;����1����,�/�냇�����sw����%w��¯]w[�9wFn����ww܍���`W,�/���\t�а�����ԌF69�RR�	%=�LKJ2�)�TZV3���MjBO����>�s��Mv+c�V���ON��99s��B�lضY=u�\p�7�M�~��\��?�[4�U� MH�=`�6�]��v`�E|j:lS����0f�}���Ii�lJ�ܜU�����_H-�~�a6��i����a٦t��:�N�Ӑ>2��ݬt��Sy%�T�lx��&=�k#y|���X��x�C�}�Fv��5`��#����!�7�-�Ed�2p��I�ߕ7���~�����L��)Q�������In[��>�x�Ǆ��nV�7�)��<� \�ž��_=���QYr���o� ϡue\���Ŷ���%ס3��;�8�t�úI�y�;��%�o	:?�I�������M���pFt�ׅWđ�����xR�'s���!���#%_o7[΂ժ��V�gR��̻�~��u� 5�-��W���Ϫ�9|�I��x����]��{{�<N�8$�m�O]���5.���V|x����S�}l��a>�3
�.p�[���O@�k��(ٯ�?��{�t�� S~5�-U�s4;gR,��ڌU�q*��[V��T�S�����V�SnW���}��.#Z�;�ٲ�0SyU��t�M���)�K�e�jiMo])6:��+�;/���jn�J��.��ޏ���>�f�a�h���a@g��(��@��q��a��A��"�&�μ6x8��˗�Ш� -<K5��rJ��0 ДM�b;2`/���.�??L��-�Dr�8(����ٰ�ԮW�o�䤔�ג�dV�d2��b�~&�;g]5ǲR�4͟?�:��i͗[c�"U��8��;��k7����F�6�Ve�v50�fu\�[��(Ôj�=dqJ�2ݤf�v*ڄ͍���3�N����(/MNg"#��z&�j����T��H�6�����|��+���c��26X���jRN��K4�}�{�G�ϻd�zlS�#3z��:س�(�."�����i��vS�l�m{�j5�!�`6*eg�6F�p���7S`��d�6r�)�H�����`Du��o��Iz�� 0A�E�p>#�؊�+ ��2˶U��f��v�aY�l�)��8���������W�7�J"=zdAŏ�'��J��6B|�݀���5,�l���S��7q���P�I�f$2)'�y�pF��z�@cl�$��&pA�[|H�b���[q�$2/����k�0i�}�nM0��j��4v�|���Xeo����7*���]� x���v�%8�Q_4���D�|t�<_��j''���Kg,��.�;�� F��6f�VXZ9�VN���IM&ң1�=�g�����~��wkgO�"�� T3~�ɭGR!��N�#0U2�ˎS���##y;-(\\�%)����K��ѵ��L)Z*�U4h�%�`'x$��f4]I��TV�G �uKL�@4F՚EG5��Tj2���:Ф���0��9����	sɀ3Gˏ�~��Hʊ^���^�H��H�w~��\�k��6�:z9��ac"�a��q������($ϔnH�v��7�c��+�!/5(�#\�4��q���'`RoVh=G��!IT���h#-��E4�����"����?~�s0]ZNk1p/Ф���2R�sӬv�l�֜�lu�a�w�~�}����&�3���KM�J}�ك�\������r2��
��;h�^\�_E>����8�T�����|��!f���f����t�AϠf��8�Js�]2�L�V��ɚ�l����-�Ҕk���u0Ĳ��(�@��%2���x!���ڽ�>��8Dk�/Y̵ v��L��Y<
m`L�z���'.P���O��Є�`1���4��d���P�n�e��.�}����魰� 9t�F��=���r�P˛h��"eERU]�R:z���I���W���U%�9������V��I�����������ˇ�	�t���Ǔw��\�a�[��M��4|�V��z�DnyxB�4B.wZ���X+�(��&�-�7|�1�L=*6�ԣv�	�!<�L^W�d2�CMj:�ه�o��> �������̹�X�J�M0���ȷ������ �����l�-Q�(�G`p�t�qaop������Nb���blw������Q����4��� k����Z'����O�kh�p����7XX�!��6쎇S�1X��1ΈaZZ`�n�J�N"�?Yص��у�>�*@8)�T���>k.�(2 �����L"3�u�ֶ�:���: %�Ehw(�{�3N�V���}!ˤb���A����a��ȩJ>���JLT<Фf�����J��s.]�Кy[?{�dH�j2�����;�,��2���+�@��B��
z��/�?t]�q幻�x��ݜ5�}p|Nqx�X�g��X �>Z��,VK�~�As�j�ikV����}\��i�!�@��{E@�Ss��t���
P7''��<Ф����	�F�R9�>��q��܁�F ^"#�0:���mIVp�� ��������6��Q>��,eX`�M��4��Ci�]`o͸b�
)M(
~2]Ra��1,�Hihz���C�m�?���B��L��M��Ȏ6����,`���t?Z��¥�s��6�a��>Qn��A\#Ź+��@j�E�e���o�{wF��S@�5�Y�y��\�t��~������w���%�����9��[��&-�� .0sa�6}q���9E9w�C���	̦;��c�?e9)IMi��A�IK%���g��i9��n���n��h�lq�o �e{�����(;s�#������K,��^7\��?*-�a4�l�-�y-%��3��&r��m�n7�Fu�tA&��|��yp�2���"u-���t�S�*�����%��=�Q�j
�]�`yԄ\m¤�c��)��*�M�d�ĢB
x��8CH�,��L�Y���E�y��e�(���p8t]ʹucA���G(6������E�~g�r��l�|�ıNXfټ���P�H�I��}��v�(��Qi�EJۛ�&H�A�'��<��%.xFF�@���x��U4�
��{�b�M�X�k��:�5p\�rdD�	�k����﹏Q�@��c5[N�Kaݚt�=_`{�����٪ULfSiEK�#�?�%�\��'r����'�j� t�i4��$��Y�a"&">d�Y�m�C������)�J:��~ m��-���`_�c>��N`b���Z<��oŀ�
-�/���F}Xmˮ�����6�<�N[>��h�ņ�*8s�Q,�Nՙ�L��jF:C���*�M��K;�Ǣ�?ct�A���i
�6���v��
4i�Dn4�{�C�\1P~�	���}�|ܧ�Y��燂�r�{�荹�/��T�J�v���zb~��lTN���hTM�d4
�T+�(W��{{��~��˃
�x9͍�~mVM�"�ZΤ �b��ad=�0@���&cx�o�2��hD#�op:��ne!Qҕ��;]V���d��(���B	Sh���m��1o�3[>G�+��lUz��w?�*�[vѩ[f	3H�>+�Pݏ�{^���Z�l��>�$&�E��I&����eLr�Y5����(�,�v�g�^�Ƕ~��U]ͫ&3IUMr`�:��ܛd�I���2�k���v�dF�^8�j�����I#����h�I�&��h07�\-����Yq��0���1c���H��#��oB��VJ�b���w)"I���x\^|��#�pߑ�*�W��Y�jZ-�h�װ�Z�������~�^�(��    �|]O�0�ߤ���P�]�k8vDq�J Mr���-�d�R�����g��aV�%�\�z��c�Ǧu��ca?��vX��#�'e�L%z�U����7y��5V|&��,��kvڰ�y�Q8�xx�Y�H��x�IW�+�L��*V�n���݃S�C���_o�=/��2�P��*R��W�s�� ��w�6�L<��g�y��f�yΆ�ͷ�_Drw�b�K�����#*R�?L�Ba��p)��59��)��.���+��f�l�,۬7��*~8I?�Nv�bT�Bg��J׮����In`Ĭ�+��PKW`E�I5F����>��`�v���bO��.*�ELa0װˡ�2,fXl��I�ȆL<��Au��H��3.T<+.f�����,>����
�O��uRK��p>bS74§Xa����l���O)>�1�8^�9h�����`~X����ڱ�����IXSr:��M��H&G�V�m^1����QI�q��N��;>��걆� �����b}O����+���ﳲ��v	z��ʾz���t��y�̷	y���K�0c8ӁH��B˰b��l��K�Ϡ:������s?���%����F��X�F߳b�
��V�`-�mD���:e�0m������bt�IDZ!O�Ѱ��1p%'�" �&]ጶ�^`�����s��7�UO�޵C����ǹ����`n��۪�r-̙fi�(V
��X[(.E���L;N�k��s���$�8���,��׸	���!���1�Fcg�}׼CA}��#�OͲ���>s>��VA�?�H�W�ѕ�ʿp��ϩ-�w�p��0gUԡ�T��M�L�2<G�$"Ȯ|v���m�vȃ�;E��"�!q�r�F���`���9�����p_�X"s�����f#.1�ʒ"+۞z�Zv�ՐM�f2�F�,�b칮����1Nh�IO/FC�*�L$�H
�� p��F��,Hߋ<��W��4�&'��,�e���A~��v��di4��rX���%�#�G8h�Ϋ�Be��bf�>o]����EAmՒ��.Fck4=&�h�3����9�N�I��?<{5}�T�������G����(��c����*6�h�W6LGk��ox�ǚ�Ȭ?G�L����nd�c��G�Ip����w�Or��=��"鱜�^�EXT�|*'+�8,�oҳ�dj4���?�8���ۛ̐J2X9�Iz���r�r�rF˝z�ݷ�������>�`pi�5�*���Y�:W+3�xD���A 5�$�<=<⋁��Q��l��F�99<K�������0� ��v��ڹ����|��G��G'#2;�ןO��� I��5/��J�f��I��6����;�/	�	Mo� ��=��GJM��s��~�T:�B�ju�q;���uv�(���Sɋc,�G/:�����p�Y�%W;����K��%锈qO�C߂@l<D��|W�d	5��hl�P;������/�z�n��\���ܟ�<ϧØ�&�z$����$�JZN�"�PS:	�8���W�N�8��kAZ�!�2ث:�?R�H!E4�~Y�'�𒻿4<�JA^�}w�J{�S�bY.��	����oM�+|t�<�q�4o�}B-k�v��Büfm*����M�p}4�	�;���*��4���%�aڄ��D,�_�`�j��,X���u�-��hJD燚�j"���B����S���;W
��%��g0�>�=�	�m�:L�ρE�])N�3P�ZǓ��O��(�3Wߵ<���Wv��!
�`eO7����Xo�2�r*N��	V��`�5�8���4��1����a�n������\�q�|�pp��5�/�?�̸�cu{F�Sv�����9/
~��!��U9�~�C��T���N���8�O'^���ū�ܻq����E�;�	k�<��0�J��e�D%�o�#�c����s�wʨ�|.4�eǩ�᭿�\����v$<�K��=V�c�d=���z��C�
 �T\�xa����YW27D9�H&��Ns,��#�,��7�hi9��ӧ���"�S��5L��X�O�����ىO��|"��Ɔ�0�-6:`~�:L ����G�J%2�$&q��?,����@�G�Fa%6s������Y���ܻ���a&e��;���h��t���{Y�ol����!�ٷ�}D�Oyxe�]��\D z�Aۡ�'Ű��w¯ba�e�M�i�ce@赓I�{$��
5�30��`�֩8U�ZhV��'����<&��K\e��-恑�z.��7u���jlIi�).�6,�Y(�S�T�h��M8�����s
���,dL`��Y��u���)�H��QW���|UX�0Zb0,�� �P��O?@���2oѹ��k:5���Լ+�f.[����i �u:]�9�b�K�&uCMip��і�#S`����>Y5�K�;�v�c-b��{����D���W2r&�����)~�6�ڝ.L;%��1*��������Γةǜ�C �0IL⪙R�9Zk�� ��sJ��M��6�Yh�F����BHΞ�)��,��k�/��E� ~~�5��N�>�l�\|�_�gA!bg˔r�J��ï{���z@[�g�y��C��OgЂ�s��»��L�x?>ܚ�T%���7Uy7��Y̙���D�}^��2>��7�yp_�7��P�,��g�Wz0��<`G�)m���5���o'8�Y�ʊ���2��k����(��XÇ!䳽�y��2���U��j"LK���j>����fɂ-���&�bT�M��?���Ҋ���=ኽz��
e c��MHSV������x�#�wÒ�!(
��|"Ѫ����L��+���2�@������_׹%����<��9t�[:���-@�{]��;��E�vY P�M=�7&P+��Ϩ��y/���=�G�{�ׄ��C��hS����e����g�6ε�u��
�z�xہ���hYF�)��>.�����NW��o;wN��N�Q��*(�z ����4UqN��R��P5Ja\Q�hqq�)�>n��e[��մ��ڷ'6c+f���s��XGt �EdIzͫхO�u�un/��ټ�˙l�4e�?��͔-6�Y����i���a?�C���uhv��`�."ɽ�m-����W�����������lI�]2�M���F�rlp�[��:�1�[��톳`5�M:���ZZ��M:��;:e�=�VNF/S�ܻ`��nM��j�]�^>�ه}%�L�E�����MA�\�hʀ��m��G��~�{mz,>�0�+���=(�j���U�[
F=�x��#~���,��D�w���h��}��ί�j�`9�Н`xMo�m4E;��o���8�� ,���Pւ�<;w�G�����q��@Sܽ}�{h���X�?/��w��	s���C�"*.& �G����xo�_����!��x���_\��,��-�y]�z߿F�g���N}ؔ/q?w)*J��*[f6�N�Fm���znSy$;C����T�$N��oPD����]q�� ;.�n�����s�1����x2����m�y!�a�^'��əU@�KTy�I^��������tR�H<_�p�]G� ;D?�N�>�/�ٍ-�g�򀨅o��w?����)��0>R5TK����MY�~r=�o/�̞T���vNϜO��J<�������ɛ�s���񔨆��;�Ne��~C�2�8r�=�Rڗ$�b�h5L0+heRjɨ�m�}�X6]�v7��PQ��[V)��D��2q�7u��!���Mq�V�3w�h�f�W����E*A��A�'�˦",��zFִ0hʂc��{9O�m���������f�)p3ԲDa�.�X�W���Vj�s�
e�^��/�2�;_��������Vr�N͙�����dF4e���ǵ��j�S �z2{�*�݄@' \�I�=Q!�ڐg���V+�(ryE���0Y�).�>.l�Ų�ǒ-+j� �  B*XJ�ʯa?4N~l�����T��X��΃�.���蒆�>འ^ʎ��l��a�>�_H)�i+���ڬـUڜ̤r�8lF�b����t�J�F	�Ii���S3��و߫)x˟�� �@S�}�3���P
���B�x�q�׽b9�
O��+���I��'K/W��q���)M[W�*~>k���v=gԚm�X����G#�(M��E�^��=��=V�Ƭ7C^���<�n�~2�s\�Ā>6	2�r��J�6C�J�@�/ܠ��0'g���fR��mN��A���ƂU4�Cux��5$%�rJX
��87Д�}� z4C&ص��O�L�WF��a�ܤ�	X��_���";Ae.�͗��]1(�/��@��(tQK�탾���v{�ss �I���xP5�K����ޅ�t� �)��{_l��La�p�ybo�5�����^�y��ǰ�އ��Ѱx�rMV�'gCM�Hn4�/���^N$��$�;      H   w  x��Zێ\�u}���lDժ�e^%1��qB��C� AU�*yL�#�X�DJ�D6)2!eYuq�<)�L���/��'��O��u�b_
A@�Lworj�}Y{�]�jo�>�>�>���lz0=��G��OW���GI9�-|�Lk/Y�ed�+�eUIټ���/�I.%��{v��@�iJ�?���2�=�/�����B�x���@���x����8zf�L���3�y�Fe��9_p{ �"��}��)��}i��sW/_9z���𣫗s;Y�Yo"Q:�c�,��v"Vn"ݓ?a�T������a�t�j��t��;�.�-ߞ����������ӣ�[���{o}���5\Zq�.,)i����Lj?Y�*j���/4W\�&�
��ׇ�7�w�׆�����!~�.�O������Gf�LL+X�F� ��!��G�C��Ypk;H�M-6ao�[���忴<=%�|4���GTԦ��5�<"X��EkƝ.qLڈ�u�Eb.��Z7DM�V<'@D��_��Sw�C�ࠇ�;�F^�חצ������xwOp�p����cIXϴ\6:��\(��p�#���u����_�d��V�{4����/^Y�W���9�5+��,q�X�2Y��O!�`:˻���M�����ޣM� 2{;�ϖ���=Ԫ�7�B�y�^�B�"��);h�8Pb�M��6LB�S��~�|BL�F�@�5L_Og��J�:��jب9!�(�F�G�F�.0
�U�UΌ��..��]�	ֆI(¥���9ˋ/l���J�q�t��!^�狟]//��/�9�9�%�hU�
^�U|7^�B��2��ֺk�XHv���w�|LGG�/��52񠘓ĵa�����U��kq�c�RzǮ��(��ל���ר��Ly[�%�����ht�����JG���
�s��i����^������WʥˇW^�]:z�R���Ë/4h>hN���rA(�R@EW#��މ�|G8�|�t��7L����C����Ÿ�юv��,�gy���"xD:�@9;�G�l�h�$Fw\�ajM@�{/]���W.�|���]C�6*4�q��,���UE^��G
U�w
tÄs���Ϛb�%ǃ�ϻ��Nd�cF7�i�/yg�!�b�{-G)z8�{Ͻn"9�E�'?��$N?i���	ۓ��� R��Ϭa�1E�:q�N�����LAk���w���[Ȟ��0y�H�ZϽz�G7K�dW���oL�|d!G�R��xD��J$��~��P6eۮ���&"�o���hr�I�7[�;#��?�-��u��"d� J�Hs��B0xc
��}X.dPp��t� �^ozjygX��b�ʅ&r�Ƈ�*���%��q���'�.!zZ7� ��[��(�XY|��	�=F�J�d��4�����p �cm���m�嘲s�o�'=u�T� �g,.&���Z�����P%A����|�,Z���.�ӌő��9,��U!8��;]��4?h��Vf�$�=ך3�*�X���7H^���(8ė
o;���R�$L5�,�,Abr�!b�sȽGA����(��Κt�;���t47��d =�Gy�=��40���� Fx�����.cF����X�w�\̺Ih�����'�l�1�v4@����>$\�W�3�,gV��4$7�
$'��p���r��W����4�W�9�C8�\�cQٌ>��@��!�^���P���8�U��uӌ���2��3䠻ȩ��-Ӟ<�W+*�@�'�S%V���5�*�G�j4�^8�;��M ���a$4)=G�
I�2�1ޮbG=Y�u�NW�lN�$zD+6I��WAX �%���΂�NVo�f��
�P��߼���<�1��t�ѷ9��K*sP'ZJa:�0NR)P�Nxeyf����C��~VY��b~�r�h�;�Q`GPU��ZPA�A�fV�XC-J�4��P�X�����}cz��"C����*H��W��~gv���D)2h(K0�����a�!�x/͍��X��3��Y��w��-������9izGWo��#s�Fϱ`d� ��2�z$o4e�����0͐\sy0CZ_4�b��t�Zzn%�������ܯQ�*`���FG�g�PUq)���v����0膉Ĕ�{[@ȫ7���uwXI:����V���WA�$l5���C�/���&ҟ&�ۅu�ٰ��=��:^s&5�5o�<�w^��W��l��*{�5�ϊ�ѩ ���Je�4��1{�m늹Ku=����2w�D����=$�C|����HF��ݺ5�S��@I�䚒�:�C�"���x�PR����j���T���#y-���z�S����z��tw�C8�\��6[L].���d�N�V�,w)'A�[v5ۖ������Mīm��G�NO��	����+F����E%f�Q��7Nvj��N����fi�P߭��l+��ȶ�M��B�Z��O���h��0���[�;�i��<B=�^K������9s����*���1�[FRԙ%�,G�Gk����X��ŷL����n�bt��T~˷h��}���pF2Ƙ-��2z�a*��o:�}֙wÃy�.|7>�&�FZ"�{�'�i�W��	�����w��?�V�ZWP�s�H��מ6�B�Uc��e��<����m꺩�5�[M��ȡT~�(��}��W�a��V�9̽����H&����֫�,��jSvٗ�{�o���d�Լ�;�i��ϚC$$��H�P�@YI�ўX�j6^�$�.1��f�ί[��^hOzr6��'�����t-����$���[`�������"��t�mM��Ŭ��Fh��h\uT�����v����p;���$�KRi��+�َT-棹*�G����h��ؓ�Xu2�Rq����&�IȺ�{������p��sS�n�Lc���l�(�H�V��pR�8J�Y��Y� AA�ם��0Qb9I��6�B�����J��`��0i��Z�y@��B<Z]�ķY��<�nj� �����~���J�}-���p�Gt���4��b��uw,V|)C����m�\#j��k��L3�6t��^�o�=_�s���	!c�ȴ��6�L�us)�!�N-m�f8f�m��u���b.��,����w)koN���L�A�oN�ό�0�瘐�S���'�r�4'�^'��|�y�[���mp��ҷ��}�6W����mNր6�jŠ�h�_"tY⁙�p��Xz�J;n�kG�n��Ť��O��r���|>���˱l
Be�cQV��.�X zb��KL�faw��e>���<�<��v(��{�ch�\�t����ã�+]RN23+H��7����F���:F�Φ[�f������U����q��T����.��H�$TZE�	���Q�zĦw����]�xb���@zشZk3�/�j�������)5o��ܥq�hV�\�������0���b��~�o�h4�<��c�SH����Z���19��MVڙ^+U�b�u�+�&`	��1�gt�GM����K��{�t�o���y4.��@GZg��!��qd�{d�����y�����(����9�{�anҦ��e6�]*�� :��a��ˬ{�����u�M�8]7������u��
�FR@��@��Y�M�Lj>JDN���g �Jw�f�Ԯ��iS`+b��$f��w����ͼ�,��tӅ e��؝B�ED�|�Q��t��;Mb�2c 	Cqݾ���_������O�.(�.���Gz����j���S+�?*�U��̃ˢZ�+f-h���Ӷ7L3"P�����`su�?{��~	O=n�Ob��pJ[�v!�I�
N�g��O�f(מ.��	��fK��W����b�6<Ů$�4'.dO�m�� n������      J      x������ � �      L      x������ � �      N   �   x�}�AJ1E�S��^&TUҝ���aE\�FE��2��s�ʍ,]u���U�~���^��g��ad�b���!
g��c�+� (fy3�W��3}�Ќ�`�.��anj����i]�%��sY�L��]?�me��-���%���K�����$F	�1-JjP��z�C��{Ա>��`�K^ii������o�ԝ�{Ww��ɾqhG,��}J��.\{ �'���      P   �  x�}�K��@E��+f1�Դ�4�jP| */�R�BAE@E�>f*���$��N�{���-6Q��K�(�,����3$�M(���s�*z�'��V� ��\���$
ǹ$�W��C�q���<f(�,(2��^ y�Hd�����A4���Qŋ�o�h�dE�n4ȳ}xBKC�i��.@�f����H����8��i�xz���0	Ƕ�>"�P�0�H���8;^������8��E�İJ�#:�2`����d%O�	^od������J�����(#�PD<`q���#���aY\i���rZݪ��u'��o�݋�!ұ���t8��=;�q��+@�����1�}�7r����c�i#1�>L�u��x���W|�Ksg\����pr;�(���=t�`��Ҵ�ps�k���+�	�m�|D4�;��0:K~�d�b��U^Y��qj��Nc	�L0��*?k=�.2Aٞ�f����n�_W�}�}�C7-D#L�*�� ��_�qw���&�t毥��&C��ም��%�mVՑg��F^���1+2|��GD#�M�m��HQ�]�f��9#?�g�ѷ��UM��&^���Hf\�גaϮ������O�YX?�����D��-��u��*�\���bt-�D&�.t8[�:<!Y���Hjl��*m�����]�d_����
�����h��	�SQ9     