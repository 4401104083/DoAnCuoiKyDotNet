PGDMP         *                y         	   da2_dbdev    13.4    13.4 T    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    16394 	   da2_dbdev    DATABASE     m   CREATE DATABASE da2_dbdev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE da2_dbdev;
                postgres    false            ?            1259    16407    Account    TABLE     
  CREATE TABLE public."Account" (
    "IdAccount" bigint NOT NULL,
    "IdUser" bigint NOT NULL,
    "Username" character varying NOT NULL,
    "Password" character varying NOT NULL,
    "Salt" character varying NOT NULL,
    "CodeGroup" character varying NOT NULL
);
    DROP TABLE public."Account";
       public         heap    postgres    false            ?            1259    16405    Account_IdAccount_seq    SEQUENCE     ?   ALTER TABLE public."Account" ALTER COLUMN "IdAccount" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Account_IdAccount_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            ?            1259    16480    Clicker    TABLE     ?   CREATE TABLE public."Clicker" (
    "IdClick" bigint NOT NULL,
    "IdAccount" bigint NOT NULL,
    "IdItem" bigint NOT NULL,
    "Click" integer NOT NULL,
    "State" integer NOT NULL
);
    DROP TABLE public."Clicker";
       public         heap    postgres    false            ?            1259    16478    Clicker_IdClick_seq    SEQUENCE     ?   ALTER TABLE public."Clicker" ALTER COLUMN "IdClick" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Clicker_IdClick_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            ?            1259    16444    Items    TABLE     6  CREATE TABLE public."Items" (
    "IdItem" bigint NOT NULL,
    "IdType" bigint NOT NULL,
    "Name" character varying NOT NULL,
    "Money" numeric(18,2) DEFAULT 0,
    "Sales" numeric(18,2) DEFAULT 0,
    "RateAvg" integer DEFAULT 0,
    "LinkImage" character varying,
    "Deleted" boolean DEFAULT false
);
    DROP TABLE public."Items";
       public         heap    postgres    false            ?            1259    16442    Items_IdItem_seq    SEQUENCE     ?   ALTER TABLE public."Items" ALTER COLUMN "IdItem" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Items_IdItem_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            ?            1259    16497    Rating    TABLE     ?   CREATE TABLE public."Rating" (
    "IdRating" bigint NOT NULL,
    "IdAccount" bigint NOT NULL,
    "IdItem" bigint NOT NULL,
    "IdTransaction_Detail" bigint,
    "Rate" integer NOT NULL,
    "Time" timestamp without time zone
);
    DROP TABLE public."Rating";
       public         heap    postgres    false            ?            1259    16495    Rating_IdRating_seq    SEQUENCE     ?   ALTER TABLE public."Rating" ALTER COLUMN "IdRating" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Rating_IdRating_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            ?            1259    16514    Review    TABLE       CREATE TABLE public."Review" (
    "IdReview" bigint NOT NULL,
    "IdAccount" bigint NOT NULL,
    "IdItem" bigint NOT NULL,
    "IdTransaction_Detail" bigint,
    "Text" character varying NOT NULL,
    "Time" timestamp without time zone,
    "Rate" integer
);
    DROP TABLE public."Review";
       public         heap    postgres    false            ?            1259    16512    Review_IdReview_seq    SEQUENCE     ?   ALTER TABLE public."Review" ALTER COLUMN "IdReview" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Review_IdReview_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            ?            1259    16537    Rules    TABLE       CREATE TABLE public."Rules" (
    "Name" character varying(100) NOT NULL,
    "Description" character varying(200),
    "Position" smallint,
    "Code" character varying(20) NOT NULL,
    "CodeGroup" character varying(20),
    "IsDisable" boolean DEFAULT false
);
    DROP TABLE public."Rules";
       public         heap    postgres    false            ?            1259    16532    Rules_Group    TABLE     ?   CREATE TABLE public."Rules_Group" (
    "CodeGroup" character varying(20) NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Position" smallint,
    "Description" character varying(200),
    "Id_Parent" character varying(20)
);
 !   DROP TABLE public."Rules_Group";
       public         heap    postgres    false            ?            1259    16558    Rules_MainMenu    TABLE     ?  CREATE TABLE public."Rules_MainMenu" (
    "Id_Main" bigint NOT NULL,
    "Title" character varying(100) NOT NULL,
    "Summary" character varying(200),
    "Id_Module" bigint NOT NULL,
    "Link" character varying(100),
    "Position" smallint,
    "Icon" character varying(50),
    "GroupName" character(50),
    "Target" character varying(50),
    "AllowPermit" bigint,
    "AllowCode" character varying(20),
    "IsDisabled" boolean
);
 $   DROP TABLE public."Rules_MainMenu";
       public         heap    postgres    false            ?            1259    16556    Rules_MainMenu_Id_Main_seq    SEQUENCE     ?   ALTER TABLE public."Rules_MainMenu" ALTER COLUMN "Id_Main" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Rules_MainMenu_Id_Main_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            ?            1259    16548    Rules_Module    TABLE     g  CREATE TABLE public."Rules_Module" (
    "Id_Module" bigint NOT NULL,
    "Title" character varying(100) NOT NULL,
    "Link" character varying(100),
    "Position" smallint NOT NULL,
    "Icon" character varying(50),
    "Target" character varying(20),
    "Summary" character varying(200),
    "AllowPermit" bigint,
    "AllowCode" character varying(20)
);
 "   DROP TABLE public."Rules_Module";
       public         heap    postgres    false            ?            1259    16587    Rules_Module_Id_Module_seq    SEQUENCE     ?   ALTER TABLE public."Rules_Module" ALTER COLUMN "Id_Module" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Rules_Module_Id_Module_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            ?            1259    16573    Rules_SubMenu    TABLE     ?  CREATE TABLE public."Rules_SubMenu" (
    "Id_Sub" bigint NOT NULL,
    "Title" character varying(100) NOT NULL,
    "Summary" character varying(200),
    "Link" character varying(100),
    "PageKey" character varying(100),
    "Position" smallint,
    "Icon" character varying(50),
    "Target" character varying(50),
    "Id_MainMenu" bigint,
    "AllowPermit" bigint,
    "GroupName" character varying(50),
    "AllowCode" character varying(20)
);
 #   DROP TABLE public."Rules_SubMenu";
       public         heap    postgres    false            ?            1259    16571    Rules_SubMenu_Id_Sub_seq    SEQUENCE     ?   ALTER TABLE public."Rules_SubMenu" ALTER COLUMN "Id_Sub" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Rules_SubMenu_Id_Sub_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            ?            1259    16422    Transaction    TABLE     ?   CREATE TABLE public."Transaction" (
    "IdTransaction" bigint NOT NULL,
    "IdAccount" bigint NOT NULL,
    "TransactionCode" character varying,
    "Status" bigint DEFAULT 0
);
 !   DROP TABLE public."Transaction";
       public         heap    postgres    false            ?            1259    16462    Transaction_Detail    TABLE       CREATE TABLE public."Transaction_Detail" (
    "IdTransaction_Detail" bigint NOT NULL,
    "IdTransaction" bigint NOT NULL,
    "IdItem" bigint NOT NULL,
    "Quantity" numeric(18,2) DEFAULT 0 NOT NULL,
    "Money" numeric(18,2) NOT NULL,
    "Created" timestamp with time zone
);
 (   DROP TABLE public."Transaction_Detail";
       public         heap    postgres    false            ?            1259    16460 +   Transaction_Detail_IdTransaction_Detail_seq    SEQUENCE     	  ALTER TABLE public."Transaction_Detail" ALTER COLUMN "IdTransaction_Detail" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Transaction_Detail_IdTransaction_Detail_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            ?            1259    16420    Transaction_IdTransaction_seq    SEQUENCE     ?   ALTER TABLE public."Transaction" ALTER COLUMN "IdTransaction" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Transaction_IdTransaction_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205            ?            1259    16434 
   Type_Items    TABLE     ?   CREATE TABLE public."Type_Items" (
    "IdType" bigint NOT NULL,
    "Name" character varying NOT NULL,
    "IdMainMenu" bigint NOT NULL
);
     DROP TABLE public."Type_Items";
       public         heap    postgres    false            ?            1259    16432    Type_Items_IdType_seq    SEQUENCE     ?   ALTER TABLE public."Type_Items" ALTER COLUMN "IdType" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Type_Items_IdType_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            ?            1259    16397    User    TABLE     ?   CREATE TABLE public."User" (
    "IdUser" bigint NOT NULL,
    "Fullname" character varying NOT NULL,
    "Gender" integer,
    "Birthdate" date,
    "Address" character varying,
    "Nationality" character varying,
    "IsDelete" boolean NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false            ?            1259    16395    User_IdUser_seq    SEQUENCE     ?   ALTER TABLE public."User" ALTER COLUMN "IdUser" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."User_IdUser_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    201            +          0    16407    Account 
   TABLE DATA           g   COPY public."Account" ("IdAccount", "IdUser", "Username", "Password", "Salt", "CodeGroup") FROM stdin;
    public          postgres    false    203   ?n       5          0    16480    Clicker 
   TABLE DATA           W   COPY public."Clicker" ("IdClick", "IdAccount", "IdItem", "Click", "State") FROM stdin;
    public          postgres    false    213   "p       1          0    16444    Items 
   TABLE DATA           r   COPY public."Items" ("IdItem", "IdType", "Name", "Money", "Sales", "RateAvg", "LinkImage", "Deleted") FROM stdin;
    public          postgres    false    209   ?p       7          0    16497    Rating 
   TABLE DATA           m   COPY public."Rating" ("IdRating", "IdAccount", "IdItem", "IdTransaction_Detail", "Rate", "Time") FROM stdin;
    public          postgres    false    215   )y       9          0    16514    Review 
   TABLE DATA           u   COPY public."Review" ("IdReview", "IdAccount", "IdItem", "IdTransaction_Detail", "Text", "Time", "Rate") FROM stdin;
    public          postgres    false    217   ?y       ;          0    16537    Rules 
   TABLE DATA           f   COPY public."Rules" ("Name", "Description", "Position", "Code", "CodeGroup", "IsDisable") FROM stdin;
    public          postgres    false    219   Nz       :          0    16532    Rules_Group 
   TABLE DATA           d   COPY public."Rules_Group" ("CodeGroup", "Name", "Position", "Description", "Id_Parent") FROM stdin;
    public          postgres    false    218   ?z       >          0    16558    Rules_MainMenu 
   TABLE DATA           ?   COPY public."Rules_MainMenu" ("Id_Main", "Title", "Summary", "Id_Module", "Link", "Position", "Icon", "GroupName", "Target", "AllowPermit", "AllowCode", "IsDisabled") FROM stdin;
    public          postgres    false    222   {       <          0    16548    Rules_Module 
   TABLE DATA           ?   COPY public."Rules_Module" ("Id_Module", "Title", "Link", "Position", "Icon", "Target", "Summary", "AllowPermit", "AllowCode") FROM stdin;
    public          postgres    false    220   ?}       @          0    16573    Rules_SubMenu 
   TABLE DATA           ?   COPY public."Rules_SubMenu" ("Id_Sub", "Title", "Summary", "Link", "PageKey", "Position", "Icon", "Target", "Id_MainMenu", "AllowPermit", "GroupName", "AllowCode") FROM stdin;
    public          postgres    false    224   ?}       -          0    16422    Transaction 
   TABLE DATA           b   COPY public."Transaction" ("IdTransaction", "IdAccount", "TransactionCode", "Status") FROM stdin;
    public          postgres    false    205   ?}       3          0    16462    Transaction_Detail 
   TABLE DATA           ?   COPY public."Transaction_Detail" ("IdTransaction_Detail", "IdTransaction", "IdItem", "Quantity", "Money", "Created") FROM stdin;
    public          postgres    false    211   ?~       /          0    16434 
   Type_Items 
   TABLE DATA           F   COPY public."Type_Items" ("IdType", "Name", "IdMainMenu") FROM stdin;
    public          postgres    false    207   ?       )          0    16397    User 
   TABLE DATA           s   COPY public."User" ("IdUser", "Fullname", "Gender", "Birthdate", "Address", "Nationality", "IsDelete") FROM stdin;
    public          postgres    false    201   Ѐ       H           0    0    Account_IdAccount_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Account_IdAccount_seq"', 5, true);
          public          postgres    false    202            I           0    0    Clicker_IdClick_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Clicker_IdClick_seq"', 1, false);
          public          postgres    false    212            J           0    0    Items_IdItem_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Items_IdItem_seq"', 38, true);
          public          postgres    false    208            K           0    0    Rating_IdRating_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Rating_IdRating_seq"', 5, true);
          public          postgres    false    214            L           0    0    Review_IdReview_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Review_IdReview_seq"', 12, true);
          public          postgres    false    216            M           0    0    Rules_MainMenu_Id_Main_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Rules_MainMenu_Id_Main_seq"', 16, true);
          public          postgres    false    221            N           0    0    Rules_Module_Id_Module_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Rules_Module_Id_Module_seq"', 1, true);
          public          postgres    false    225            O           0    0    Rules_SubMenu_Id_Sub_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Rules_SubMenu_Id_Sub_seq"', 1, false);
          public          postgres    false    223            P           0    0 +   Transaction_Detail_IdTransaction_Detail_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."Transaction_Detail_IdTransaction_Detail_seq"', 18, true);
          public          postgres    false    210            Q           0    0    Transaction_IdTransaction_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."Transaction_IdTransaction_seq"', 20, true);
          public          postgres    false    204            R           0    0    Type_Items_IdType_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Type_Items_IdType_seq"', 24, true);
          public          postgres    false    206            S           0    0    User_IdUser_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."User_IdUser_seq"', 7, true);
          public          postgres    false    200                       2606    16414    Account DB_Account_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "DB_Account_pkey" PRIMARY KEY ("IdAccount");
 E   ALTER TABLE ONLY public."Account" DROP CONSTRAINT "DB_Account_pkey";
       public            postgres    false    203            ?           2606    16484    Clicker DB_Clicker_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Clicker"
    ADD CONSTRAINT "DB_Clicker_pkey" PRIMARY KEY ("IdClick");
 E   ALTER TABLE ONLY public."Clicker" DROP CONSTRAINT "DB_Clicker_pkey";
       public            postgres    false    213            ?           2606    16454    Items DB_Items_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Items"
    ADD CONSTRAINT "DB_Items_pkey" PRIMARY KEY ("IdItem");
 A   ALTER TABLE ONLY public."Items" DROP CONSTRAINT "DB_Items_pkey";
       public            postgres    false    209            ?           2606    16501    Rating DB_Rating_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "DB_Rating_pkey" PRIMARY KEY ("IdRating");
 C   ALTER TABLE ONLY public."Rating" DROP CONSTRAINT "DB_Rating_pkey";
       public            postgres    false    215            ?           2606    16521    Review DB_Review_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "DB_Review_pkey" PRIMARY KEY ("IdReview");
 C   ALTER TABLE ONLY public."Review" DROP CONSTRAINT "DB_Review_pkey";
       public            postgres    false    217            ?           2606    16467 -   Transaction_Detail DB_Transaction_Detail_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."Transaction_Detail"
    ADD CONSTRAINT "DB_Transaction_Detail_pkey" PRIMARY KEY ("IdTransaction_Detail");
 [   ALTER TABLE ONLY public."Transaction_Detail" DROP CONSTRAINT "DB_Transaction_Detail_pkey";
       public            postgres    false    211            ?           2606    16426    Transaction DB_Transaction_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "DB_Transaction_pkey" PRIMARY KEY ("IdTransaction");
 M   ALTER TABLE ONLY public."Transaction" DROP CONSTRAINT "DB_Transaction_pkey";
       public            postgres    false    205            ?           2606    16441    Type_Items DB_Type_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Type_Items"
    ADD CONSTRAINT "DB_Type_pkey" PRIMARY KEY ("IdType");
 E   ALTER TABLE ONLY public."Type_Items" DROP CONSTRAINT "DB_Type_pkey";
       public            postgres    false    207            }           2606    16404    User DB_User_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "DB_User_pkey" PRIMARY KEY ("IdUser");
 ?   ALTER TABLE ONLY public."User" DROP CONSTRAINT "DB_User_pkey";
       public            postgres    false    201            ?           2606    16536    Rules_Group Rules_Group_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Rules_Group"
    ADD CONSTRAINT "Rules_Group_pkey" PRIMARY KEY ("CodeGroup");
 J   ALTER TABLE ONLY public."Rules_Group" DROP CONSTRAINT "Rules_Group_pkey";
       public            postgres    false    218            ?           2606    16565 "   Rules_MainMenu Rules_MainMenu_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."Rules_MainMenu"
    ADD CONSTRAINT "Rules_MainMenu_pkey" PRIMARY KEY ("Id_Main");
 P   ALTER TABLE ONLY public."Rules_MainMenu" DROP CONSTRAINT "Rules_MainMenu_pkey";
       public            postgres    false    222            ?           2606    16555    Rules_Module Rules_Module_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Rules_Module"
    ADD CONSTRAINT "Rules_Module_pkey" PRIMARY KEY ("Id_Module");
 L   ALTER TABLE ONLY public."Rules_Module" DROP CONSTRAINT "Rules_Module_pkey";
       public            postgres    false    220            ?           2606    16580     Rules_SubMenu Rules_SubMenu_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Rules_SubMenu"
    ADD CONSTRAINT "Rules_SubMenu_pkey" PRIMARY KEY ("Id_Sub");
 N   ALTER TABLE ONLY public."Rules_SubMenu" DROP CONSTRAINT "Rules_SubMenu_pkey";
       public            postgres    false    224            ?           2606    16542    Rules Rules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Rules"
    ADD CONSTRAINT "Rules_pkey" PRIMARY KEY ("Code");
 >   ALTER TABLE ONLY public."Rules" DROP CONSTRAINT "Rules_pkey";
       public            postgres    false    219            ?           2606    16415    Account Account_User_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_User_fkey" FOREIGN KEY ("IdUser") REFERENCES public."User"("IdUser");
 G   ALTER TABLE ONLY public."Account" DROP CONSTRAINT "Account_User_fkey";
       public          postgres    false    203    201    2941            ?           2606    16485    Clicker Clicker_Account_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Clicker"
    ADD CONSTRAINT "Clicker_Account_fkey" FOREIGN KEY ("IdAccount") REFERENCES public."Account"("IdAccount");
 J   ALTER TABLE ONLY public."Clicker" DROP CONSTRAINT "Clicker_Account_fkey";
       public          postgres    false    213    2943    203            ?           2606    16490    Clicker Clicker_Items_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Clicker"
    ADD CONSTRAINT "Clicker_Items_fkey" FOREIGN KEY ("IdItem") REFERENCES public."Items"("IdItem");
 H   ALTER TABLE ONLY public."Clicker" DROP CONSTRAINT "Clicker_Items_fkey";
       public          postgres    false    213    209    2949            ?           2606    16473 /   Transaction_Detail Item_Transaction_Detail_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Transaction_Detail"
    ADD CONSTRAINT "Item_Transaction_Detail_fkey" FOREIGN KEY ("IdItem") REFERENCES public."Items"("IdItem");
 ]   ALTER TABLE ONLY public."Transaction_Detail" DROP CONSTRAINT "Item_Transaction_Detail_fkey";
       public          postgres    false    2949    209    211            ?           2606    16455    Items Items_Type_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Items"
    ADD CONSTRAINT "Items_Type_fkey" FOREIGN KEY ("IdType") REFERENCES public."Type_Items"("IdType");
 C   ALTER TABLE ONLY public."Items" DROP CONSTRAINT "Items_Type_fkey";
       public          postgres    false    207    209    2947            ?           2606    16502    Rating Rating_Account_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_Account_fkey" FOREIGN KEY ("IdAccount") REFERENCES public."Account"("IdAccount");
 H   ALTER TABLE ONLY public."Rating" DROP CONSTRAINT "Rating_Account_fkey";
       public          postgres    false    2943    215    203            ?           2606    16507    Rating Rating_Items_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_Items_fkey" FOREIGN KEY ("IdItem") REFERENCES public."Items"("IdItem");
 F   ALTER TABLE ONLY public."Rating" DROP CONSTRAINT "Rating_Items_fkey";
       public          postgres    false    2949    215    209            ?           2606    16522    Review Review_Account_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "Review_Account_fkey" FOREIGN KEY ("IdAccount") REFERENCES public."Account"("IdAccount");
 H   ALTER TABLE ONLY public."Review" DROP CONSTRAINT "Review_Account_fkey";
       public          postgres    false    203    217    2943            ?           2606    16527    Review Review_Items_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "Review_Items_fkey" FOREIGN KEY ("IdItem") REFERENCES public."Items"("IdItem");
 F   ALTER TABLE ONLY public."Review" DROP CONSTRAINT "Review_Items_fkey";
       public          postgres    false    209    217    2949            ?           2606    16543    Rules Rules_CodeGroup_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Rules"
    ADD CONSTRAINT "Rules_CodeGroup_fkey" FOREIGN KEY ("CodeGroup") REFERENCES public."Rules_Group"("CodeGroup");
 H   ALTER TABLE ONLY public."Rules" DROP CONSTRAINT "Rules_CodeGroup_fkey";
       public          postgres    false    2959    219    218            ?           2606    16566 ,   Rules_MainMenu Rules_MainMenu_Id_Module_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Rules_MainMenu"
    ADD CONSTRAINT "Rules_MainMenu_Id_Module_fkey" FOREIGN KEY ("Id_Module") REFERENCES public."Rules_Module"("Id_Module");
 Z   ALTER TABLE ONLY public."Rules_MainMenu" DROP CONSTRAINT "Rules_MainMenu_Id_Module_fkey";
       public          postgres    false    220    222    2963            ?           2606    16581 ,   Rules_SubMenu Rules_SubMenu_Id_MainMenu_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Rules_SubMenu"
    ADD CONSTRAINT "Rules_SubMenu_Id_MainMenu_fkey" FOREIGN KEY ("Id_MainMenu") REFERENCES public."Rules_MainMenu"("Id_Main");
 Z   ALTER TABLE ONLY public."Rules_SubMenu" DROP CONSTRAINT "Rules_SubMenu_Id_MainMenu_fkey";
       public          postgres    false    224    222    2965            ?           2606    16427 $   Transaction Transaction_Account_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_Account_fkey" FOREIGN KEY ("IdAccount") REFERENCES public."Account"("IdAccount");
 R   ALTER TABLE ONLY public."Transaction" DROP CONSTRAINT "Transaction_Account_fkey";
       public          postgres    false    205    203    2943            ?           2606    16468 *   Transaction_Detail Transaction_Detail_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Transaction_Detail"
    ADD CONSTRAINT "Transaction_Detail_fkey" FOREIGN KEY ("IdTransaction") REFERENCES public."Transaction"("IdTransaction");
 X   ALTER TABLE ONLY public."Transaction_Detail" DROP CONSTRAINT "Transaction_Detail_fkey";
       public          postgres    false    211    2945    205            +     x?-?Mr?@Dף??*??o~Y ?2H`c06?????8?J.?Eozׯ??\??f??1L??TX'?
cB??]?D6^4}?!b???,?r??d???}z+?78????O??D1Ԕ?ʜ?ȕ????P??ǂk????:?ѦmD!$?Y椾?'jڞ?F????Z?E>p??r?q]?	?8?????+?????4???JK\?-z6??ތ??/?[?)?k|??x?G???f?Vm???	d???!&?WD9B?(H|???Η?K??1ͪIv?D\o?O?^?KQ?*}[????6?N?Er?]??Iđ??|K!T???y?i`ƕ?P/V#?.'????c3????Q?g?z,????Ȋj?{Ќ?uu?_??#????쇙      5      x?????? ? ?      1   ?  x??YIo??]K???
e!?y?N?-ڑh"?-?????Ws?H%??n??@?E?MR7HQ?h?v%.??????I?G??$?Td
???p?}??s?'?F?ڛO???7]t??Mξ(P?u?ݧhߵ????S?A????j???j???????u?O^u??Ij	|l?Ʀ?r?5???x??ía????z\h%?y?x8???^<C?"?ӀI????
?E&TVJ+??Bj??~?????M?S@???K?3-????*??ebo?cTxƽ??
?<'?0??B?s?????aB??????CL?`??"??p?r!x?b?5?Z???N9???0i	<??B?
٦dp~l9|u?!?*????L?ƻ(??Az?}??KϭLE?9zs??????z̩p?????w??UqR?#??c.??ApTךEx?)Q?,O>?s?vQ??F??M?2?8??C?M)2?}??\?y?ͪ???1bc
dv?9*??{nD??[JB?.?
7%???.\?S??R?[????/??r9d???$6s?MZE%<??P???R%?׵?"%??K?K????????*??Ŝm]???l??2IC??Z?\???E?:?d??ð?8!???x?ʚ?$? {+i|Z??X?@?(??{#I?4?^K???,?0??teS?9V'?q4E?Q??H?Y?(??>W?E??h??(?b?^7??qq?@??????E?TO??T?X/?n.???Jg?p??@˳b?? CH?ђ
??I*??D)e?&??w?,?e?`??Q??q-0?:?C??%Ƙ
&x'?M??t1$	G:??j???͡;Am?2???^rU??;??
?m?Ʈ?sFO9k@???M`,?i????|?{sjPI~,?X?oM?????NB~2?]@ѡ0?z???]?N?Car?e????X9"???A?q?*'5ș????C~a??X??%̝??/?p??	j??/?P?69?|<?F?[Go>??~_?GG?_???d?Gx??dT>?M_?~?uF???X9`H??!??lJ???;??T:%??V????^ޙ?zϡ]??n?]?]?????B?~?;???\????.????~e[a?T??d??cI?? \J,?!??ȅ??BmK?G? \-??>M?^o?B??~;????ы?i?8:9M??'?? ??q???r?????U??U??5?{?q??R$$i@F??
??ąJRHY?????7???F=??!??O;E??G2(k?:???͎??kJ??Ԫ???@)N?????Ӥx?!?$*?r	?????hv[???|????@ǵM
?
T+6?J?'
?o?uCjP?B?W???\TT8(?v2r?4S^)??
J(wQ?*??`ը3V?(??	?	?1?5Z?o ݕ??Jl??j??Ãß?ܿ???MF?????	~?as??'(pw??j|??i=sL-?sV??Qr('??z????U?eSν~i?֊?	??wv?U??}wh&?A?x???????vS????ϖ??????2R???Q0??Z???Q0-%WZG?w`?P??
?Z)?\i?-??o`??>??t?b??.??5?oiC???Nќ??kt??~Rޠ;??r?w>DR????p?^_M?j??Aƹ????????5hIf??^??????F?h???Y? ???~5?1~;?)aM???Ju?}??d??A?<?	{=?w?\;????[6?3?Xl?A??????h?K1Q??3պħ?????`?t?K??ר?r'}t??y??;??=Ͻ?????ۗe???_?{??_bYu?X
L	??Q
??Hڂ?Eb4?3??sW??sԵ?ٰi_e:??????t?q??;?ȅ?2-????????3??VuD??,#?pJ??b?`9T???;?$?p?2??u???6????????Ŭ??e?e?3N?pIb??<gj(??$???be?|ꕓ??wP8Z
?g???s?|X?=xQ???h<AG????%R??%??????	s??T???0+??&Q#?L?,X??"??????k?seZ???":???^?O???U??ǆ2?n?4Q??іҠ????<???N?ߠ??_OF?M?|P?H??? ȵ2cn??H?vk?Q<???w?2??˕?໙Q?W??ZeF?5|??Φ4???)?+?????hYP??P?byAL9A,?ޘ\d???%?Mm?p?Q?`????\d?:???~???(p??????D4\????????gS      7   R   x?uʱ?0???F?`??%?ϑƕ?\} ??M (t??lxO??(???NٺEk??Iq?jO??????Eʲ?,~????J      9   ?   x?mнm1?ᚚ?????H?Kx?4A???f??pꤌ?=?I?
?r?
?hR???7ą??a?`?%*rm?n??gz޿N???,???ETS?1X?Т?ܭ?3I??~?/m??]?}??????q????u?P?n N?ب4?+?@TφVe?????y=.=F?`e??)??~??CO      ;   L   x??}?k{??ww?ep???+䢈rp??4.ǔ??<???҇??)???iRdRdT???? ?? /      :   H   x?3000??}?k{??ww?epr???(䢈??q?r:??f?qA??>ܵ8O!??^??=... ^^&      >   ?  x??U?n?@]O?b~?B??????Xu3?L2???G͚P?Fj?XT??-??Q?c??k?6iR??,??W??s?=?9$C?.c*????je?R??{4!?O?G[????L?O?rH???1c?L l;??Wt)??}2????}?<?F?D1?:ϿF???5p?X ???Q-$?"2*0-?D??????t?:U.{?8.?????Ɨ͘*?+Z????J?$`????I?1nB#?]??i?C?????X?,???}???w{??y5?˾m;?K;?Wː??X?hۈM??zd????r?oKG.{W??c?????????Z'?????f??{X???7H?t?? ?/?-	(??$?@????zYZ?(?T?L???3?&84̗?J????3![?ٔ?f`۰???V?XxGV??I?	#??w?'/]v??)2??A~b?\zW*L??TjQ??????F`Q?},?րCmd뎳?t??,?:n'?j?7 /?~?p?_Ԕ?b???z=?A? eEhH??Ĉ?z҆???+t?'?@?b??՟/?????L?Y??gu?eJA7Ol?;ܜju~??n)?-?:???????)d8siFEX?g?K̗7KU??Y??>$rPK?Ѣ?1$??z??????      <   1   x?3??}?k{??ww?epꧤ?%???pr??!????W? ??N      @      x?????? ? ?      -   ~   x?]л1?X?aH??_???<co??????05?YB??C?q6:?)N??ň??h??8?BY????Xw??@?.M?q?> ??vu[#?Z????Q%??F???G??8?un??%"??A?      3   ,  x???An? еs???A?6????稁ٴ?d&?"??????7
3???????C??F??b????P?;#?H?ȕ?+S????14J??֦1?9?2???dN7	?i9?7B??B??qT??:?'A?2H??4?1???Z?"I?????????	?+ ??w?݀???jB<???o????<?ìDeg[L?Χ???4ۨ?ֶR??A???k?!??6q,Ug?7J?B?몼:? ?O????}w?ֱx??{???ZX??:!?3????0????Ür??q1??`/&??????:Ѫ?      /     x?]P;N?@?gN1'@???;H??h?my??&?5D?Hq?	U??Z??܄ŤHҾ??}??t!͏?K???.????}???ƭ????"?T???!@?D?[BS-?)??3?*??4?9??C??X?ʎ??}?Do???#??????w??r%?/o?@C???Oݦʻ?v??+CT=?^?kAf{??	#T|?%?Q)8?蚦??{??????D|??H?i??&?Q?pj??یJW?+?????
/N?[Ȕ?      )   ?   x?3??K/?|??5O!?Hs??#?!??????????)?c??{fb^:gX????%
~???i\F?e?y9y@????????F? P???	gNj^Fb	H?=??G&>?ݝ????pw''P?)??Eh&?$?8Sr3?8?șs?^?2? d?!?p#Cΐ=??\T???qqq ??C{     