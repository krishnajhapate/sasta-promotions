--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO appuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO appuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO appuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO appuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO appuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO appuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authapp_accountbalance; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.authapp_accountbalance (
    id bigint NOT NULL,
    money double precision NOT NULL,
    updated timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authapp_accountbalance OWNER TO appuser;

--
-- Name: authapp_money_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.authapp_money_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_money_id_seq OWNER TO appuser;

--
-- Name: authapp_money_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.authapp_money_id_seq OWNED BY public.authapp_accountbalance.id;


--
-- Name: authapp_user; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.authapp_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    api_key character varying(500)
);


ALTER TABLE public.authapp_user OWNER TO appuser;

--
-- Name: authapp_user_groups; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.authapp_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.authapp_user_groups OWNER TO appuser;

--
-- Name: authapp_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.authapp_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_user_groups_id_seq OWNER TO appuser;

--
-- Name: authapp_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.authapp_user_groups_id_seq OWNED BY public.authapp_user_groups.id;


--
-- Name: authapp_user_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.authapp_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_user_id_seq OWNER TO appuser;

--
-- Name: authapp_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.authapp_user_id_seq OWNED BY public.authapp_user.id;


--
-- Name: authapp_user_user_permissions; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.authapp_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.authapp_user_user_permissions OWNER TO appuser;

--
-- Name: authapp_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.authapp_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_user_user_permissions_id_seq OWNER TO appuser;

--
-- Name: authapp_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.authapp_user_user_permissions_id_seq OWNED BY public.authapp_user_user_permissions.id;


--
-- Name: dashboard_api; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.dashboard_api (
    id bigint NOT NULL,
    name character varying(100),
    api_key character varying(500),
    api_url character varying(500),
    active boolean NOT NULL
);


ALTER TABLE public.dashboard_api OWNER TO appuser;

--
-- Name: dashboard_api_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.dashboard_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_api_id_seq OWNER TO appuser;

--
-- Name: dashboard_api_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.dashboard_api_id_seq OWNED BY public.dashboard_api.id;


--
-- Name: dashboard_counterorder; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.dashboard_counterorder (
    id bigint NOT NULL,
    counter integer NOT NULL
);


ALTER TABLE public.dashboard_counterorder OWNER TO appuser;

--
-- Name: dashboard_counterorder_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.dashboard_counterorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_counterorder_id_seq OWNER TO appuser;

--
-- Name: dashboard_counterorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.dashboard_counterorder_id_seq OWNED BY public.dashboard_counterorder.id;


--
-- Name: dashboard_settings; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.dashboard_settings (
    id bigint NOT NULL,
    keyword character varying(500),
    whatsapp_no character varying(100),
    description text,
    logo character varying(100),
    pyament_qr character varying(100),
    site_name character varying(500),
    site_title character varying(100),
    whatsapp_message character varying(400),
    paytm_merchant_id character varying(300),
    paytmqr_active boolean NOT NULL
);


ALTER TABLE public.dashboard_settings OWNER TO appuser;

--
-- Name: dashboard_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.dashboard_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_settings_id_seq OWNER TO appuser;

--
-- Name: dashboard_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.dashboard_settings_id_seq OWNED BY public.dashboard_settings.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO appuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO appuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO appuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO appuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO appuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO appuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO appuser;

--
-- Name: orders_ordersmodel; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.orders_ordersmodel (
    id bigint NOT NULL,
    status character varying(20) NOT NULL,
    link character varying(200),
    quantity integer,
    charge double precision,
    last_updated timestamp with time zone NOT NULL,
    order_placed timestamp with time zone NOT NULL,
    service_id bigint NOT NULL,
    user_id bigint NOT NULL,
    third_party_id character varying(10),
    third_party_name character varying(20),
    start_count integer,
    remains integer
);


ALTER TABLE public.orders_ordersmodel OWNER TO appuser;

--
-- Name: orders_ordersmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.orders_ordersmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_ordersmodel_id_seq OWNER TO appuser;

--
-- Name: orders_ordersmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.orders_ordersmodel_id_seq OWNED BY public.orders_ordersmodel.id;


--
-- Name: orders_ordertransanctionmodel; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.orders_ordertransanctionmodel (
    id bigint NOT NULL,
    transanction_type character varying(20) NOT NULL,
    note character varying(100),
    created timestamp with time zone NOT NULL,
    order_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.orders_ordertransanctionmodel OWNER TO appuser;

--
-- Name: orders_ordertransanctionmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.orders_ordertransanctionmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_ordertransanctionmodel_id_seq OWNER TO appuser;

--
-- Name: orders_ordertransanctionmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.orders_ordertransanctionmodel_id_seq OWNED BY public.orders_ordertransanctionmodel.id;


--
-- Name: orders_transanctionsmodel; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.orders_transanctionsmodel (
    id bigint NOT NULL,
    is_approved boolean NOT NULL,
    transanction_type character varying(20) NOT NULL,
    method character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    amount double precision NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    transaction_id character varying(400)
);


ALTER TABLE public.orders_transanctionsmodel OWNER TO appuser;

--
-- Name: orders_transanctionsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.orders_transanctionsmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_transanctionsmodel_id_seq OWNER TO appuser;

--
-- Name: orders_transanctionsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.orders_transanctionsmodel_id_seq OWNED BY public.orders_transanctionsmodel.id;


--
-- Name: services_categorymodel; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.services_categorymodel (
    id bigint NOT NULL,
    name character varying(400) NOT NULL,
    active boolean NOT NULL,
    ranking integer
);


ALTER TABLE public.services_categorymodel OWNER TO appuser;

--
-- Name: services_categorymodel_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.services_categorymodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_categorymodel_id_seq OWNER TO appuser;

--
-- Name: services_categorymodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.services_categorymodel_id_seq OWNED BY public.services_categorymodel.id;


--
-- Name: services_messagemodel; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.services_messagemodel (
    id bigint NOT NULL,
    message character varying(200),
    "timestamp" timestamp with time zone NOT NULL,
    ticket_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.services_messagemodel OWNER TO appuser;

--
-- Name: services_messagemodel_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.services_messagemodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_messagemodel_id_seq OWNER TO appuser;

--
-- Name: services_messagemodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.services_messagemodel_id_seq OWNED BY public.services_messagemodel.id;


--
-- Name: services_offers; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.services_offers (
    id bigint NOT NULL,
    price double precision,
    service_id bigint,
    user_id bigint NOT NULL,
    offer_type character varying(20) NOT NULL
);


ALTER TABLE public.services_offers OWNER TO appuser;

--
-- Name: services_offers_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.services_offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_offers_id_seq OWNER TO appuser;

--
-- Name: services_offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.services_offers_id_seq OWNED BY public.services_offers.id;


--
-- Name: services_servicesmodel; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.services_servicesmodel (
    id bigint NOT NULL,
    name character varying(400) NOT NULL,
    min_order integer NOT NULL,
    max_order integer NOT NULL,
    rate double precision NOT NULL,
    average_time_hours integer,
    average_time_minutes integer,
    description text,
    active boolean NOT NULL,
    category_id bigint NOT NULL,
    refill boolean NOT NULL,
    api_id bigint,
    service_id integer
);


ALTER TABLE public.services_servicesmodel OWNER TO appuser;

--
-- Name: services_servicesmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.services_servicesmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_servicesmodel_id_seq OWNER TO appuser;

--
-- Name: services_servicesmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.services_servicesmodel_id_seq OWNED BY public.services_servicesmodel.id;


--
-- Name: services_ticketsmodel; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.services_ticketsmodel (
    id bigint NOT NULL,
    subject character varying(400),
    status character varying(20) NOT NULL,
    created timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.services_ticketsmodel OWNER TO appuser;

--
-- Name: services_ticketsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.services_ticketsmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_ticketsmodel_id_seq OWNER TO appuser;

--
-- Name: services_ticketsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.services_ticketsmodel_id_seq OWNED BY public.services_ticketsmodel.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: authapp_accountbalance id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_accountbalance ALTER COLUMN id SET DEFAULT nextval('public.authapp_money_id_seq'::regclass);


--
-- Name: authapp_user id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user ALTER COLUMN id SET DEFAULT nextval('public.authapp_user_id_seq'::regclass);


--
-- Name: authapp_user_groups id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_groups ALTER COLUMN id SET DEFAULT nextval('public.authapp_user_groups_id_seq'::regclass);


--
-- Name: authapp_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.authapp_user_user_permissions_id_seq'::regclass);


--
-- Name: dashboard_api id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.dashboard_api ALTER COLUMN id SET DEFAULT nextval('public.dashboard_api_id_seq'::regclass);


--
-- Name: dashboard_counterorder id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.dashboard_counterorder ALTER COLUMN id SET DEFAULT nextval('public.dashboard_counterorder_id_seq'::regclass);


--
-- Name: dashboard_settings id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.dashboard_settings ALTER COLUMN id SET DEFAULT nextval('public.dashboard_settings_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: orders_ordersmodel id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_ordersmodel ALTER COLUMN id SET DEFAULT nextval('public.orders_ordersmodel_id_seq'::regclass);


--
-- Name: orders_ordertransanctionmodel id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_ordertransanctionmodel ALTER COLUMN id SET DEFAULT nextval('public.orders_ordertransanctionmodel_id_seq'::regclass);


--
-- Name: orders_transanctionsmodel id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_transanctionsmodel ALTER COLUMN id SET DEFAULT nextval('public.orders_transanctionsmodel_id_seq'::regclass);


--
-- Name: services_categorymodel id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_categorymodel ALTER COLUMN id SET DEFAULT nextval('public.services_categorymodel_id_seq'::regclass);


--
-- Name: services_messagemodel id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_messagemodel ALTER COLUMN id SET DEFAULT nextval('public.services_messagemodel_id_seq'::regclass);


--
-- Name: services_offers id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_offers ALTER COLUMN id SET DEFAULT nextval('public.services_offers_id_seq'::regclass);


--
-- Name: services_servicesmodel id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_servicesmodel ALTER COLUMN id SET DEFAULT nextval('public.services_servicesmodel_id_seq'::regclass);


--
-- Name: services_ticketsmodel id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_ticketsmodel ALTER COLUMN id SET DEFAULT nextval('public.services_ticketsmodel_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can delete user	1	delete_user
4	Can view user	1	view_user
5	Can add account balance	2	add_accountbalance
6	Can change account balance	2	change_accountbalance
7	Can delete account balance	2	delete_accountbalance
8	Can view account balance	2	view_accountbalance
9	Can add Categorie	3	add_categorymodel
10	Can change Categorie	3	change_categorymodel
11	Can delete Categorie	3	delete_categorymodel
12	Can view Categorie	3	view_categorymodel
13	Can add Service	4	add_servicesmodel
14	Can change Service	4	change_servicesmodel
15	Can delete Service	4	delete_servicesmodel
16	Can view Service	4	view_servicesmodel
17	Can add log entry	5	add_logentry
18	Can change log entry	5	change_logentry
19	Can delete log entry	5	delete_logentry
20	Can view log entry	5	view_logentry
21	Can add permission	6	add_permission
22	Can change permission	6	change_permission
23	Can delete permission	6	delete_permission
24	Can view permission	6	view_permission
25	Can add group	7	add_group
26	Can change group	7	change_group
27	Can delete group	7	delete_group
28	Can view group	7	view_group
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add Order	10	add_ordersmodel
38	Can change Order	10	change_ordersmodel
39	Can delete Order	10	delete_ordersmodel
40	Can view Order	10	view_ordersmodel
41	Can add Transanction	11	add_transanctionsmodel
42	Can change Transanction	11	change_transanctionsmodel
43	Can delete Transanction	11	delete_transanctionsmodel
44	Can view Transanction	11	view_transanctionsmodel
45	Can add Order History	12	add_ordertransanctionmodel
46	Can change Order History	12	change_ordertransanctionmodel
47	Can delete Order History	12	delete_ordertransanctionmodel
48	Can view Order History	12	view_ordertransanctionmodel
49	Can add message model	13	add_messagemodel
50	Can change message model	13	change_messagemodel
51	Can delete message model	13	delete_messagemodel
52	Can view message model	13	view_messagemodel
53	Can add tickets model	14	add_ticketsmodel
54	Can change tickets model	14	change_ticketsmodel
55	Can delete tickets model	14	delete_ticketsmodel
56	Can view tickets model	14	view_ticketsmodel
57	Can add counter order	15	add_counterorder
58	Can change counter order	15	change_counterorder
59	Can delete counter order	15	delete_counterorder
60	Can view counter order	15	view_counterorder
61	Can add Setting	16	add_settings
62	Can change Setting	16	change_settings
63	Can delete Setting	16	delete_settings
64	Can view Setting	16	view_settings
65	Can add api	17	add_api
66	Can change api	17	change_api
67	Can delete api	17	delete_api
68	Can view api	17	view_api
69	Can add offers	18	add_offers
70	Can change offers	18	change_offers
71	Can delete offers	18	delete_offers
72	Can view offers	18	view_offers
\.


--
-- Data for Name: authapp_accountbalance; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.authapp_accountbalance (id, money, updated, user_id) FROM stdin;
88	0	2022-02-13 08:15:25.255985+05:30	89
119	0	2022-02-23 12:32:16.12391+05:30	120
44	0.39999999999999947	2022-07-26 15:37:56.515999+05:30	45
15	10.199999999999989	2022-01-17 14:23:22.520952+05:30	16
120	0	2022-02-23 12:33:24.234105+05:30	121
186	0	2022-07-29 10:05:50.599565+05:30	188
121	0	2022-02-23 12:39:51.25346+05:30	122
90	0	2022-02-14 21:00:09.565185+05:30	91
96	0	2022-02-16 19:31:25.000149+05:30	97
130	0	2022-02-24 13:45:40.713474+05:30	131
34	0	2022-01-31 01:26:16.538654+05:30	35
114	0	2022-02-22 02:57:01.723605+05:30	115
20	20	2022-01-18 20:46:44.356974+05:30	21
6	0	2022-01-15 07:38:22.71644+05:30	6
7	0	2022-01-15 13:24:46.094361+05:30	7
8	0	2022-01-15 23:16:41.913415+05:30	8
9	0	2022-01-16 09:32:25.355595+05:30	9
22	0	2022-01-19 17:26:39.022521+05:30	23
23	0	2022-01-19 19:02:22.125138+05:30	24
11	0	2022-01-16 22:04:36.905087+05:30	12
12	0	2022-01-16 22:30:19.909868+05:30	13
89	0.6249999999999893	2022-02-20 15:04:29.836119+05:30	90
105	0	2022-02-20 15:13:41.883623+05:30	106
10	50	2022-01-16 17:01:41.947854+05:30	10
188	0	2022-08-04 17:49:59.812824+05:30	190
36	0	2022-01-25 09:01:44.426683+05:30	37
24	0	2022-01-20 15:29:53.144126+05:30	25
37	0	2022-01-25 10:27:53.154209+05:30	38
51	0	2022-02-09 15:29:02.814276+05:30	52
14	0	2022-01-17 12:06:03.143341+05:30	15
106	0	2022-02-20 16:04:39.373645+05:30	107
38	0	2022-01-25 14:02:25.92924+05:30	39
39	0	2022-01-25 16:20:14.72878+05:30	40
21	0	2022-01-25 19:20:41.562301+05:30	22
52	0	2022-02-10 15:23:41.983731+05:30	53
53	0	2022-02-10 15:26:29.639543+05:30	54
54	0	2022-02-10 15:27:15.792921+05:30	55
55	0	2022-02-10 15:36:51.582485+05:30	56
16	0	2022-01-17 14:58:01.032188+05:30	17
56	0	2022-02-10 15:41:10.636564+05:30	57
57	0	2022-02-10 15:47:10.362988+05:30	58
25	0	2022-01-21 15:28:15.596717+05:30	26
58	0	2022-02-10 15:47:46.777568+05:30	59
59	0	2022-02-10 15:58:22.377535+05:30	60
45	0	2022-02-02 14:11:47.353001+05:30	46
46	0	2022-02-03 10:02:15.159306+05:30	47
43	20	2022-02-03 10:33:17.689161+05:30	44
190	0	2022-08-06 18:20:15.970038+05:30	192
61	0	2022-02-10 16:08:27.385051+05:30	62
107	0	2022-02-20 18:42:18.128778+05:30	108
18	0	2022-01-18 12:37:29.451473+05:30	19
19	0	2022-01-18 13:50:10.026999+05:30	20
63	0	2022-02-10 16:35:44.879551+05:30	64
64	0	2022-02-10 16:47:13.831976+05:30	65
97	0	2022-02-16 20:00:01.070116+05:30	98
40	20	2022-01-27 14:16:18.293044+05:30	41
65	0	2022-02-10 16:49:21.825315+05:30	66
194	0	2022-08-09 15:07:25.496881+05:30	195
28	0	2022-01-22 15:08:19.766109+05:30	29
92	0	2022-02-15 11:44:01.387179+05:30	93
122	0	2022-02-23 12:54:56.445229+05:30	123
29	0	2022-01-22 16:48:48.853469+05:30	30
30	0	2022-01-22 17:25:34.408071+05:30	31
47	0	2022-02-05 22:14:34.437692+05:30	48
31	0	2022-01-22 20:26:06.049594+05:30	32
32	0	2022-01-22 20:34:46.742325+05:30	33
108	237	2022-03-05 21:56:47.392593+05:30	109
98	0	2022-02-17 12:29:37.469528+05:30	99
123	0	2022-02-23 13:05:50.104118+05:30	124
124	0	2022-02-23 13:11:15.387408+05:30	125
125	0	2022-02-23 13:15:56.37381+05:30	126
66	0	2022-02-10 19:19:57.665729+05:30	67
35	0	2022-01-23 23:45:01.73983+05:30	36
93	0	2022-02-15 12:36:31.298797+05:30	94
62	0	2022-02-10 20:01:32.834589+05:30	63
60	0	2022-02-10 20:53:45.870875+05:30	61
67	0	2022-02-10 21:04:08.139811+05:30	68
94	0	2022-02-15 12:37:41.558191+05:30	95
41	0	2022-08-21 11:57:02.755762+05:30	42
68	0	2022-02-10 22:06:53.511081+05:30	69
49	0	2022-02-06 19:45:28.037098+05:30	50
192	796.96	2022-09-05 21:30:19.779312+05:30	183
126	0	2022-02-23 13:21:45.203327+05:30	127
71	0	2022-02-10 22:39:42.753459+05:30	72
3	1351.0600000000009	2022-08-31 19:04:56.300943+05:30	3
109	0	2022-02-20 19:54:31.695469+05:30	110
127	0	2022-02-23 13:26:20.658245+05:30	128
110	0	2022-02-21 17:03:33.632803+05:30	111
72	0	2022-02-11 07:56:30.77344+05:30	73
73	0	2022-02-11 12:25:32.410369+05:30	74
74	0	2022-02-11 12:50:19.617174+05:30	75
142	0	2022-03-01 06:48:20.560198+05:30	143
113	0	2022-03-09 21:03:46.056037+05:30	114
75	0	2022-02-11 12:57:24.620091+05:30	76
76	0	2022-02-11 14:06:19.799934+05:30	77
77	0	2022-02-11 15:48:40.759181+05:30	78
78	0	2022-02-11 15:52:26.660368+05:30	79
79	0	2022-02-11 16:45:28.738017+05:30	80
80	0	2022-02-11 17:13:35.681212+05:30	81
2	276.86	2022-03-14 18:00:51.056018+05:30	1
81	0	2022-02-11 21:02:12.536501+05:30	82
111	0	2022-02-21 18:06:12.134404+05:30	112
82	0	2022-02-11 22:48:28.429847+05:30	83
70	50	2022-02-12 13:10:53.895379+05:30	71
99	0	2022-02-18 17:29:59.010041+05:30	100
100	0	2022-02-18 19:57:00.508612+05:30	101
83	0	2022-02-13 03:09:51.120769+05:30	84
84	0	2022-02-13 03:26:33.038618+05:30	85
85	0	2022-02-13 03:33:29.751298+05:30	86
86	0	2022-02-13 05:45:17.335939+05:30	87
87	0	2022-02-13 08:13:01.117111+05:30	88
102	0	2022-02-19 15:29:40.903203+05:30	103
115	0	2022-02-22 21:16:13.185569+05:30	116
112	0	2022-02-21 18:36:44.362689+05:30	113
103	0	2022-02-19 19:08:02.80119+05:30	104
104	0	2022-02-19 19:13:33.470843+05:30	105
116	0	2022-02-23 12:04:56.324883+05:30	117
129	0	2022-02-24 12:32:24.526188+05:30	130
117	0	2022-02-23 12:07:43.815596+05:30	118
118	0	2022-02-23 12:11:04.699446+05:30	119
131	0	2022-02-24 14:31:21.554169+05:30	132
132	0	2022-02-24 18:05:36.352659+05:30	133
133	0	2022-02-24 19:19:57.939903+05:30	134
128	0.5	2022-03-11 21:54:57.051578+05:30	129
140	0	2022-02-27 23:17:09.562983+05:30	141
13	0.17999999999999972	2022-04-09 13:42:09.868994+05:30	14
137	0	2022-02-26 12:26:56.637205+05:30	138
139	0	2022-02-26 12:42:08.638896+05:30	140
136	10	2022-02-26 21:37:26.444994+05:30	137
138	1.75	2022-02-26 12:42:30.2366+05:30	139
101	31	2022-03-16 22:46:04.230002+05:30	102
141	0	2022-02-27 23:28:17.381589+05:30	142
69	1.2000000000000028	2022-03-01 10:14:38.672711+05:30	70
170	0.04999999999999716	2022-06-12 16:23:29.596858+05:30	171
238	5.579999999999997	2022-09-02 19:04:08.845509+05:30	239
216	2	2022-08-15 13:49:04.444912+05:30	217
144	0	2022-03-03 10:50:07.97344+05:30	145
147	0	2022-03-05 15:50:38.116422+05:30	148
217	0	2022-08-15 21:52:53.583633+05:30	218
239	0	2022-08-21 13:39:26.462575+05:30	240
240	0	2022-08-21 14:59:46.534301+05:30	241
171	148.77999999999997	2022-06-12 19:15:57.663911+05:30	172
174	0	2022-06-13 19:51:04.926486+05:30	175
184	0	2022-07-31 21:45:56.770982+05:30	186
241	0	2022-08-21 15:47:46.537353+05:30	242
262	0	2022-08-24 16:54:12.385915+05:30	263
219	0	2022-08-16 08:47:58.02475+05:30	220
173	0.4379999999999824	2022-08-02 17:00:16.667185+05:30	174
148	0	2022-03-09 01:38:39.282143+05:30	149
187	0	2022-08-03 07:18:14.084785+05:30	189
149	0	2022-03-10 12:52:53.289304+05:30	150
150	0	2022-03-10 15:32:04.630564+05:30	151
151	0	2022-03-11 10:33:09.211535+05:30	152
175	12	2022-06-15 14:09:26.404674+05:30	176
152	0	2022-03-11 13:38:15.262757+05:30	153
220	0	2022-08-16 11:21:33.305211+05:30	221
176	0	2022-06-15 16:09:18.207953+05:30	177
177	0	2022-06-15 19:06:05.912497+05:30	178
178	0	2022-06-17 01:31:34.927712+05:30	179
221	0	2022-08-16 17:44:38.145276+05:30	222
189	1.4000000000000004	2022-08-07 11:10:17.112144+05:30	191
145	7.105427357601002e-15	2022-03-14 14:39:46.445875+05:30	146
153	0	2022-03-14 14:56:17.278391+05:30	154
154	0	2022-03-17 22:22:20.661166+05:30	155
155	0	2022-03-18 17:43:43.900434+05:30	156
143	1.2300000000000182	2022-03-20 08:33:42.943359+05:30	144
191	0	2022-08-07 17:47:34.254862+05:30	193
193	0	2022-08-08 08:16:59.659297+05:30	194
181	0	2022-06-24 23:22:48.72838+05:30	182
222	0	2022-08-16 20:45:55.939807+05:30	223
242	0	2022-08-21 16:10:32.791965+05:30	243
195	0	2022-08-09 15:16:48.553085+05:30	196
157	0	2022-03-27 17:03:52.822974+05:30	158
158	0	2022-03-29 20:21:34.093699+05:30	159
160	0	2022-04-03 23:31:41.006153+05:30	161
196	0	2022-08-09 15:34:44.684384+05:30	197
197	0	2022-08-09 15:46:58.24375+05:30	198
198	0	2022-08-09 15:59:41.374586+05:30	199
161	0.1999999999999984	2022-04-06 09:30:24.587917+05:30	162
256	0	2022-08-23 15:18:25.317623+05:30	257
223	19	2022-08-17 14:03:47.302841+05:30	224
224	0	2022-08-18 04:50:23.583601+05:30	225
159	4	2022-04-09 11:06:24.044818+05:30	160
162	0	2022-04-14 15:00:47.075005+05:30	163
243	0	2022-08-21 16:21:42.239217+05:30	244
199	0	2022-08-10 00:03:46.10772+05:30	200
200	0	2022-08-10 13:06:05.983108+05:30	201
179	0	2022-08-10 21:00:25.557685+05:30	180
201	0	2022-08-11 07:35:39.449929+05:30	202
163	0	2022-04-22 16:48:52.183157+05:30	164
202	0	2022-08-11 16:53:36.115694+05:30	203
203	0	2022-08-11 16:54:06.04388+05:30	204
204	0	2022-08-12 12:17:10.94516+05:30	205
205	0	2022-08-12 14:51:34.064391+05:30	206
146	0	2022-04-23 14:57:49.220356+05:30	147
164	0	2022-04-25 22:44:49.129484+05:30	165
165	0	2022-04-26 09:22:49.856594+05:30	166
206	0	2022-08-12 19:29:55.088467+05:30	207
166	0	2022-04-26 13:11:35.267386+05:30	167
167	0	2022-04-28 22:35:41.605592+05:30	168
168	0	2022-04-28 22:37:43.526859+05:30	169
169	0	2022-05-16 00:40:57.315527+05:30	170
208	0	2022-08-12 20:06:27.263754+05:30	209
180	0.740000000000002	2022-07-06 12:02:03.496832+05:30	181
210	0	2022-08-13 11:04:08.611892+05:30	211
225	0	2022-08-18 11:43:27.698143+05:30	226
268	0	2022-08-26 01:22:39.666744+05:30	269
275	0	2022-08-26 21:43:23.089851+05:30	276
251	0	2022-08-22 20:30:17.046767+05:30	252
182	0	2022-07-16 17:27:12.082922+05:30	184
211	0	2022-08-13 15:53:47.778483+05:30	212
257	10	2022-08-23 15:39:11.337249+05:30	258
266	0	2022-08-25 15:01:28.87011+05:30	267
252	0	2022-08-23 06:37:38.60723+05:30	253
185	0	2022-07-18 23:10:54.991455+05:30	187
237	0.8000000000000007	2022-08-30 21:45:49.735405+05:30	238
226	0	2022-08-19 07:12:17.373607+05:30	227
264	0	2022-08-24 20:41:12.677985+05:30	265
172	0	2022-06-11 12:14:06.309769+05:30	173
260	0	2022-08-24 13:49:56.948667+05:30	261
212	0	2022-08-14 00:01:43.995648+05:30	213
227	0	2022-08-19 16:34:13.31417+05:30	228
258	0	2022-08-23 15:54:56.988769+05:30	259
228	0	2022-08-19 20:52:51.746609+05:30	229
229	0	2022-08-20 00:18:37.229078+05:30	230
213	0	2022-08-14 13:52:05.623709+05:30	214
230	0	2022-08-20 10:24:41.048038+05:30	231
231	0	2022-08-20 13:57:24.327314+05:30	232
232	0	2022-08-20 14:10:16.49232+05:30	233
214	0	2022-08-14 15:18:39.457355+05:30	215
215	0	2022-08-14 15:27:31.087311+05:30	216
183	14	2022-07-20 07:55:37.956414+05:30	185
234	0	2022-08-20 17:19:25.079531+05:30	235
235	0	2022-08-20 19:19:24.563543+05:30	236
236	0	2022-08-20 20:59:21.717755+05:30	237
209	2.3080000000000025	2022-08-14 16:19:17.474896+05:30	210
245	0	2022-08-21 20:08:20.071576+05:30	246
246	0	2022-08-21 20:51:42.579633+05:30	247
247	0	2022-08-21 20:59:33.372573+05:30	248
261	0	2022-08-24 14:27:07.3361+05:30	262
253	0	2022-08-23 11:55:21.791477+05:30	254
254	0	2022-08-23 12:12:23.189571+05:30	255
207	29	2022-08-23 17:12:37.772654+05:30	208
274	0	2022-08-26 20:36:21.239246+05:30	275
263	0	2022-08-24 19:24:26.661789+05:30	264
248	0	2022-08-21 23:20:44.663846+05:30	249
244	2.7699999999999987	2022-08-27 18:17:28.266825+05:30	245
259	0	2022-08-23 19:05:55.08676+05:30	260
250	0	2022-08-22 16:22:03.645948+05:30	251
255	0	2022-08-23 13:23:30.65013+05:30	256
265	0	2022-08-25 14:48:15.706505+05:30	266
271	0.10000000000000675	2022-09-02 16:00:01.685645+05:30	272
233	5.387999999999998	2022-09-02 00:01:28.836651+05:30	234
277	0	2022-08-27 12:03:38.212098+05:30	278
269	2.3999999999999986	2022-09-04 10:59:15.12904+05:30	270
272	0	2022-08-26 14:58:44.63527+05:30	273
273	0	2022-08-26 15:12:52.229619+05:30	274
218	0.050000000000000044	2022-08-28 01:25:59.207022+05:30	219
267	0.6000000000000005	2022-09-01 09:21:39.42316+05:30	268
276	0	2022-08-26 22:54:43.39997+05:30	277
270	15.75	2022-08-27 09:52:16.563583+05:30	271
278	0	2022-08-27 13:57:06.523312+05:30	279
48	20	2022-09-05 18:52:21.875854+05:30	49
249	17.5	2022-08-30 18:27:52.605708+05:30	250
279	10.9	2022-08-27 14:33:11.534185+05:30	280
281	0	2022-08-27 17:43:53.076655+05:30	282
282	0	2022-08-28 18:43:33.450715+05:30	283
283	0	2022-08-28 19:00:57.534522+05:30	284
284	0	2022-08-28 22:40:27.015432+05:30	285
285	0	2022-08-29 07:46:41.994951+05:30	286
286	0	2022-08-29 12:36:37.853996+05:30	287
287	0	2022-08-29 15:03:59.015964+05:30	288
289	0	2022-08-29 18:42:10.366053+05:30	290
290	0	2022-08-30 00:45:51.325893+05:30	291
291	0	2022-08-30 15:34:43.212975+05:30	292
292	0	2022-08-30 15:57:21.200785+05:30	293
294	1.5	2022-08-31 11:32:09.924023+05:30	295
295	0	2022-08-31 15:17:27.750352+05:30	296
296	0	2022-08-31 18:22:35.381216+05:30	297
297	0	2022-08-31 21:32:40.285767+05:30	298
298	0	2022-08-31 21:34:26.029521+05:30	299
299	0	2022-08-31 21:39:18.077765+05:30	300
300	0	2022-08-31 22:04:23.0376+05:30	301
280	1	2022-09-01 12:29:59.35257+05:30	281
301	0	2022-09-01 14:00:15.448087+05:30	302
303	0	2022-09-01 19:37:15.059104+05:30	304
305	0	2022-09-01 20:05:47.058593+05:30	306
306	0	2022-09-01 23:36:04.278491+05:30	307
307	0	2022-09-02 16:50:07.842106+05:30	308
310	0	2022-09-03 10:14:46.682847+05:30	311
311	0	2022-09-03 13:23:33.168243+05:30	312
312	0	2022-09-03 17:32:46.22747+05:30	313
313	0	2022-09-03 19:46:11.846956+05:30	314
314	0	2022-09-03 21:18:13.400384+05:30	315
309	0.4299999999999988	2022-09-03 21:42:27.241758+05:30	310
315	0	2022-09-03 22:12:58.68865+05:30	316
316	0	2022-09-03 22:14:09.424926+05:30	317
317	0	2022-09-04 07:38:21.586487+05:30	318
304	579.9	2022-09-04 14:43:13.198116+05:30	305
308	0.021000000000000796	2022-09-04 15:06:23.302842+05:30	309
288	3.25	2022-09-05 09:27:15.049709+05:30	289
293	0	2022-09-05 09:36:27.77996+05:30	294
318	0	2022-09-05 12:27:34.185722+05:30	319
319	0	2022-09-05 13:16:55.117602+05:30	320
320	0	2022-09-05 14:20:29.119778+05:30	321
321	0	2022-09-05 15:54:44.133835+05:30	322
322	0	2022-09-05 16:19:31.153906+05:30	323
323	0	2022-09-05 20:29:46.336561+05:30	324
\.


--
-- Data for Name: authapp_user; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.authapp_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, name, phone, api_key) FROM stdin;
21	pbkdf2_sha256$260000$0ugmaYAj5mPz2FABgFpSbI$wD6GJP5mMAVz6+VmG7j9MWDkL4JOKUxb2dU7Xvc4zYg=	2022-01-18 20:46:44.545439+05:30	f	Sonu	Usa	Ca	bs9497640@gmail.com	f	t	2022-01-18 20:46:44.17069+05:30		9354055297	\N
16	pbkdf2_sha256$260000$1yaFHn1MgIDdkMUmQSdcAZ$jgPj04AwEigPhqtx5FFnm7p0iut3uUHbtjYurZm/H6s=	2022-01-17 14:23:22.71102+05:30	f	Carryminati	Carry	Mitanti	carrymitanti@gmail.com	f	t	2022-01-17 14:23:22.323112+05:30		736983722	\N
8	pbkdf2_sha256$260000$fii6IcAHlprNbKprwF9sbP$40DKyPnLpwYCtQ2vNBu0g/mmsfjqqP/XPP92cd0TXiY=	2022-01-15 23:16:42.104557+05:30	f	Shivamkumar	Shivam	Kumar	shivamkumar@gmail.com	f	t	2022-01-15 23:16:41.724283+05:30		6206744641	\N
9	pbkdf2_sha256$260000$QcA5Id0j1K0g3dxXanANy8$0qGgPljieywWcSmSPby9dnjk4r028vFdkUZnXobJa50=	2022-01-16 09:32:25.546328+05:30	f	Ritik mali	Ritik	Mali	ritikmali484@gmail.com	f	t	2022-01-16 09:32:25.151547+05:30		9509733832	\N
17	pbkdf2_sha256$260000$04Rl1TWrMbYCqFmfTggkmF$w0LG7W+FGzQzsZo2J2ymSSO9CqqZdtADhGt2IQiHniU=	2022-01-17 14:58:01.221977+05:30	f	Abhishek Rajput 42097	Abhishek	Rajput	ar7986531@gmail.com	f	t	2022-01-17 14:58:00.838398+05:30		7374090874	\N
10	pbkdf2_sha256$260000$dvjdjie4K80BojjKcfbIGz$VwuTu/prg+TCMpZcJ3runyedfOYheGnIGuOtxctr1WY=	2022-01-17 18:35:17.784402+05:30	f	carryminati00000000000000	Carry0000	Minati	carryminati@gmail.com	f	t	2022-01-16 17:01:41+05:30		8770183554	\N
12	pbkdf2_sha256$260000$xzlauc6rrtJyWcsfOzxHZB$JfuahChLx3yiO9tFO5Pp31R+PvJOEUt44fFP7GYdnIg=	2022-01-16 22:04:37.095892+05:30	f	Don wizzy	Don	Wizzy 	hadeola462@gmail.com	f	t	2022-01-16 22:04:36.706739+05:30		09039173914	\N
13	pbkdf2_sha256$260000$fJNM6pzwaQfC7B11TTGZWP$6hjwOiDyHNnPfSBx5nnJYefpKk0zhmvu0CMEwwFMr/w=	2022-02-11 16:22:38.783954+05:30	f	Sasi	Sasi	Kapudasi	sasikapudasi@gmail.com	f	t	2022-01-16 22:30:19.719993+05:30		09490150509	\N
19	pbkdf2_sha256$260000$Qh6kUQwg7sm4INTkyQAPS7$1szStXjhYJIH4N3CsZsDLYzbvgEVqlSqhsvNnpa2kZ4=	2022-01-18 12:37:29.648668+05:30	f	Vaish	Vaishnav	Auti	vaishnavauti25@gmail.com	f	t	2022-01-18 12:37:29.263017+05:30		9595217270	\N
6	pbkdf2_sha256$260000$Qz6Bd1bdNGQBB2afdCAhqq$91ElppWLArQoNTUJxWvgthujzsqqssKk49NzIFNMOXg=	2022-01-15 07:38:22.907055+05:30	f	Mohd	Amir	Ji	amirmohd83919@gmail.com	f	t	2022-01-15 07:38:22.517747+05:30		7355148988	\N
7	pbkdf2_sha256$260000$QkpcRVEB47uQ9ddFxHvlMT$hG0RZbcvo8aFMtF7bKDtrX8LeQ6gwFbcoKZerhkigsI=	2022-01-15 13:24:46.286381+05:30	f	actor_jasu	Jaswant	Jasu	muppanaapparao90@gmail.com	f	t	2022-01-15 13:24:45.894922+05:30		6300966456	\N
23	pbkdf2_sha256$260000$hvWAkaiRGaQBHmGhLQKUZU$7JR6iQ6+LOILxhUtBGU4V/YzLvaSJZSHyzhLlhkVLPw=	2022-01-19 17:26:39.212769+05:30	f	AmanRajput 	Aman	Rajput 	akwired123@gmail.com	f	t	2022-01-19 17:26:38.834159+05:30		+91 95570 48024	\N
26	pbkdf2_sha256$260000$K6Kr9eUoMDCwHUuLfxbrwE$dp0IIlWQAjlTQRBjAmAgxW/CMUYaEceqUzz1Fmt7dss=	2022-01-21 15:28:15.792975+05:30	f	sabaahmad	saba	ahmad	saba78692ahmad@gmail.com	f	t	2022-01-21 15:28:15.40524+05:30		8084948485	\N
15	pbkdf2_sha256$260000$IzMwXoXql59fD879I00a8i$UXo9asjpxMNts6ZgJ4wexK4CT1gzsSr6MshqOWek9mw=	2022-01-17 12:06:03.333653+05:30	f	Rajesh Saini	Rajesh	Saini	rajeshsaini150300@gmail.com	f	t	2022-01-17 12:06:02.944772+05:30		95241 92021	\N
20	pbkdf2_sha256$260000$hKE1sGap3Kk7bl7q5D6jNs$NKuytmjkFUSR0Ajco4NNzlwAwbQH9smHJ9yshihmUKE=	2022-01-18 13:54:46.896674+05:30	f	Bablu	Bablu	Chaurasiya 	babluchaurasiyab604@gmail.com	f	t	2022-01-18 13:50:09.835382+05:30		+91 93994 74614	\N
30	pbkdf2_sha256$260000$FsKWX7fY2XKcmTovScgNCm$DeP9OMiTIU23E7Ixgj4a/0YSC3bLLabA0h23Ih98VPE=	2022-01-22 16:48:49.042045+05:30	f	Sandeep	Shyamdhar	Mishra	sandeepmishra1015@gmail.com	f	t	2022-01-22 16:48:48.656007+05:30		8169399543	\N
24	pbkdf2_sha256$260000$p3eKC4GIQ6EztSLqPbulQF$wRdjXJup0/ICJHlR1ZCwHQXURIx1qQK4G52XKhLJCKk=	2022-01-19 19:02:22.316053+05:30	f	Abusalehofficial	Abu	Saleh	official.abusaleh@gmail.com	f	t	2022-01-19 19:02:21.936667+05:30		8851078911	\N
32	pbkdf2_sha256$260000$JfcuXMNtpOwjeivuedfgVY$DXuoXxbBi5hEj8ocSw6WhE6/acu+9A38JtIxu0mIX6Q=	2022-01-22 20:26:06.239915+05:30	f	Sunilramawat	Sunil	Ramawat	sunilramawat@gmail.com	f	t	2022-01-22 20:26:05.850526+05:30		7340155837	\N
29	pbkdf2_sha256$260000$pBzOetu0felTUqmbzzLd9t$HmgUEZ3ocbuJAaNCY0wnx7btIE8/fdBHl4y5KN8K9Zs=	2022-01-22 15:10:49.33526+05:30	f	Nazir	Nazir	Nazir	tashsih2324@gmail.com	f	t	2022-01-22 15:08:19.566402+05:30		849393939398	\N
25	pbkdf2_sha256$260000$c9QURUr2BLj8F3G9axupVL$uiGps1oJ8HHG900olJnLAH1alKafJmvwOf/98XLxShA=	2022-01-20 15:29:53.33531+05:30	f	Anuru	Anuru	Uddin	uddinanur7@gmail.com	f	t	2022-01-20 15:29:52.955086+05:30		8473965875	\N
31	pbkdf2_sha256$260000$juPGouKDXZILbLjhmJe5aI$HOxs4FZOo2k9Z31oKWCzV9BIg2Bgv/vOWgasaTUmbmo=	2022-01-22 17:25:34.599307+05:30	f	Mo_hi_t_pa_tel	Mohit 	Patel	mp8898234@gmail.com	f	t	2022-01-22 17:25:34.219039+05:30		8719950628	\N
33	pbkdf2_sha256$260000$IF8Qdk2vx2RDiuQbnS5c50$h3K7Sc5mxfUDs9waen2Jp/0JoWBJCWUFh9ccngm2sfg=	2022-01-22 20:34:46.932496+05:30	f	Raunak srivastava	Raunak	Srivastava	srivastavacp09@email.com	f	t	2022-01-22 20:34:46.543143+05:30		8299275606	\N
22	pbkdf2_sha256$260000$KuXp5qLt4kGkDBeqm2L216$fD4YJuWjyhhJkN5PjscjmmYzllpkdVGB7WTTEwDydI4=	2022-02-04 21:18:32.651994+05:30	f	Alok sinha	Alok	Sinha	dandasenajagannath936@gmail.com	f	t	2022-01-19 12:36:40.314041+05:30		6370392387	\N
36	pbkdf2_sha256$260000$TWDBVcxSlTiJAlyidjZYVn$+n0DYywNboZYcTxcRWvyzhXlHsnE4K61KbwJAPAuvSc=	2022-01-23 23:45:01.930721+05:30	f	shreya_009	Shreya	Singh	komalbharti074@gmail.com	f	t	2022-01-23 23:45:01.548013+05:30		9691131453	\N
37	pbkdf2_sha256$260000$OkzacSSOfNyN5KMDch0izL$UXV/r2gpIuGjtSmvKUcdYoWuFo7yZSWKqyUH4oKcRyE=	2022-01-25 09:01:44.617959+05:30	f	Vipinnarwat	Vipin	Narwat	vipinnarwat330@gmail.com	f	t	2022-01-25 09:01:44.2295+05:30		9313767222	\N
38	pbkdf2_sha256$260000$YLX3CxuAs4UC140m1T1Kj2$jE4lmfaIot/GBepwDJhrrMrYjAbPloZQecStC9/0vz4=	2022-01-25 10:27:53.344753+05:30	f	Official_arbajkha 	Arbaj 	Khan	arbajmuwal@gmail.com	f	t	2022-01-25 10:27:52.951965+05:30		9079173944	\N
39	pbkdf2_sha256$260000$UXCW895MivqVnJYhpFIVZd$62GkYe82gQNGTEl5JTEMoYZ2ccV63P6Uty6HM6j0aGw=	2022-01-25 14:02:26.119314+05:30	f	chetanjarwalrusu	chetan	Jarwal	jarwalchetan7@gmail.com	f	t	2022-01-25 14:02:25.727799+05:30		9983652683	\N
40	pbkdf2_sha256$260000$zwB3E0eVjKU3d6yS6nsEAA$S4saU1WOvAMj76GBvat4nlD3yse/J37w8TvwfVUOXw4=	2022-01-25 16:20:14.916674+05:30	f	Denny roy	Denny 	Roy		f	t	2022-01-25 16:20:14.54042+05:30		8882503251	\N
41	pbkdf2_sha256$260000$QCSNdm7srYlfveWF53lqdt$6aqkmDDs2IkKkt7qOJyM7di7udRgp+lNSRUuKwx0XGM=	2022-01-27 12:57:40.479176+05:30	f	Pavan	Mr	Pavan	pavankumar96311@gmail.com	f	t	2022-01-27 12:57:40.071593+05:30		7483148012	\N
55	pbkdf2_sha256$260000$zSi2ZP9jKehHKvKcSEYFN6$ZbfBnP0tfctynmOo7dSZFWlsBQr/cD6g52J/4rtr4HU=	2022-02-10 15:27:15.98402+05:30	f	Yash292929	Yash	Bishnoi	yashbishnoi029029029@gmail.com	f	t	2022-02-10 15:27:15.594559+05:30		9815202253	\N
3	pbkdf2_sha256$260000$c8FQrwBt0b5yFSp2PveF1E$wxShkcAwg33cfOnOwUn/DcksLsx5r4nEcdS1t/zd7ak=	2022-09-01 23:59:18.810699+05:30	t	Ashishtiwari	Ashish	Tiwari	ttashish2324@gmail.com	t	t	2022-01-09 19:07:25+05:30		8770183554	sTZRoLXrTKZl1bu2UjNnEMVPS7U8bhRZ4cN
35	pbkdf2_sha256$260000$uOhtnb7heo4SLxctdBvnAd$sl28/PxmendSTDFBCNlX8MkTTfRstsmnjdFaW+qnWtI=	2022-04-20 16:08:04.941653+05:30	f	Yashpandat	Yash	pandat	Yashbrahman999@gmail.com	f	t	2022-01-23 21:21:02.032423+05:30		9667114069	\N
14	pbkdf2_sha256$260000$n6wEB6oras0dUhJo0otUFh$zr54N8MfPZrpHxQZur/JDuXfu7FlFhSs2UNtBmJy0fE=	2022-04-25 23:32:17.387106+05:30	f	Sasi kapudasi	Sasi	Kapudasi	smartsasi154@gmail.com	f	t	2022-01-16 22:31:17.898931+05:30		9490150509	\N
49	pbkdf2_sha256$260000$KA5Fyv2XcaojxcMn8z85Sw$pV5M2T9M2uQSsWX3p4rGYOqi6oanVLs17sVOZTJNso8=	2022-09-05 08:20:28.105777+05:30	f	balram	balram	jhapate	jhapatebalramneeraj@gmail.com	f	t	2022-02-06 13:04:31.877306+05:30		9713673474	utbNsJwh22cSBaSpAOBtRO6fnQlxWnUqyub
44	pbkdf2_sha256$260000$03xKDtcl4txvx0ej7YUkug$t62jZXWURTocQafgiSA3ZWMMm5swUWfTuuV955sYqwI=	2022-01-27 19:07:51.942731+05:30	f	Rohit	Rohit	Kumar	Paparhoit@gmail.comcom	f	t	2022-01-27 19:07:51.564056+05:30		07024063626	\N
56	pbkdf2_sha256$260000$ucoU7kn2EaaloG7RWisUsx$dgioNmUEOBRY6M1Z3ku0Ms7c1foPJYBXtGdfzdFe7zA=	2022-02-10 15:36:51.772545+05:30	f	Mk Music	Ranvir	karhana	ranvirkarhana@gmail.com	f	t	2022-02-10 15:36:51.394436+05:30		09911993353	\N
64	pbkdf2_sha256$260000$fGyxAalYYaqIuzI5bCydWn$OtUOvec9poI1nMGxfzkt+zxidhfI6whrvbm1P2Fc4lQ=	2022-02-10 16:35:45.070149+05:30	f	Vishal0999	Vikas	Tiwari	tiwarivikas808@gmail.com	f	t	2022-02-10 16:35:44.69186+05:30		9998505227	\N
57	pbkdf2_sha256$260000$Hx52nlDgou6aiPo5yv5bSk$RJKuSqhVqRHiixoU3B6XidmIQ+YJ4yM9NgujhMabJDU=	2022-02-10 15:41:10.825048+05:30	f	Chandan6	Padmashree	sahoo	Padmashreesahoo0@gmail.com	f	t	2022-02-10 15:41:10.450118+05:30		6370726026	\N
50	pbkdf2_sha256$260000$32qIQ8DOLNbp7pwxozq3BW$D9l0LoYIwsYJ8SlaDy06nZh3RVe/VGRhwLgK4XGmiLI=	2022-02-06 19:45:28.22707+05:30	f	Sayad ayan uddin	Sayad	Ayan uddin	sayadayanuddin@gmain.com	f	t	2022-02-06 19:45:27.839244+05:30		8144707388	\N
46	pbkdf2_sha256$260000$pmTOcWa6FxhEYQzCkjmOIK$AWV5qn0VrA/TTvKnqOLmwb9k3jR59nf7d7oNPVvhBQU=	2022-02-02 14:11:47.544201+05:30	f	dixit_gamers_	Suryanarayan	Dixit	omggamers68@gmail.com	f	t	2022-02-02 14:11:47.164866+05:30		9692597904	\N
58	pbkdf2_sha256$260000$BzB6PlLSEd3fnzqqQKQYfL$CVQ26hlu7DT34quS2zkA3UT4CMKPyEOHyYwIRV3YbKE=	2022-02-10 15:47:10.570994+05:30	f	Alfahad	Khan	Kham	alfahadkhan184@gmail.com	f	t	2022-02-10 15:47:10.115066+05:30		8077203922	\N
59	pbkdf2_sha256$260000$LqmshG2hk4BoE4W2T8Kq40$H0fEbfgwnP0luK9e4ilNIoQeXMOMV9EBvdaFN0qOsDw=	2022-02-10 15:47:46.968246+05:30	f	ashu02331999	Ashutosh	singh	ashu02331999@gmail.com	f	t	2022-02-10 15:47:46.588444+05:30		9120549192	\N
65	pbkdf2_sha256$260000$yase0hs8OzqqTVqwfjRfxc$t2JosGuc8ztCTS7Tqu1bvgWgwdnE+qOP9xTqkL1fTu4=	2022-02-10 16:47:14.018972+05:30	f	MKZONE	Manik	Jain	jainmoney701@gmail.com	f	t	2022-02-10 16:47:13.644922+05:30		55366578896	\N
52	pbkdf2_sha256$260000$Em9XA47TXnfDZ9EbkJkxMc$GdD3PPiqPnkB8bQ0k5/nY//Fk6hOTUeqLftb30LN544=	2022-02-09 15:29:03.005077+05:30	f	Amitv43	Amit	Verma	amitverma5767@gmail.com	f	t	2022-02-09 15:29:02.615219+05:30		9990817195	\N
48	pbkdf2_sha256$260000$tRSel7yD7QVLySzIUV6IzV$YTGNFN1FkR1Uz2WWw8SLZtnwn0CZdbmIt5AKuAVDor0=	2022-02-05 22:14:34.630013+05:30	f	RangerGaming01	Rahul	Kumar	rk1189001@gmail.com	f	t	2022-02-05 22:14:34.231965+05:30		6260584386	\N
60	pbkdf2_sha256$260000$Wnm9jWLvCfNnYrBaaw50cG$3JmRccXFSrfYAroBfLw8c2Al6bVkmTAmXdXH/I/6DMk=	2022-02-10 15:58:22.568003+05:30	f	md_aahil__03	Aahil	Choudhary	aahilchoudhary003@gmail.com	f	t	2022-02-10 15:58:22.189513+05:30		9389996523	\N
53	pbkdf2_sha256$260000$xcSjlyWfqRV81AZ3eR0pSo$jdLz9y0KqWYo/u2d52mJidb7gHiSrzht/yRBPmya6sw=	2022-02-10 15:23:42.175789+05:30	f	Abhimanyukumar	Abhimanyu	Kumar	Abhimanyukumarsingh141296@gmail.com	f	t	2022-02-10 15:23:41.77585+05:30		6202148169	\N
54	pbkdf2_sha256$260000$CJJVP0GdFBbHiUgALubtT7$OXb1rPBEQ+TMYCX2kucgNcekz50RVWmqsZ1xwv/PkPE=	2022-02-10 15:26:29.834218+05:30	f	Prince_007	Prince	Shaikh	rockstar221922@gmail.com	f	t	2022-02-10 15:26:29.447693+05:30		8981206658	\N
69	pbkdf2_sha256$260000$aKcJT1vu1azmqBuZ5SUA7H$3yrt+aJUOKQjyW8Sayr4geySYcY/vd3yfR5ONBey+54=	2022-02-10 22:06:53.703706+05:30	f	Vicky jadhav	Vikas	Jadhav	mohanjadhav53529@gmail.com	f	t	2022-02-10 22:06:53.312513+05:30		7259569464	\N
61	pbkdf2_sha256$260000$51Ng50JypovqMRjheNdTIi$sAKRecgE9+0/2yn8LJxRIRyt7tLKsSlFPaCBexyyPQY=	2022-02-10 16:00:59.316904+05:30	f	sarat2402	sai	sarat	saisarath2402@gmail.com	f	t	2022-02-10 16:00:58.935429+05:30		9676654194	\N
66	pbkdf2_sha256$260000$t6QfezjX0KKD6gPuoLZLLk$/kh6IdfnsLLZbgihRSZEC9eGObIr9MmeNvlRTAIDvA8=	2022-02-10 16:49:22.014681+05:30	f	Gwreddot1	Md	Irfan	safrinakhatun65@gmail.com	f	t	2022-02-10 16:49:21.637117+05:30		6290788155	\N
62	pbkdf2_sha256$260000$w1mPQ39QDuPDMCQEtKs3Pg$mqIz8CVGlPHqpzigZAeO9KVnJao7SXp/J/0CBWHsdmA=	2022-02-10 16:08:27.575718+05:30	f	its_jaat	YUVRAJ	SINGH	ytthetycoon@gmail.com	f	t	2022-02-10 16:08:27.196814+05:30		09548960903	\N
63	pbkdf2_sha256$260000$oRzCjROUXkqemr8EHst4WK$N15LlNnwwj9p82z0W0saRbLJ3hF8A1l31qhkp2fY/ks=	2022-02-10 18:23:52.834079+05:30	f	Dhindsa1	Here	Dhindsa	dhindsahere@gmail.com	f	t	2022-02-10 16:11:14.608427+05:30		7009846301	\N
67	pbkdf2_sha256$260000$ZORV2cYBs45c28EMez1gsA$1AHl9kT+VgtR3q6O5JZEsmlSpcvZkTrOLGPOOTZmOBg=	2022-02-10 19:19:57.857042+05:30	f	_.shraddha._2218	Om	Bevinkatti	omikings022@gmail.com	f	t	2022-02-10 19:19:57.46598+05:30		09325092665	\N
68	pbkdf2_sha256$260000$1k7VYdWL6Le4kzRWOxYHHA$qNKwATDh2u4CQHIeT4ddTDMoZyxOXl330Ypp5pOkwjw=	2022-02-10 21:04:08.336747+05:30	f	pushpjeetmatekar77@gmail.com	Pushpjeet	Matekar	pushpjeetmatekar77@gmail.com	f	t	2022-02-10 21:04:07.940463+05:30		07489055100	\N
72	pbkdf2_sha256$260000$a6mVJJswVqF7pLxMAE7Y9t$JvGhdqdQwOW90+toCXeRU3kdKT0RwyN9Icg8FrNhwjE=	2022-02-10 22:39:42.943696+05:30	f	Hardik__mistry__0	Hardik	Mistry	hardikmistry885@gmail.com	f	t	2022-02-10 22:39:42.565622+05:30		6355071255	\N
71	pbkdf2_sha256$260000$irXuCkbxxawZXotlf16U9U$8Rbj3WOpd7EKMqdgTf250BPowBLjaVe/1zXUeQnag8Y=	2022-02-10 22:27:22.34948+05:30	f	Trip out ✌️	Promble repter 	Promble repter 	jakeerjakeerbhai922@gmail.com	f	t	2022-02-10 22:27:21.976479+05:30		7794084159	\N
73	pbkdf2_sha256$260000$HCxADP10332hLwsafP3DgR$S0G7hFYfmS1nSYYwJP1JobFoY4MF7ePspEtvxoKPhkY=	2022-02-11 07:56:30.965114+05:30	f	Landlord_jatt	Gurjeet	Singh	officialllboy@gmail.com	f	t	2022-02-11 07:56:30.583589+05:30		7696132307	\N
75	pbkdf2_sha256$260000$t1Sx2rhvU7O2I531ZuC8Mv$acfmD8gsjFRvMrnG02kDPKVOPNNN2AEXojCg06IuJFo=	2022-02-11 12:50:19.806717+05:30	f	THE_EVIL_ONE123	Ankur 	Mukherjee	mukherjeeankur45@gmail.com	f	t	2022-02-11 12:50:19.427779+05:30		8016606116	\N
76	pbkdf2_sha256$260000$ctWvF3wdxVTVh52q6zMzqU$K6RHZRiGPwKlZ9I3j0ygf1KmVsLSXT3GNc3/ei/RcuQ=	2022-02-11 12:57:24.812016+05:30	f	ojhaaditya049@gmail.com	Aditya	ojha	ojhaaditya049@gmail.com	f	t	2022-02-11 12:57:24.430239+05:30		919341616245	\N
77	pbkdf2_sha256$260000$ysosnNkJBL5mQNbgvZorww$F9qtEv/9xZ7tCJh/l2Z3ou75u1OzPAl3yon7YGZik+w=	2022-02-11 14:06:19.990608+05:30	f	VASHU	VASHU	Dulgaj	vashuvalmiki604@gmail.com	f	t	2022-02-11 14:06:19.611043+05:30		8439916369	\N
78	pbkdf2_sha256$260000$pbrcR0D31h7Z9t7va24cL9$Jr0VQJUgmqUw0T7Y5mKhBHW/5X/hLLI7GWunEtF5czs=	2022-02-11 15:48:40.949699+05:30	f	Indykart	Indykart	Indykart	indykartapp2@gmail.com	f	t	2022-02-11 15:48:40.570787+05:30		000000000	\N
74	pbkdf2_sha256$260000$8bHRiSdyGeTKI7nozHi2c3$zCnbnNFRmLuyZDy3Lt0pHHlWncrYQ6Y/2tyiCDQQekE=	2022-02-11 16:57:32.522473+05:30	f	Rana_partap_0001	Rana 	Partap	ranapartap073@gmail.com	f	t	2022-02-11 12:25:32.221694+05:30		9528287327	\N
79	pbkdf2_sha256$260000$EfabwE0y54MMjnBkHIFpFy$RVYOAJZg/dOhr2rHb6WhUuUKCk2VIEy7ffCu6esUqxk=	2022-02-11 15:52:26.851557+05:30	f	Dilraj meena	Dilraj	Meena	dilrajmeena373@gmail.com	f	t	2022-02-11 15:52:26.471036+05:30		7378047692	\N
70	pbkdf2_sha256$260000$FWdglUhwnxTRztsjVr1xcA$F32jbcPQctpT9xYLoiNZj0a97Wblmlt7av2Y14Qqwjw=	2022-02-25 23:06:03.287953+05:30	f	Vicky_ jadhav	Vikas	Jadhav	zdanesh319@gmail.com	f	t	2022-02-10 22:09:01.16971+05:30		7259569464	\N
42	pbkdf2_sha256$260000$S53eIuoF4DLVB3XajNC9X7$acwqHv6MsXDhRrOgUQUSSSUuQgRPeSppjVkEcQ1I/Po=	2022-03-14 15:05:05.896723+05:30	f	Simmi_r28	Simmi	Rajput	simmir40@gmail.com	f	t	2022-01-27 15:08:49.798991+05:30		97527 21439	\N
45	pbkdf2_sha256$260000$OgMyVwlds5FVRqtyS78YaE$iUF8OGgpwc05n5xx/uBf7Of09Vh4Shs79psPV3DMcJ4=	2022-08-29 06:34:58.73728+05:30	f	_anshu_yadav8090	Anshu	Yadav	ab200raj@gmai.com	f	t	2022-01-28 10:24:43.530458+05:30		9648579790	\N
80	pbkdf2_sha256$260000$vEUOCErXUreuse8j6sNWuE$sQ/DMojo+3pMHCld8Znh+HjiCrnMz6L+RsR1iz75ldQ=	2022-02-11 16:45:28.92492+05:30	f	Sayeda 	Afzal 	Sayed 	sayyeda878@gmail.com	f	t	2022-02-11 16:45:28.553741+05:30		9945217124	\N
81	pbkdf2_sha256$260000$pdUQYODmydjNm8F26XDu5o$FKfexeHUelGxZsgmPs67w2FOMUVY2rMzZBnXzycT0K4=	2022-02-11 17:13:35.872357+05:30	f	cute.priya5566	Lucky	Gupta	sagarbhai5558@gmail.com	f	t	2022-02-11 17:13:35.492729+05:30		8303337016	\N
82	pbkdf2_sha256$260000$5f3o1X1oo7zsoomr0g0pKo$z8QebScMoFczvAuUkyJ8F+1ujjfC2klL2JgSJ7UFmbk=	2022-02-11 21:02:12.726695+05:30	f	Sajjad_idrisi_	Sajjad	Idrisi	sajjadgamer626@gmail.com	f	t	2022-02-11 21:02:12.348161+05:30		7007728270	\N
93	pbkdf2_sha256$260000$w3aBedLui0S3v9IFOI6LPT$sD3YGQV8ACHkwcrJkuDBTjaAqHQ1D5IABWXlAT2hiJI=	2022-02-15 11:44:01.577409+05:30	f	Subhsma	Jaiswal	Yash	yashjaiswa321@gmail.com	f	t	2022-02-15 11:44:01.199026+05:30		73516860443	\N
83	pbkdf2_sha256$260000$OxkVIoENdzkdSF3kbBOXw2$hxzigm6gPiRFptXzvD+A2oYPn14WnP2tM3gzz3brgVg=	2022-02-11 22:48:28.636617+05:30	f	Jude Sathya	jude	sathya	judexaviersathya@gmail.com	f	t	2022-02-11 22:48:28.240673+05:30		9585544955	\N
84	pbkdf2_sha256$260000$VyuOzf0CRKcfnAYoKaW6W8$wGPjAO/phXeUrGSjDGq7XFeibXY8y0dLYo6gfi4lodI=	2022-02-13 03:09:51.311906+05:30	f	Kishanthestar	Kishan	Pandey	adi274701@gmail.com	f	t	2022-02-13 03:09:50.932392+05:30		6393330181	\N
85	pbkdf2_sha256$260000$XH0BEPAZlOMoVjmKRceA22$Fd12217jEfAF9Z5y1JhYJopcruOiYcO3t5RsoDoBnis=	2022-02-13 03:26:33.229992+05:30	f	Mr_alfaz_1212	Gfsafjitipt	Mr_alfaz_1212	shahkealfaz@gmail.com	f	t	2022-02-13 03:26:32.849681+05:30		9016754758	\N
94	pbkdf2_sha256$260000$DpDSRzoqrR3illx6uOxmbf$sFjtrftTCgUAp1Y96+GgrM1TmGikYSJr3uPOsc+t6Z0=	2022-02-15 12:36:31.489005+05:30	f	amanjain0504	Aman	Jain	jaina3039@gmail.com	f	t	2022-02-15 12:36:31.10581+05:30		08209849608	\N
86	pbkdf2_sha256$260000$8dC73K0xIS0rCQrLhVsHvf$CCH9CR8OjsDZlxQDScNDHQzZ3kNbGYLV1zJKPjNEAuM=	2022-02-13 03:33:29.942465+05:30	f	AvtarSingh	Avtar	Singh	avtarsinggh2007@gmail.com	f	t	2022-02-13 03:33:29.562432+05:30		09478482411	\N
87	pbkdf2_sha256$260000$oSCCdverSgFyKetSotZtk0$nMueXp8mSaxobRwqWRuBkj8cpPsDEQx2AUx6fsPG0JI=	2022-02-13 05:45:17.52619+05:30	f	amaan_explosion	Amaan	Khan	emaillucky121@gmail.com	f	t	2022-02-13 05:45:17.146829+05:30		799941679	\N
100	pbkdf2_sha256$260000$vHLQIT4ihCrSW8O7EgRwua$PwlkeCm637xXyETZ8zvpV+xKsJJdQ1lh7c5q4hNE5Ss=	2022-02-18 17:29:59.217208+05:30	f	gauravbrahmin294	Gaurav	Sharma	gauravsharmahindu294@gmail.com	f	t	2022-02-18 17:29:58.821301+05:30		6262845851	\N
88	pbkdf2_sha256$260000$uV3f0fImfjXqvTKoIZ7Pfx$mzB0gM6NU8NkEHPsfthL104zFnodK0aNw2+I3wIfqa8=	2022-02-13 08:13:01.308384+05:30	f	Rtkyadav80008	Ritik	Yadav 	ritikrao80008@gmail.com	f	t	2022-02-13 08:13:00.928699+05:30		9999429871	\N
95	pbkdf2_sha256$260000$WqVJzWrEKXpJsMnJI61MSG$uLC+uqE52BoigIlewgwS5gq67D9rLYhQcQTakuOQDIE=	2022-02-15 12:37:41.749597+05:30	f	Kritika_123	Kritika	Chaudhary	sumanchoudhary9020@gmail.com	f	t	2022-02-15 12:37:41.369335+05:30		8948541266	\N
89	pbkdf2_sha256$260000$dhDGvp6UrC2rOmc2hWFx5j$at/gfuRnIpFkIUByUYIGF450rd9LBSVXeqAkSxNJe88=	2022-02-13 08:15:25.446579+05:30	f	Arman 000	Arman000	Ansari	armanansari5pp@gmail.com	f	t	2022-02-13 08:15:25.066851+05:30		8434453544	\N
90	pbkdf2_sha256$260000$wkEIaO9qgKj2vvuZfSEhlQ$+NPUqhydEUXTNjv/naJtUvSKPu0DD3c7RtxQHOr0kGQ=	2022-02-14 20:09:45.13685+05:30	f	The mustard yellow	Munnu js	Krishna	munnujayan123@gamil.com	f	t	2022-02-14 20:09:44.756032+05:30		8943393334	\N
91	pbkdf2_sha256$260000$Md4s3EXOUhCcogMKilREyP$/h3XbCGDcWfY79lzoAPRQv22JTwyMRv4qKnrQboARQk=	2022-02-14 21:00:09.755765+05:30	f	Yogesh singh	Yogesh	Singh	yogeshshuryavanshi@gmail.com	f	t	2022-02-14 21:00:09.376611+05:30		08510067287	\N
107	pbkdf2_sha256$260000$jDSZ0k7p3TkICsCosC6E5x$eXDGHfLu6xAAnJBlMsqhoIOiQFULME8lRNhG36LmLGs=	2022-02-20 16:04:39.562984+05:30	f	Official kr.ranjit banna 	Ranjit Singh	Banna	'@8696013334	f	t	2022-02-20 16:04:39.188065+05:30		8696013334	\N
101	pbkdf2_sha256$260000$iK9cV5Um7RDWzXZbA5wP7u$SpLX3xjTuoqDFzuwuXn0gDzzCjBnXG1E4XJeEQo8u+g=	2022-02-18 19:57:00.699306+05:30	f	surbhixheaven	Shashi	Dubey	shashikaladubey8@gmail.com	f	t	2022-02-18 19:57:00.320407+05:30		917652077405	\N
97	pbkdf2_sha256$260000$6l8XrjX1K8hpJmhOdJF9JV$W01qW3vUS5LaHtk7/ZLLQHubuoeBrZZnpW8CJaY4CiQ=	2022-02-16 19:31:25.192471+05:30	f	cooldude69	Krishna	Jhapate	tilol74160@alfaceti.com	f	t	2022-02-16 19:31:24.808852+05:30		6666666666	\N
105	pbkdf2_sha256$260000$yNgiVAFsPzmcP06Vg7puDW$CRuvYftz2aoczZ3OInpaoF99lemsh3LPRgZKaF13y/8=	2022-02-19 19:13:33.662659+05:30	f	Abhishek	Abhishek	Rajput	abhiktm1234@gmail.com	f	t	2022-02-19 19:13:33.286594+05:30		6389019087	\N
98	pbkdf2_sha256$260000$eEjyKtsbIO7Doo4SusOb25$3l0OggKZvaXaa+bkl2WrteUmGF6V1hsGsuwYuCJZmCE=	2022-02-16 20:00:01.260713+05:30	f	Pa	Pantha	Deb	roasterbong415@gmail.com	f	t	2022-02-16 20:00:00.881999+05:30		91633887041	\N
99	pbkdf2_sha256$260000$g2jUb6DG2OXQwuN92SBGq7$cfRU+TBElPaNj6JaYzwKeveAJ4ZJC9SI9YYyt99mZYM=	2022-02-17 12:29:37.660162+05:30	f	qkabbdidkfn	Khan	bhai	irfan@gmail.com	f	t	2022-02-17 12:29:37.280922+05:30		7488251963	\N
103	pbkdf2_sha256$260000$OY8zv3zrftaGZWBE1n1A4k$1IgQ2gwm/QvtOsqVImaSvpfO7/Wz2A6OgK52dfY0UQ0=	2022-02-19 15:29:41.09384+05:30	f	San882	San	Ji	sanjeet.1112@gmail.com	f	t	2022-02-19 15:29:40.714467+05:30		7897634200	\N
104	pbkdf2_sha256$260000$CDFe9IHhRJvmEaa11Oxa9h$mSQo1wlKrS01IHGdt5WinuSNyupyBmqAFr4pn0Tfs6s=	2022-02-19 19:08:02.993131+05:30	f	Armanror	Arman	ror	Akshitror1322@gmail.com	f	t	2022-02-19 19:08:02.612023+05:30		rttrrtrrtr	\N
110	pbkdf2_sha256$260000$XjdAbvIq9dpiJQmXA46mda$tlf68XyoQQ0HZ3OUHQAcWgLiBEtAvst9DCfIG5gQFgg=	2022-02-21 07:15:45.638251+05:30	f	__deepak2121__	DEEPAK	KASHYAP	deepak10072001bh@gmail.com	f	t	2022-02-20 19:54:31.505599+05:30		9639652121	\N
106	pbkdf2_sha256$260000$EaPdgXbTuR9WwQ1MCTvI4i$e/xeKhdWjPg2kbakCAMFFFgQQs4B1Y17FdPpV4Qp8Oc=	2022-02-20 15:13:42.075472+05:30	f	Yawar bhat 	Yawar	Bhat	yawarbhat876@gmail.com	f	t	2022-02-20 15:13:41.694832+05:30		96227 92972	\N
108	pbkdf2_sha256$260000$GIoB9znnLALdVAE288PKgI$AI1G1qGogOrtnESVI5cxtNyUCLz9IecG9UEHDQMUzBI=	2022-02-20 18:42:18.317045+05:30	f	mr_sahil_rana_____	Mr Sahil 	Rana	mrsahilbabbu@gmail.com	f	t	2022-02-20 18:42:17.941956+05:30		+91858072054	\N
111	pbkdf2_sha256$260000$g1OYehQwkQC8ATtGjyZdyy$MSeHS6NB4xNM6K4Sf5GxGOWJqS5rpSyTXc31tx02L1Y=	2022-02-21 17:03:33.824057+05:30	f	amanrana55	aman	Rana	ar2757118@gmail.com	f	t	2022-02-21 17:03:33.444245+05:30		8295165092	\N
112	pbkdf2_sha256$260000$fZjHkei9zUFNksJUZHltr6$gmlc4QAla7cR8kmVUA4F+VdO9+Y4ybB8TKpsjKom/tc=	2022-02-21 18:06:12.327357+05:30	f	Montyjoshi	Mayank	Joshi	montyjoshi565@gmail.com	f	t	2022-02-21 18:06:11.943002+05:30		9468556094	\N
113	pbkdf2_sha256$260000$3DvRL8ThWEHraXbTQ81k9S$Krp45ozDkDdIx/GnUPXCtmqfNz/NySoepuSnH7xdd+Y=	2022-02-21 18:36:44.554841+05:30	f	uneskhan_	Mohammed 	Unes	socialmediamarketing786687@gmail.com	f	t	2022-02-21 18:36:44.174099+05:30		84408 99786	\N
115	pbkdf2_sha256$260000$ptLZL31DqJm5Z0XuVq7N0r$z4M4LLugNZzpAdLvw6ewRXSUNDaIyorXlDFUSOKM3HI=	2022-02-22 02:57:01.914315+05:30	f	medi	medi	medi	videosshort108@gmail.com	f	t	2022-02-22 02:57:01.53574+05:30		315397934	\N
102	pbkdf2_sha256$260000$o1n8SRZTh6B1xq6dxYDtsp$WkXj/hixHRxcK8DF/fphGn8fs4hTuwHOgbDDe84khUs=	2022-03-05 01:37:25.836966+05:30	f	devilgaming86	Devil	Gaming	wearegamers579579@gmail.com	f	t	2022-02-19 01:34:50.078963+05:30		8601101586	coRjHRohp6LUm8bGbHfxEGTydB3A7DGObpp
109	pbkdf2_sha256$260000$vTWrlClXG9mdtmb6yyawPO$9OM5RfYnR+wHfAh4OP1/gWZYuJwTKPD68GfTptAB4WE=	2022-03-17 15:18:13.760739+05:30	f	gourav_96i	Gourav	Maheswari	gouravmaheswari2@gmail.com	f	t	2022-02-20 19:13:26.031047+05:30		6378839994	\N
116	pbkdf2_sha256$260000$76tpEVngzlRQqpyxfAVSXt$XlYgUNkys/YEe6AtZhaz4S3Ds+SJa0vBoYayR5xYL58=	2022-02-22 21:16:13.377683+05:30	f	Shifat	Shifat	Munna	shifatm451@gmail.com	f	t	2022-02-22 21:16:12.980659+05:30		01727749520	\N
47	pbkdf2_sha256$260000$PBWE3Z3lczZZk8NtqapLLB$YAKEVtRbbrpnfrro/7dsOXQX5ik3HhbUGiLHLKc5uLk=	2022-02-22 23:31:19.689522+05:30	f	@sachinbhai_07	Sachin 	Singh	sachinsingh9098654425@gmail.com	f	t	2022-02-03 10:02:14.97002+05:30		07223024483	\N
114	pbkdf2_sha256$260000$1WkG9u2NZmOXcvKbOewnpe$kvlXIs+r2wmvTMxZJsRFZfMx5InR85fOFB4SQMJSEUM=	2022-02-23 16:23:48.250227+05:30	f	aiyyuthakur	aiyyu	Thakur	aiyyuthakur81@gmail.com	f	t	2022-02-21 20:49:02.190361+05:30		8305618938	\N
117	pbkdf2_sha256$260000$ihaLH1N8D0EF4Yc7mtd9vl$ih1cJz1lajgnLpOKDIUIJR8Mv3XWXaK9CdrL8gubnVI=	2022-02-23 12:04:56.518929+05:30	f	Afreed3962	Afreedshaikh	Shaikh	sohelkhan17khan@gmail.com	f	t	2022-02-23 12:04:56.132132+05:30		9175497214	\N
118	pbkdf2_sha256$260000$IeuZDWN2TlqCbfUe9lK0ky$v1XUvNxWWawuYnScORebMLgTzMEjwyGti03CaGoA+ro=	2022-02-23 12:07:44.003191+05:30	f	tiwari_tigers_	Prajjwal	Tiwari	guddutiwari1232@gmail.com	f	t	2022-02-23 12:07:43.616423+05:30		08305109619	\N
138	pbkdf2_sha256$260000$BKgewlLxBj0yP7ew8Rlgta$R/D91PD8ZCmQdONbg0f2GcMkE0q9D1C4vdr8HWnhEx4=	2022-02-26 12:26:56.827459+05:30	f	Yash	Yash	Dhull	dhullyash3@gmail.com	f	t	2022-02-26 12:26:56.450282+05:30		Fhj	\N
119	pbkdf2_sha256$260000$FPFgHW99DxZTsRMbt5zAUr$j/5sFfUtzgcUX9f6o+BJb8V6E2V6/8Zg8jAyP5c9+Z8=	2022-02-23 12:11:04.890794+05:30	f	Afzalkhan786	Afzal 	Khan	ka4355867@gmail	f	t	2022-02-23 12:11:04.511274+05:30		9082966401	\N
120	pbkdf2_sha256$260000$6GlDyWDQfJHw8T0DqGlmsE$HB/RD+LPpnLfhVFD1oXk8y3AqGJ/LJ2Uqh8O+kNICWM=	2022-02-23 12:32:16.315179+05:30	f	Anil	AnilVk	Anil	anilghj34@gmail.com	f	t	2022-02-23 12:32:15.938068+05:30		7489562341	\N
121	pbkdf2_sha256$260000$xFInwikUFX7PSsA5h5y8GK$2yqmxPl69EBPZQ6bZIaBxZEHWIMZVrnWaCPSZzgSvTs=	2022-02-23 12:33:24.424522+05:30	f	Anuj12	Anil	Khichar	anujkhichar155@gmail.com	f	t	2022-02-23 12:33:24.03605+05:30		6378520690	\N
122	pbkdf2_sha256$260000$7KaeEQQKu9Q4ZFwv1mTVI3$MP//NVla1ShHRLT/a30Bo6lzxEsInik9OdRV97Mb0tQ=	2022-02-23 12:39:51.444621+05:30	f	Sumitrajkiran	sumit	rao	sumitrao20202021@gmail.com	f	t	2022-02-23 12:39:51.063973+05:30		09116815093	\N
130	pbkdf2_sha256$260000$vhZjlTGoD62zZmjlH0rQ0V$72SvfbD35cdfjWBCla7E4M5MQh81uVebBZs6xx+NtsM=	2022-02-24 12:32:24.714912+05:30	f	Hey_vishu_27 	Vishwajit 	Wayadande 	Vishwajitwayadande39@gmail.com	f	t	2022-02-24 12:32:24.336871+05:30		9096860627	\N
123	pbkdf2_sha256$260000$bJlNigEtL7OS7p9o9BmaKA$b8Gr2CX16jXqAkKz2Tz0aRf/qOEGMa9AIiVmxF80Y0Q=	2022-02-23 12:54:56.636014+05:30	f	Shivanshb	Shivansh	bobal	bobalshivansh@gmail.com	f	t	2022-02-23 12:54:56.255935+05:30		7697070828	\N
124	pbkdf2_sha256$260000$LCZffBlKLTVaJQeeUL33ig$KM44ekwXlzkaryQ3cNpSNrPq4prHPNphbybn1eFD9iE=	2022-02-23 13:05:50.294984+05:30	f	Iamansh_6	Ansh	Kumar	ansh66546@gmail.com	f	t	2022-02-23 13:05:49.915139+05:30		8755102661	\N
125	pbkdf2_sha256$260000$pN8KqKcXWfSlLxnZ12MZF3$Sjvx4cwiY1Cb5F1EvR2mN7W0iLufvXdEAtx7YEXW2oU=	2022-02-23 13:11:15.579853+05:30	f	officialzaheer	SHAIK	ZAHEER	official.zaheer.0.0.0@gmail.com	f	t	2022-02-23 13:11:15.198862+05:30		8919537011	\N
131	pbkdf2_sha256$260000$bgKcgJGoj0Epjad5FYUEiM$pJ+wGvmnUwV5v3qWFmDZQw5bnDyqaLKPqn9FgSOgfqA=	2022-02-24 13:45:40.905322+05:30	f	Bamsibhai300	Bamsi	Bhai	chutiyajaan08@gmail.com	f	t	2022-02-24 13:45:40.524106+05:30		06005626011	\N
126	pbkdf2_sha256$260000$gcnY95rcEibblttoZMLF7m$PYHnGOvCGTJNAZLmW8huunkWdWMslrYcNWlrNxqw2lY=	2022-02-23 13:15:56.566056+05:30	f	Amaank8	Amaan	Shaikh	ridershaikh99@gmail.com	f	t	2022-02-23 13:15:56.184708+05:30		9765931502	\N
127	pbkdf2_sha256$260000$wYXTW1Up2H6iLgUaj5SFll$FWI7fcWc/cm8xkRSiIQm9mBjuqR68yFnz+vcZHadXVo=	2022-02-23 13:21:45.39383+05:30	f	Jai__seth	jai	seth	jaiseth795@gmail.com	f	t	2022-02-23 13:21:45.01425+05:30		9115983458	\N
128	pbkdf2_sha256$260000$tVLvC2Gr1lCnNvjHtgz6gh$3U+NpCqTUxE+F0IOcHg4+6j1pmkDD7/oAczyPf8uLXk=	2022-02-23 13:26:20.849552+05:30	f	Atif	Qureshi	Qureshi	qatif9038@gmail.com	f	t	2022-02-23 13:26:20.469051+05:30		87914 61582 	\N
132	pbkdf2_sha256$260000$1Br15tYWDbAAGMGfRc8bpi$FDyzd77vBgB4lbSACjaO73CTad4xWLUOzuhnbv1j32w=	2022-02-24 14:31:21.746209+05:30	f	Yasir	Ansari	Yasir	Yasiransari007@gmail.com	f	t	2022-02-24 14:31:21.359856+05:30		7378444768	\N
142	pbkdf2_sha256$260000$jhodI5YbNXyjqndrKE6J24$YWgdCF4mFEm+CbRp/v0jR7LbWRchSkNSlb+hqUoc0LU=	2022-04-12 13:18:48.009526+05:30	f	Manish8092	Manish	Kumar	manishjaiswal8092@gmail.com	f	t	2022-02-27 23:28:17.182619+05:30		8092276912	IW7zEB6jONbhYY3DCi74V6W4X3uZdJ3NC6s
133	pbkdf2_sha256$260000$MVGv7cPPo3FUUjTeestTnu$qPhRg46etM1Zy7RvdmYLRdqOgJ3EStaTusfcVvvvRXI=	2022-02-24 18:05:36.543709+05:30	f	bishalkhuntia	Kulamani	Khuntia	kulamanikhuntia1@gmail.com	f	t	2022-02-24 18:05:36.165922+05:30		09583794866	\N
146	pbkdf2_sha256$260000$cP2VRmoJKh9kZKDjkjmvcb$viBKZoVlPStY4yTXC7b58E5ri/4rqdgwTXenv1P/N08=	2022-03-20 15:37:05.518866+05:30	f	vikash_a	Nikhil	Tyagi	tyaginikhil806@gmail.com	f	t	2022-03-04 13:41:44.339136+05:30		9671789235	\N
134	pbkdf2_sha256$260000$R0JO2xroPJOjghUIfb6gkY$Eli8ODZcwBNllAS6Pr4TnA1ud4VDujv7S4vsvZ5BFfU=	2022-02-24 18:36:01.891102+05:30	f	Karan	Kumar	Kumar	kumarpulkit97@gmail.com	f	t	2022-02-24 18:36:01.511621+05:30		9315810006	\N
139	pbkdf2_sha256$260000$B9JI0T5qmg4g44LTujSIXH$9k9llvJ/ucrm32sOZYe06Ygu3bPa1DJk+5bR+i4qa8Q=	2022-02-26 12:38:35.526419+05:30	f	Kaifkhan	Kaif	Khan	kaifkhanofficial@gmail.com	f	t	2022-02-26 12:38:35.147155+05:30		8657133808	\N
137	pbkdf2_sha256$260000$DbBArvkVBXC6Hg36TShYT2$vNJf59tfwU8MgNSwecZ50i38p1zSQ6GWIo/nHopneGg=	2022-02-26 12:12:29.415983+05:30	f	Priyanshu	Priyanshu Kumar	GUPTA	priyanshukumar07317@gmail.com	f	t	2022-02-26 12:12:29.030861+05:30		870092549422	\N
140	pbkdf2_sha256$260000$kTa3HBkVD7KiXo4VWS5iLX$SaP5aHiERcrW4MhyGPJdrBoWxDCGjfdyLNLxYQGCSh0=	2022-02-26 12:44:50.19976+05:30	f	keshav chauhan 05	Rajesh	 Kumar	rajesh38766@gmail.com	f	t	2022-02-26 12:42:08.448658+05:30		9394868528	\N
141	pbkdf2_sha256$260000$k4o5eBJORBdzRe1JBc2q4R$x/YKPr25lfPziVoFWvcdkWkvJT0NpkBnZiO+ANv5ln4=	2022-02-27 23:17:09.758988+05:30	f	_rishabh0875	Rishabh	Singh	Royalrishabh4804@gmail.com	f	t	2022-02-27 23:17:09.358185+05:30		9905150237	\N
143	pbkdf2_sha256$260000$OSDVw30VUEQvEPjWLcueIu$Mp4WQRxafEUYE8VB6uumqj80N/MnB2GKvzeTdDbwLv0=	2022-03-01 06:48:20.750848+05:30	f	Kunal King	Kunal	Ram	chamaparamrhathod@gmail.com	f	t	2022-03-01 06:48:20.356525+05:30		6350056884	\N
145	pbkdf2_sha256$260000$5rqDhL4NsriO70BPuCfNbj$VmLVfDbpYrgok6yWdeX5rEEOtw+vb3mAq7Budtwtu2Q=	2022-03-03 10:50:08.163181+05:30	f	Sweta raj 	Sweta 	Raj 	swetaraj195@gmail.com	f	t	2022-03-03 10:50:07.786358+05:30		7241129195	\N
147	pbkdf2_sha256$260000$X5kM9sTr0BdXTo7FMeg0zT$hjRgs3KU/fz0HQHY5hl67NQEPCHIHRNVwgfJ8DZri9g=	2022-07-30 18:46:02.979388+05:30	f	Mr narcos	Munnu	Js	munnujayan123@gmail.com	f	t	2022-03-04 18:39:15.131168+05:30		8943393334	SyhkEPsv06KcSZmF6SiaKSW4Z5diY1YI3o7
129	pbkdf2_sha256$260000$EZwURDyQkkKQoANfZB8DQK$mwlUJ8ZZgS3bBV+9NmZWS+VrWeSFlLoqXIsTxOjvpCw=	2022-03-11 20:04:56.680216+05:30	f	Sonal44	Sonal	Manwani	manwanisonal@gmail.com	f	t	2022-02-23 22:14:18.823068+05:30		9752174699	\N
148	pbkdf2_sha256$260000$rSV9J1e9yL1oNx5xgsiyXY$3AD4Jr5oynZPFPIWfcEcbPPdWX3TpwrSGKRSrwkkYVM=	2022-03-05 15:50:38.306628+05:30	f	Sam _14	Sam	A	aatiksam@gmail.com	f	t	2022-03-05 15:50:37.928866+05:30		9650176524	\N
1	pbkdf2_sha256$260000$wYdEwLo1sYj3rMZ0bb2bYR$O+a3BhPq+Ldw+H3dzqw0aL9YmmU5eNOxV/mgnfcM4BQ=	2022-08-23 15:22:11.645994+05:30	t	adminpromotionwala	Admin	a	admin@admin.com	t	t	2022-01-03 20:15:55+05:30	Admin Promotion		1B6KnQDFKUIKipiOnT3HqsEcU0hkLGe4Lwh
149	pbkdf2_sha256$260000$zQIqIVhgjOk88jl2q4e0Ve$1aHeDUBvDHSwmKKymrGTOFKiE+zbfjclfF9/4xYgejA=	2022-03-09 01:38:39.476188+05:30	f	Nagurriii	Rotimi	Fredrick	rtmfredrick@gmail.com	f	t	2022-03-09 01:38:39.077322+05:30		08028984168	\N
150	pbkdf2_sha256$260000$bwATvkNGwvxIlgCRnzYBQA$+mnrXXwfXbW+GT7QPTDcNd4juR1Lo9fgXA27oSXGTaE=	2022-03-10 12:52:53.482097+05:30	f	rameshuk_01	Ramesh 	Prasad 	rameshuk017535@gmail.com	f	t	2022-03-10 12:52:53.090151+05:30		9012828533	\N
160	pbkdf2_sha256$260000$Cxb9Lx02SgfTzbO8FQEjVP$BQdiz95XRnlq6bFelruYcwvgyKSquh6WxWcWhIw48k8=	2022-04-02 09:57:13.361361+05:30	f	Rajesh Saini 	Rajesh 	Saini	rajeshsaini150300@email.com	f	t	2022-04-02 09:57:12.985663+05:30		9524192021	\N
152	pbkdf2_sha256$260000$ORzNMXMbq82lQkyS1WS5kO$mUdG1+OmmBHAKeGjn/K9H6l2Mqj9MGKYp887ujtueGo=	2022-03-11 10:33:09.401674+05:30	f	Gourav	Gourav	Thakur	gt065204@gmail.com	f	t	2022-03-11 10:33:09.024443+05:30		9149080834	\N
153	pbkdf2_sha256$260000$x6PvRTTbcz2zzzuOa8Gtvd$zvQSPWazkq89RyqCqO4vQlKYoRLvrjqsBj0DiBVucEk=	2022-03-11 13:38:15.453637+05:30	f	vborban	Vishal	Borban	vborban8085@gmail.com	f	t	2022-03-11 13:38:15.07009+05:30		8085174960	\N
161	pbkdf2_sha256$260000$RsBh9NY9BklaJZnxMTwKTx$m/o+aga1TuLRW/pFEfqvSTjnQVK0Et8cupc++Dqj0js=	2022-04-03 23:31:41.196594+05:30	f	manishdenny	Manish	Denny	manishpalmi94@gmail.com	f	t	2022-04-03 23:31:40.819355+05:30		8649007500	\N
154	pbkdf2_sha256$260000$Cxbnt5inrW5sSbfEkivGf6$8QPi2Fw8a8TxRzqPxdD6sLJT+rVS2f/qrGo/sp2LXnU=	2022-03-14 14:56:17.468942+05:30	f	imaman_786	aman	shukla	instaofficialstore@gmail.com	f	t	2022-03-14 14:56:17.075762+05:30		08004172264	\N
174	pbkdf2_sha256$260000$vsnbKw5hHLliVw7NIJW5GG$gjrgW1JbUZk5hQxmETdU1+vAca3ZNPF2DgSGcMNGDe4=	2022-07-30 19:17:35.047302+05:30	f	Sayad_ayan_uddin	Sayad	Ayan uddin	sayadayanuddin29@gmail.com	f	t	2022-06-12 18:20:13.60802+05:30		8144707388	\N
155	pbkdf2_sha256$260000$tD2MKh1yAF7gQE0YTzyPs4$pNi7j1wsGBvxD2PC3IYQLs4IgkkQLZGjox8E9LTURtA=	2022-03-17 22:22:20.854838+05:30	f	amansingh2112	Aman	Singh 1M	amansinghneh211205@gmail.com	f	t	2022-03-17 22:22:20.458883+05:30		12345678920	\N
166	pbkdf2_sha256$260000$N0AREvzJfDGcLhW2Ix2C39$SWpoAtVTAfF7eOSOwaqlnShpCfc6iCQHZQySqrDMFok=	2022-04-26 09:22:50.050116+05:30	f	rakesh_rulaniya_	rakesh	rulaniya	rishabpant9783@gmail.com	f	t	2022-04-26 09:22:49.642083+05:30		9983150278	\N
156	pbkdf2_sha256$260000$OWEDZzBLLE2sHOwrdGlUNp$r2QIXpDdcVqX9dZEIM+Mi/LwQWO1L2X9swWZq57tWsk=	2022-03-18 17:43:44.092815+05:30	f	rubelahamed27	Rubel	Ahamed	rubeltechtube@gmail.com	f	t	2022-03-18 17:43:43.69327+05:30		01980449507	\N
162	pbkdf2_sha256$260000$vfDD6CCk28qNy48bPe3Zt4$QzIVhGB8m0d15MrnUM9dPTWxjs16ISVQzP0WDTNzIKc=	2022-04-06 09:08:22.627932+05:30	f	Vicky _jadhav	Vikas 	Jadhav	sipakjadgsg@gmail.com	f	t	2022-04-06 09:08:22.248918+05:30		7259569464	\N
144	pbkdf2_sha256$260000$cRqX1oxMQIjQxHLtqZkWbC$qEXeZ08gVg6JH+6OEMIr3/ifSU2sxMCvAW9rdk1fhuU=	2022-03-20 15:03:31.100933+05:30	f	Sanamadmin	Sanam	Social	pushpendrapal06029@gmail.com	f	t	2022-03-02 19:50:12.346676+05:30		9084559348	1B6KnQDFKUIKipiOnT3HqsEcU0hkLGe4Lw19jssd
163	pbkdf2_sha256$260000$dlxsCfiGKEgCLh8hoy6MJo$LLLytr5+2KjNIQFSQtD9pj32E8uTsPuQV2CJZm0uSiE=	2022-04-14 15:00:47.266766+05:30	f	promotionmaro.com ugrfeiohofidsksmvnjdbvsijf94t9u5t0i4r94ijgrjght9y84r49t64rkowf0ereiuguejdkwdiweofuehdskodjjdgofjsoddggfsidj	promotionmaro.com ugrfeiohofidsksmvnjdbvsijf94t9u5t0i4r94ijgrjght9y84r49t64rkowf0ereiuguejdkwdiweofuehdskodjjdgofjsoddggfsidj	promotionmaro.com ugrfeiohofidsksmvnjdbvsijf94t9u5t0i4r94ijgrjght9y84r49t64rkowf0ereiuguejdkwdiweofuehdskodjjdgofjsoddggfsidj	KsenofontMaidanov+4a1r@mail.ru	f	t	2022-04-14 15:00:46.866545+05:30		85828324961	\N
158	pbkdf2_sha256$260000$rvtFkIMNaD3EsDB69HkxLr$lSxyOO1eazI9AQ47slnURAbVSKm3x2H6SfiOHaHIcXY=	2022-03-27 17:03:53.016303+05:30	f	Samir	Malek	Samir	samirmalel139@gmail.com	f	t	2022-03-27 17:03:52.617496+05:30		9725490975	\N
159	pbkdf2_sha256$260000$LSznSWN6Q5DrCje5jEPjup$UjxMIIFW9BnhHBNFMvivLdeDxB/tRhG3hMI73Rn1VDg=	2022-03-29 20:21:34.284675+05:30	f	vivek	Vivek	Kumar	mailvivekx@gmail.com	f	t	2022-03-29 20:21:33.904748+05:30		9837255233	\N
151	pbkdf2_sha256$260000$39yw19a2gSU40NSoXvyPLd$lUKD4uixQogNVHsd0vknbsZBwOC9vH59LcLxxv1HpsE=	2022-06-04 16:39:54.238389+05:30	f	Arshpreett	Arshpreet	singh	manpr201@gmail.com	f	t	2022-03-10 15:32:04.443643+05:30		07986840194	\N
164	pbkdf2_sha256$260000$DombdYc2J1kkAFmrX7FWLm$9GUp0vBA6lj+6HsJsS7EBe/3Luwf4k/wbTPZvXtedoM=	2022-04-22 16:48:52.375195+05:30	f	Singh58abhijit 	Abhijit 	SINGH 	raj68abhijit@gmail.com	f	t	2022-04-22 16:48:51.993221+05:30		9406946193	\N
165	pbkdf2_sha256$260000$hIv2kWgqGlhq7SnQ4i8PbL$acr5O8V1GxT1NaBxQ2UTglhoOBWn1ZXhZKbN/IyUYX0=	2022-04-25 22:44:49.335669+05:30	f	Rajuram	Raju	Ram	rajuram@gmail.com	f	t	2022-04-25 22:44:48.938145+05:30		9352053185	\N
167	pbkdf2_sha256$260000$wvvnPithgViTiW8Rjo878D$EST0t0o3wBnHYSNnKPlNkSz/HRdvW8hczZwas5OFwP8=	2022-04-26 10:43:25.27912+05:30	f	darbdar.in	Ramu	Choudhary	ramujhawari@gmail.com	f	t	2022-04-26 10:17:02.375374+05:30		6378199466	\N
173	pbkdf2_sha256$260000$bDuOByvkI2gb4AudMrAOGt$KZagGdGrGKE+WkFRW1UBWwK0dlfkxggo5wz92f7Eh5o=	2022-06-11 12:14:06.50282+05:30	f	Sanam123	Sanam 	Pal	tamangpriyanka068@gmail.com	f	t	2022-06-11 12:14:06.103961+05:30		9548683664	\N
168	pbkdf2_sha256$260000$sqJokhcLfHPuuFSol3gBPj$N8RMrIc8mfdxgJ6VZKOQ0bw4s+YRUNkOlc31yVbYvMM=	2022-04-28 22:35:41.799385+05:30	f	apnamanish12	Ashok	Choudhari	ownersmm@gmail.com	f	t	2022-04-28 22:35:41.412985+05:30		08092276912	\N
171	pbkdf2_sha256$260000$8AlXky6ldlajz9Vyxpd6kQ$r7sNMzCLdVixzI8YYRZefGLku58vzNRk0AH5KAyv49E=	2022-06-05 11:37:33.21927+05:30	f	Shonu	Sonu	Sharma 	bayant681@gmail.com	f	t	2022-06-05 11:37:32.807242+05:30		9354055297	\N
169	pbkdf2_sha256$260000$badDUwE42g8GJMrVU1GYLE$/QrBlDAe/zdMtB+ZFW1lYDcT/ZQVKbDGkj+YeF3hlCk=	2022-04-28 22:37:43.713091+05:30	f	jisudas	Jisu	Das	jisudas311@gmail.com	f	t	2022-04-28 22:37:43.321885+05:30		7061546391	\N
176	pbkdf2_sha256$260000$nqkRhO0dA4aAzqE6kSzz6V$1pKtJVarLpqVTThkY7/OQnxADtP5pG8uCL9UBJLHryY=	2022-06-14 14:14:23.0194+05:30	f	Mohammed soud	Mohammed	Soud	mohammed96soud@gmail.com	f	t	2022-06-14 13:23:38.333315+05:30		8123696840	\N
172	pbkdf2_sha256$260000$INqBXpFceQONKRH6stnnCo$mjbLgF3hsx4BkHPOxv0zY0acVU9FVW4dR2DaZxPhgws=	2022-06-11 00:11:34.444485+05:30	t	krishna			24rishi02@gmail.com	t	t	2022-06-10 23:48:44.105654+05:30	Krishna Jhapate	88785 13234	\N
175	pbkdf2_sha256$260000$jwysckVdWC7oB3d6x6XrXW$hWAU86n8iOFSRIvkqU06CtXnFpHKUYAU8LG4Jklom2I=	2022-06-13 19:51:05.122701+05:30	f	itz_ismail_69	Ism	Ail	sherunkmn@gmail.com	f	t	2022-06-13 19:51:04.718449+05:30		9380346221	\N
170	pbkdf2_sha256$260000$Du4LzYqCV5XdwXkoOhcGwp$jyE0eLEjSR7gTOAF9zGjUlk0q9rE1CycRdbWHOtvC+k=	2022-08-21 13:36:12.797499+05:30	f	apnamanish80	Shankar	Kumar	apnamanish8092@gmail.com	f	t	2022-05-16 00:40:57.123138+05:30		8092276912	\N
177	pbkdf2_sha256$260000$hCSawG3qT38deYwJeonkz9$sfzME7I2XeTICg28ffNlPbGuT2OXrO2pcmscRjhCeLo=	2022-06-15 16:09:18.400359+05:30	f	prudhvi_leela_kumar_2002_	Leela	Kumar	leelakumar4503@gmail.com	f	t	2022-06-15 16:09:18.018006+05:30		7729098052	\N
178	pbkdf2_sha256$260000$XWh1qqxW9A84tKgjcHiPF1$/1mPWoYSl9eyPxuk8EuET96bRf7XVlC72baCwalY0p4=	2022-06-15 19:06:06.10379+05:30	f	Buddy	Raj	Kumar	jojiki8857@tagbert.com	f	t	2022-06-15 19:06:05.711276+05:30		9898888339	\N
179	pbkdf2_sha256$260000$SYofHRoiy9YMt82x6YabxN$DvDiNHfPEKvEbrJcsiXR/I3IlXg52tUR5urM0zOpaqc=	2022-06-17 01:31:35.120262+05:30	f	abdulkalam	Stylish 	Kalam	kalamgouri86504@gmail.com	f	t	2022-06-17 01:31:34.7367+05:30		8107473877	\N
191	pbkdf2_sha256$260000$v4jY7CBIh1QimwvvznhPDm$/+Gn//qdxRxxonM1TnNjGlJq62oSxvrDjA81e6uZDI8=	2022-08-06 16:18:00.623318+05:30	f	Raja	Balaram	Kumar	patrosimanchal50@gmail.com	f	t	2022-08-06 16:18:00.234777+05:30		9090341768	\N
181	pbkdf2_sha256$260000$rJu6JNTzRLCrAgjlYTL86W$LzlJGGmA6Qin6Bsjkt3D8FzomOdL6u2uLzvekuxn334=	2022-06-24 19:47:10.256899+05:30	f	Shona	Bayant	Sonu 	jeet5646@gmail.com	f	t	2022-06-24 19:47:09.881254+05:30		9354055297	\N
202	pbkdf2_sha256$260000$ZthrwLSeGFbFD7zzGYOOfN$0qehmFSTXD3it9CBjYd7z6chQVBbdbyYva4TWHTODeU=	2022-08-11 07:35:39.64161+05:30	f	AjaZ	ajaz	Zohda	ajazzohdasanik@gmail.com	f	t	2022-08-11 07:35:39.26523+05:30		8082094176	\N
182	pbkdf2_sha256$260000$gVDk9K6SCBLSRGVLqLCZRX$P+hA2x93uUIz6mHeidrwgbahs062gZUCMpv6VTKbwdc=	2022-06-24 23:27:19.793865+05:30	f	Sidharth8527	Sidharth	Malhotra	sidharthmalhotra121005@gmail.com	f	t	2022-06-24 23:22:48.53149+05:30		8527001265	\N
192	pbkdf2_sha256$260000$0eG5p57PsLDVYKFhE0PrxN$nPdLVD1UwWhcYTwZtExUVUbYBQwFq11STBrz4qtcJzQ=	2022-08-06 18:20:16.161478+05:30	f	Abhay zinzurke 	Abhay 	Kumar	abhayrk09984@gmail.com	f	t	2022-08-06 18:20:15.782072+05:30		9984125743	\N
184	pbkdf2_sha256$260000$vnnMBgwBnlLxNzrR9DmAJe$HTkT+P+PWQjlhLPbyfaiXJAzt5LIyzUCBu6TI+q3k40=	2022-07-16 17:27:12.2755+05:30	f	Viratkohli	Virat	Kohli	viratkohli@bb.com	f	t	2022-07-16 17:27:11.873729+05:30		7828765831	\N
185	pbkdf2_sha256$260000$mHDSBwIHPwBGVDbRBVtRMT$mejLqSsyySEUHEt51mtXZ1N6MDyvpYsSjhd4cmi4sZw=	2022-07-18 19:13:06.170025+05:30	f	Nikhiltyagi	Nikhil	Tyagi	tsuman5517@gmail.com	f	t	2022-07-18 19:13:05.778888+05:30		9671789235	\N
198	pbkdf2_sha256$260000$O87T9uDv3Z2WwSMuZ1H1rL$wZwGQZW6g5xKvEn3LnORWzcd/2WP2/8XiItuy8NTGmc=	2022-08-09 15:46:58.434943+05:30	f	Love_boy_aftab.786	Aftab	Khan	roy651743@gmail.com	f	t	2022-08-09 15:46:58.054084+05:30		7076502124	\N
193	pbkdf2_sha256$260000$GZoix9YIqLZFEYHHvshyNu$NnaK0OPqPe2LgoY2ILGyj3N4pxjVB5+O2S21BZxX54A=	2022-08-07 17:47:34.44749+05:30	f	@rizwa_n2916	Ali	Ali	rizwanali0628@gmail.com	f	t	2022-08-07 17:47:34.05978+05:30		7668696979	\N
187	pbkdf2_sha256$260000$p1PJhvfpbhwV5jQNKlmQwG$t/7wg+BgYjMsUBrOlMU6MrIMjDbgcdVJ51WF8fO0vQQ=	2022-07-18 23:10:55.178603+05:30	f	gouravpariyar2@gmail.com	Gourav 	Pariyar 	gouravpariyar2@gmail.com	f	t	2022-07-18 23:10:54.80752+05:30		8930964447	\N
194	pbkdf2_sha256$260000$wvs9E1i9R33cIcPLjwitCW$vyDpOft3fANgpfYGi+ymBY4JInd2mq1R90eC0qDYRFw=	2022-08-08 08:16:59.854712+05:30	f	Mohd sameer	Mohd	Sameeer	instgramhelper0@gmail.com	f	t	2022-08-08 08:16:59.469153+05:30		9353565711	\N
186	pbkdf2_sha256$260000$feR9pWGOzBbdS8xExQH2ue$KV4p6v5HZNznhAIEc+To+JnzZfIG+N/B33ib1E1L2eU=	2022-08-08 15:38:10.536768+05:30	f	Soul mate 	Robin 	Singh	soulmate@123	f	t	2022-07-18 21:44:24.488457+05:30		8683040409	\N
183	pbkdf2_sha256$260000$aKDrJ9gEpX495Ot4kk1Xg8$p0mRkuH74VF+0CaM5iXqholL868ysTUA5rhBh6aBquU=	2022-09-05 20:56:03.632926+05:30	t	admin				t	t	2022-07-10 15:08:46.589131+05:30	admin		\N
188	pbkdf2_sha256$260000$TyUbyEG7nYXlsrJbQvN4MK$pCF7ECjyl/tQt3L8HSX5MfZ0ZjR/+rEVRESIA3PHHk0=	2022-07-29 10:05:50.800133+05:30	f	Rohit_kairwali_05	Rohit	Kashyap	rohitkashyap23517@gmail.com	f	t	2022-07-29 10:05:50.382419+05:30		9050335571	Zi4a7d4qI6ITLXSxzDOJZZLY4xUKisC5f1B
199	pbkdf2_sha256$260000$jNQVbs6wdjDDShFpDsXvm0$0q1WNkekyMHaVgoFdzZDY5p97noUrwpTQEViGmHWt80=	2022-08-09 15:59:41.565333+05:30	f	mohdshahn0279	mohd	shahan	mohdshahan0290@gmail.com	f	t	2022-08-09 15:59:41.185631+05:30		9369067318	\N
189	pbkdf2_sha256$260000$ICUUBDuUkyREnkozXGQMaE$WJp8MU65r9arqEaFNsAGG8T0F/rXssksTSBADML4aOQ=	2022-08-03 07:18:14.274278+05:30	f	Vvvbbnvcvhh	Hwhhwhb	Wbbwbwb	munnakhan673@gmail.com	f	t	2022-08-03 07:18:13.88431+05:30		8670307146	\N
195	pbkdf2_sha256$260000$ZHfmabras2Q5XizGzfXraN$uit+hgnVgJqDU16CxRxU9INXRs14WSbFuTdyE72hgJc=	2022-08-09 15:07:25.691457+05:30	f	mohdshahanshort 	study	shahan	shahanstudy0278@gmail.com	f	t	2022-08-09 15:07:25.307144+05:30		9369067316	\N
190	pbkdf2_sha256$260000$OsEmqEAsOFEFJlVGB7rR2y$AfImUnrqHEs3B5hzPrWLBXef9tpAzDzybZGnQz/biBA=	2022-08-04 17:50:00.003699+05:30	f	Rahul	Singj	Singh	rahuljohn221002@gamil.com	f	t	2022-08-04 17:49:59.61193+05:30		8887620969	\N
203	pbkdf2_sha256$260000$cwBghvsf95kYblrHMTXGlc$BQg4kipVugpGcSPmfmB97W65cRIl1le9mq85/CGAuYE=	2022-08-11 16:53:36.309225+05:30	f	Rajesh	Rajesh yadav 	Yadav 	rajeshak797398@gmail.com	f	t	2022-08-11 16:53:35.923961+05:30		7973985703	\N
200	pbkdf2_sha256$260000$IoXfw1ucfJupDMi63nxfY3$+6rAnTfKdwloqzbh3dInbNCW44BqHtzOAdCEn+mtLQc=	2022-08-10 00:03:46.299269+05:30	f	mohdshahan0378	mohd 	Shahan 	mohdshahan0278@gmail.com	f	t	2022-08-10 00:03:45.919284+05:30		093690 67313	\N
196	pbkdf2_sha256$260000$gycAyDH0kalJkYHrMLUOX7$zosN3TuRSbBfi/IrJ15F3gCQwjtph0wUjfbCbCtLho4=	2022-08-09 15:16:48.743484+05:30	f	m9hdshahan0278	Mohd 	SHAHAN	shahanstudy278@gmail.com	f	t	2022-08-09 15:16:48.365504+05:30		9369067317	\N
197	pbkdf2_sha256$260000$8V2FHd1GRU9vfASez1kqXl$cTJmZeXyoH8Mwued2KcA8HwNaFBDShXMflRgYSBwOMg=	2022-08-09 15:34:44.875928+05:30	f	Love_boy_Aftab.786	Aftab	Khan	aftabmolla108@gmail.com	f	t	2022-08-09 15:34:44.496476+05:30		7076502124	RYU67KbcJU3tTwXJZrYd0wPxSyslKF4z336
201	pbkdf2_sha256$260000$n11Oojch7va6eT2LGaGdiS$ZUqXNlBsRoHVtvD2sT0Pn6Fe4y7+dB+JlwJ7Pj89ZPE=	2022-08-10 13:06:06.17492+05:30	f	_harshvardhan_077	Harshvardhan	Rathore	rajsingh53@gmail.com	f	t	2022-08-10 13:06:05.7946+05:30		9001953843	\N
206	pbkdf2_sha256$260000$UKDt3LGHirP3yhrihjEae3$9UBAsm31HAQt06OBfKZj5Xiw4PjrJYEydAeNYZitCck=	2022-08-12 14:51:34.257378+05:30	f	Anash	Anash	Theet	bhatisubhash614@gmail.com	f	t	2022-08-12 14:51:33.875447+05:30		6396936743	\N
204	pbkdf2_sha256$260000$C4ImDmf5ott35afSeMMR9I$60T6G/KxZahm1eqHo3cACaJZYLU8vnVuRcSTCKe/pt4=	2022-08-11 16:54:06.234518+05:30	f	chetan 	chetan	mohane	chetanmohane5@gmail.com	f	t	2022-08-11 16:54:05.856707+05:30		780-607-0457	\N
180	pbkdf2_sha256$260000$BMIBVd4Lw1tYpQhDm2x5Yw$XwkWzB8F/OSTNr2FBAUri91ZMfr5/9Dn3hnxM/kRiI8=	2022-08-23 09:52:34.674183+05:30	f	__.sambhav.__	Sambhav	Bhagwaniya 	sambhavbhagwaniya@gmail.com	f	t	2022-06-24 16:07:16.443431+05:30		9893533424	\N
205	pbkdf2_sha256$260000$1XTA5ZGQGPnuWHdj8NMmjf$buxB4BZQTJ3hk5Uesr0hrNYrOS887ckjFxiLzsdXDAY=	2022-08-12 12:17:11.139989+05:30	f	Kanha	Pathak	Kanha pathak	pathakkanha24@gmail.com	f	t	2022-08-12 12:17:10.755778+05:30		9996045979	cAI64xAvy0uwQAndRXB4qwOnabBmWBB6Gdk
209	pbkdf2_sha256$260000$QTxOcjEbE2Y69o0xemDA0b$VEGt5l75hwUMDFxJ9rfnB5+pdMAqsl6hkZO7qeb6UWg=	2022-08-12 20:06:27.455136+05:30	f	Ex_crush_rakesh_143	Rakesh 	Mohapatra 	dmahapatra282@gmail.com	f	t	2022-08-12 20:06:27.074814+05:30		6371088340	\N
208	pbkdf2_sha256$260000$amHE40WpBXvIq6LKedI0n8$AJl5CY45GKTst+eW1DU4lVAAa9oclgFOfi0H2FWyn+U=	2022-08-12 19:43:35.441062+05:30	f	Samratmukherjer	Samrat	Mukherjee	samratmukherjee968@gmail.com	f	t	2022-08-12 19:43:35.066383+05:30		8670330608	\N
207	pbkdf2_sha256$260000$HbVWRtvfczZJr7bQja8Psn$PS89iXAopTqDMtAyPa2soQaIfp8IH17/lBFsABMrQbM=	2022-08-12 19:29:55.280301+05:30	f	Samratmukherjee	Samrat	Mukherjee	samratmukherjee968@gamil.com	f	t	2022-08-12 19:29:54.900373+05:30		8670330608	\N
210	pbkdf2_sha256$260000$mSOQhHX71jdTzYTyfzVqdv$GItp/ToEQQWgjT30fy1WrP99y+07s/7FcH1ga7dqRTY=	2022-08-12 23:46:44.041225+05:30	f	Kingkhan	King 	Khan	vikashghujar@gmail.com	f	t	2022-08-12 23:46:43.650739+05:30		7982215879	\N
211	pbkdf2_sha256$260000$9ObWwA0MT7IxIxCdZdHDXf$zz3im4U/zSJIS9OZqtXG8ibkyBcZlStY7LHlS7WiiNU=	2022-08-13 11:04:08.810785+05:30	f	itx_me_a_r_f_a_t	Arfat 01	Arfat 01	dararfat46@gmail.com	f	t	2022-08-13 11:04:08.421762+05:30		6005404498	\N
212	pbkdf2_sha256$260000$BJEwOgW0X5Yf49bvNl3cfi$Rj923NtzK5SRQOp18oSpZbimCgUHjfVNO5ZKektcAIw=	2022-08-13 15:53:47.971598+05:30	f	kirnya._s	Kiran 	Chaudhari 	kingofworld1299@gmail.com	f	t	2022-08-13 15:53:47.592837+05:30		7028529185	\N
213	pbkdf2_sha256$260000$tnmssnV27uvFUhN4tLvF7a$znnZ+z+tDMUgqTdhngsRR9PyStJ46wechoa0leNFCxI=	2022-08-14 00:02:33.549545+05:30	f	Cristiano 	Cristiano 	Ronaldo 	memestudies12@gmail.com	f	t	2022-08-14 00:01:43.808044+05:30		9407245431	\N
214	pbkdf2_sha256$260000$t3687rdH0LSdA6rNyAyrn9$790K3r3MMu9ZxFlt3gRKhZ3l8BO8zwC29MmeHJq/ZQM=	2022-08-14 13:52:05.818634+05:30	f	SATWIKKOUNDAL	Satwik	Koundal	killerbhai451@gmail.com	f	t	2022-08-14 13:52:05.433563+05:30		8580725177	\N
215	pbkdf2_sha256$260000$EWFPuYbBsFczvWKvctxsYn$40pI8ondbt2mPsaUXmA6LGlVjhtFjZrL4q0Bkeh/Z74=	2022-08-14 15:18:39.64849+05:30	f	Happy7762	Pavan	Pavan	pavanapavana3060@gmail.com	f	t	2022-08-14 15:18:39.267864+05:30		9353395935	\N
236	pbkdf2_sha256$260000$Py1PNNTFNssfWdjS8B7YqE$ws6AX2hwXlpnlVnxx5BGdO+hImnwY/hP3Q5Ad8HBmbQ=	2022-08-20 19:19:24.758556+05:30	f	Kher ajay	Kher	Ajay	kherajalo123456789@gmail.com	f	t	2022-08-20 19:19:24.372572+05:30		9664805030	\N
216	pbkdf2_sha256$260000$veqUH7CrXcq7nrYKtABvmz$Iv5Ql69vD6j5fQsgAoERv6BvX8l0mXVKfJmkvQGnj1Y=	2022-08-14 15:27:31.276968+05:30	f	Happyy7762	Pavan	Pavan	sujaysujay9591@gmail.com	f	t	2022-08-14 15:27:30.898877+05:30		9353395935	\N
225	pbkdf2_sha256$260000$nCBzUgMqmGArQ9iWg1UmNg$n6OmO45fISNjRcP5b+sYP7MvxIGfhNBvqaxImba2Mwg=	2022-08-18 04:50:23.77487+05:30	f	raman	Ramam	Lakhani	ggpsycho999@gmail.com	f	t	2022-08-18 04:50:23.390444+05:30		8509781413	\N
217	pbkdf2_sha256$260000$tmPIIdZiT1YBWJdDjXQm6v$QGRZH3IZhmdGY+q8q/gy2qQewSvsLb4AUOHOlDcauW0=	2022-08-15 13:40:02.783304+05:30	f	Harshitsolanki001	Harshit 	Solanki 	solankiharshit613@gmail.com	f	t	2022-08-15 13:40:02.406002+05:30	Harshit Solanki	9329962429	\N
231	pbkdf2_sha256$260000$wP9LGD0JuvMuax9KFTTzdr$RbSN7rgcz0c5cWyKPSk1iXVVT8rXWKdZ2Oikxov9Pzk=	2022-08-20 10:24:41.2419+05:30	f	Sanamweb	Sanam 	Web	sanamwebdesigning@gmail.com	f	t	2022-08-20 10:24:40.860376+05:30		9548683664	\N
218	pbkdf2_sha256$260000$gXIGsS7VT1swcIqwFuCnOt$oRVeJP6/wkA8suOAyehyC4KqzNm33WLT3NEjrxN/l+M=	2022-08-15 21:52:53.779677+05:30	f	Aman Yadav	Aman	Yadav	anujyadav221507i@gmail.com	f	t	2022-08-15 21:52:53.391685+05:30		8948445821	\N
226	pbkdf2_sha256$260000$6rIzRbyMuWAGneN553p49m$wLHs7007h5b3XCPLPHfSvNSYufmyipQ/YyR8V8Hbx4o=	2022-08-18 11:43:27.88641+05:30	f	samkhan	Sam 	Khan	shahrukhsrk561@gmail.com	f	t	2022-08-18 11:43:27.512572+05:30		9528537960 	\N
219	pbkdf2_sha256$260000$jjcsnr06AkRHhSYleRsrwb$r0AhT6afo4p/mRaKorBwGlcEHeTnOa5At1SNe7MD6zU=	2022-08-15 22:03:44.393005+05:30	f	Grow_kk	Pijkk	 Hvu	khushikau@gmail.com	f	t	2022-08-15 22:03:44.012619+05:30		9354055297	\N
220	pbkdf2_sha256$260000$yxi9c55KdNR7c5zyhE2gX3$pTTCsGbNU8vJfWwkjmkjp78XjfY5ttPnaxXXQuA1re8=	2022-08-16 07:10:30.746287+05:30	f	Ankush Yadav	Ankush	Yadav	ankushyadavankushyadav963@gmail.com	f	t	2022-08-16 07:10:30.365203+05:30		8948445821	\N
221	pbkdf2_sha256$260000$KMqF4Kt0rIBHUs36TU7mtU$GA/4+TLlV9yGx1qMA3VBIFLhMTx9GjsEkUgevLf2Sn4=	2022-08-16 11:21:33.494833+05:30	f	Ajeet Yadav	Ajeet	Yadav	ajeetyadav221507@gmail.com	f	t	2022-08-16 11:21:33.1185+05:30		8948445822	\N
227	pbkdf2_sha256$260000$tPF11Bg56QNEX7LLq9jTpX$BPZLiIWnbPqZ6Ghqfs8XSabuWnoFmaQhN6IcIIMdPZ4=	2022-08-19 07:12:17.564107+05:30	f	Official_rati655	Rati ranjan	Nayak	ratranjann771@gmail.com	f	t	2022-08-19 07:12:17.184368+05:30		7008232449	\N
232	pbkdf2_sha256$260000$AQcaUI9wazS1RRJgQwMuL4$Y8qZl1czwh+ACG6WLi2DW0GFGfoOBtQYjZmOCj4rpds=	2022-08-20 13:57:24.521502+05:30	f	Janmale sandip	Janmale	Sandip	janmalesandip91@gmail.com	f	t	2022-08-20 13:57:24.138597+05:30		8275963415	\N
223	pbkdf2_sha256$260000$tQ6o3Cqq4VndW547CflXWe$pUy+5LApjUn7BFxg8rD1wiPsgnsmyzGZ/BjyLDAnCbY=	2022-08-16 20:45:56.129775+05:30	f	DARSHAN_MR_SOLANKI 	Darshan 	Rajput 	darshanrajput371@gamli.com	f	t	2022-08-16 20:45:55.753222+05:30		6355830222	\N
228	pbkdf2_sha256$260000$SdU27Oj9jXpKecbU3DVyli$Aq35uSo+QZBGbd9/OgkIbNpktLhjr+fUb4f/nsOWfhk=	2022-08-19 16:34:13.511517+05:30	f	Its_pankaj_jat	Pankaj 	Jat	pankajjat88888@gmail.com	f	t	2022-08-19 16:34:13.120711+05:30		9460152654	\N
224	pbkdf2_sha256$260000$uacch6Bnpu5rVnivnzV0gB$y5vSka56qbu3n7RTnZlWQB8EH2gFfHUDdczyXyd5ulE=	2022-08-17 13:46:21.487183+05:30	f	Mr_Raj_garje98	Garje	Bhausaheb 	bgarje329@gmail.com	f	t	2022-08-17 13:46:21.098075+05:30		9420004106	\N
239	pbkdf2_sha256$260000$X6vVT6ir6WZANpeEi2wend$UACkLfdQctqkLNf6JuI1Mi7KxccN2MjJtne8MezeaEA=	2022-08-20 21:57:57.549794+05:30	f	Ravirajput	Ravi	Rajput	cravi1792@gmail.com	f	t	2022-08-20 21:57:57.170805+05:30		7988023429	\N
229	pbkdf2_sha256$260000$ZsWWyeDJNO3t7x4rPPNef8$YSr+SIumrTui8Km2OdpRd9JN49lDhiTUnce0pzkDuC4=	2022-08-19 20:49:33.116688+05:30	f	Arjun Singh 	Arjun 	Singh 	arjunsingh0111y@gmail.com	f	t	2022-08-19 20:26:40.553463+05:30		8890765678	\N
233	pbkdf2_sha256$260000$nXe4kQBS1w1kOyHO67h9HL$iTx8zuu/tkahjNwFNkpKUHXvXie+wwzlE3KuCzrNvTc=	2022-08-20 14:10:16.683521+05:30	f	Janmale santosh 	Janmale	Santosh 	janmalesandip911@gmail.com	f	t	2022-08-20 14:10:16.304024+05:30		8275963415	\N
234	pbkdf2_sha256$260000$2NFKUdiOgzLXaPWntlNF4p$rGRdr11N4zMwtRcgh7T1wkTKdD4+waVlOf6vBp82RAY=	2022-09-01 23:46:25.650399+05:30	f	Amitverma43	Amit	Verma	avtechnology80@gmail.com	f	t	2022-08-20 17:01:51.960187+05:30		9990817195	\N
230	pbkdf2_sha256$260000$qqTjb2kKpwUg4BO4BeT4d2$dnh47PVhavIzj4cQYsYsNwEPqsAha/+O0sO/fMpAdZ4=	2022-08-20 00:38:48.691851+05:30	f	Kinghansrajrao	Hansraj	Rao	hansrajrao996@gmail.com	f	t	2022-08-20 00:18:37.02731+05:30		9586684552	\N
242	pbkdf2_sha256$260000$mNXpmHb3sAf6RbG3eFJHMl$AB0rHY4jSWMMMueeYeVeFpTgNwQmCNAyJXCJaDONkpQ=	2022-08-21 15:47:46.72923+05:30	f	Sonukhan	Sonu	Khan	1234@gmail.com	f	t	2022-08-21 15:47:46.34786+05:30		9520590786	\N
235	pbkdf2_sha256$260000$fAz9W6CCYHPNWX7Qn6ycpi$OepfPvU7MguDQjqo5qu1f/LtlfsNRM0+PxHa0UqI6gI=	2022-08-20 17:19:25.267853+05:30	f	Shubhammishra	Shubham	Mishra	gunjanmishra294456@gmail.com	f	t	2022-08-20 17:19:24.89214+05:30		8009300548	\N
222	pbkdf2_sha256$260000$bYV8Cc9r58RkhHa5ePjtND$D3qs+MKtn6v4LCoKNRvjWaEE0zvblgFwa1qQHTHXDaY=	2022-09-05 10:46:53.795435+05:30	f	Vivek_28	Vivek	Yadav	manojyadv9411@gmail.com	f	t	2022-08-16 17:44:37.956684+05:30		7978968785	tSuFuR4guyr7zt0L2yeWw8bgHqzGbJTRv4b
238	pbkdf2_sha256$260000$VW9Ka9ih7VLWyeCGYbFbAu$pzju2kcIwBUDcvgIsS8B9JgnRJYbN4loo2i638P1vb8=	2022-08-20 21:49:56.493267+05:30	f	Devilminati	Devil	Minati	vishalbains787@gmail.com	f	t	2022-08-20 21:49:56.117437+05:30		9781317426	\N
237	pbkdf2_sha256$260000$XE5qSFcGDOncPa05bEdncC$RjaO/WiT0HsDX9pGzCNAAJ7UCN1Bmp8ort3MNL80Gwk=	2022-08-24 20:46:59.946776+05:30	f	Shivuempire2003	Shivendra 	Mishra	shivendram978@gmail.com	f	t	2022-08-20 20:59:21.529525+05:30		7000951352	\N
240	pbkdf2_sha256$260000$5FUuyr3Ow77HYVKntCrWQ9$w8UtJ91xGOITwuLbyKTM/Ur7gyaiwKwdZiJw12cqJGM=	2022-08-21 13:39:26.652433+05:30	f	digital.sachin	Sachin 	Shukla 	pummyp3911@gmail.com	f	t	2022-08-21 13:39:26.274425+05:30		9625804776	\N
243	pbkdf2_sha256$260000$AeG341WEGMYzhy1vIYOoE1$KVdpeZ0N6uQ6KtqnAP7zoUgpkN1LN5FmZWNajMFxvl4=	2022-08-21 16:10:32.985409+05:30	f	deva.nsh3365 	devansh	malakar	devanshmalakar545@gmail.com	f	t	2022-08-21 16:10:32.60712+05:30		9926952204	Yhh1WADYPfliVaqubn3yx2udbbh19aqUp5m
244	pbkdf2_sha256$260000$g3GmeKbqGUyPl8PDgMRJGn$mHl1aK9MwcoCW/4CIn45xMBysxo6tmgypIkBqur6g24=	2022-08-21 16:21:42.430704+05:30	f	Shubham	Shubham	Shubham	shubhamking0942@gmail.com	f	t	2022-08-21 16:21:42.05096+05:30		9880644631	\N
245	pbkdf2_sha256$260000$3YfM8VKT9ftbkhS007ewfc$LVezRQPoQDTksdXZ/oKkrbv1bAAbuoS9S72ZYcUPJrk=	2022-08-21 18:16:43.803771+05:30	f	Chetankumawat	Chetan	Kumawat 	ck4859259@gmail.com	f	t	2022-08-21 18:00:33.07521+05:30		8094156928	\N
241	pbkdf2_sha256$260000$d0ycSNtLjcyw5sSzCzy9bm$JJhUJsuhSMddijWYogjvpZ4/jmiChBLQhONO9er57Ik=	2022-08-21 14:59:46.726378+05:30	f	Sonu 	Sonu	Khan	mohdnoshad34171@gmail.com	f	t	2022-08-21 14:59:46.344498+05:30		919520590786	\N
246	pbkdf2_sha256$260000$xhbs7YkFPfVuWLtJMILRFy$BCcGZAXg1zwrrVNZaXBY78U3+8Otu630pN64xKuLv4A=	2022-08-21 20:08:20.261889+05:30	f	pranav12	Pranav	Kumar	pranavkumar829241@gmail.com	f	t	2022-08-21 20:08:19.884131+05:30		8292410330	\N
247	pbkdf2_sha256$260000$J2l61jRuzaoUcNZnW14V2E$bXooQjwtcEaD4HbNXw2jrNCxZSNd0bIweM+n+TSfIeA=	2022-08-21 20:51:42.77048+05:30	f	Stylish_vishwajeet	Vishwajeet	Ji	vishwajeetraj27@gmail.com	f	t	2022-08-21 20:51:42.391193+05:30		6304927547	\N
264	pbkdf2_sha256$260000$jgkD3VdIiieUgSmZO1hMu7$PgHYXgTE3Wb0+sQTrNXH3Sx7ogPoDIRM8HuJ0gfkJlg=	2022-08-24 19:24:26.85023+05:30	f	VikkyBisht336	Vikky	Bisht	vb530035@gmial.com	f	t	2022-08-24 19:24:26.46417+05:30		8077901389	\N
248	pbkdf2_sha256$260000$KDYymyA7mYLEPXuE02n08s$3dIj1N0qc2QG5qWYSWePwAuYLxJDvOBWRvcuj+tefgM=	2022-08-21 20:59:33.560843+05:30	f	Ahmad Qureshi 	💫...محمد..احمدقریشی..👑	💫...محمد..احمدقریشی..👑	ahamadqurashe@gmail.com	f	t	2022-08-21 20:59:33.186878+05:30		8485033248	\N
257	pbkdf2_sha256$260000$kbRdsBrNSG3g5BJclg1Ha5$54OBx8qzxwZAUCOCwHiHcLcjeMkXbAertHHGJX8C5nQ=	2022-08-23 15:18:27.501638+05:30	f	Rajkumar	Raj	Kumar	rv9991198@gmail.com	f	t	2022-08-23 15:18:23.153392+05:30		7827298954	\N
268	pbkdf2_sha256$260000$etOK45MyFB6FnPuV6v0Cxm$v/op4GDb4zj5aTSqgbjiSpYjvjOeP5wLu/OlZCrquAQ=	2022-08-25 21:08:31.166271+05:30	f	Goldy 	Dharmendra 	Bhaskar	cgmobilegamer@gmail.com	f	t	2022-08-25 15:06:00.055094+05:30		7828062128	\N
258	pbkdf2_sha256$260000$me9kKPVgs74LGc2jhLcBho$DUJ90i3a2bH+gzUQ5Lkio0hJTaLFXp4DZ8s8/SjKwbs=	2022-08-23 15:38:41.160041+05:30	f	Raj.verma	Raj	Verma	rv9867062@gmail.com	f	t	2022-08-23 15:35:33.574441+05:30		7827298954	\N
250	pbkdf2_sha256$260000$Tub0zIerSBos4IpudNVKEN$EcxW1KVLcK2aWnpcYYjSUIQ90NnSTxiumzAkageHpRY=	2022-08-22 09:41:58.347572+05:30	f	Sonu@1	Sonu	Khan	sonukhan34171@gmail.com	f	t	2022-08-22 09:41:57.964965+05:30		919520590786	\N
265	pbkdf2_sha256$260000$P0LMQxZJUeu9swna95qwT3$cqHu25z4TVz8LhKtesrHm01NoFyHtTpoQqF8O8nSkII=	2022-08-24 20:41:12.867559+05:30	f	Karthik_alvina_ki_fan_001	Karthik 	Karthik 	thokalakarthik8@gmail.com	f	t	2022-08-24 20:41:12.489897+05:30		6303831368	\N
259	pbkdf2_sha256$260000$U8kagG1qGfT99yrbQBREXV$xRpxOYz1eC2BKoJQ0jXuoOnuwxmw0EVc9WfbS4tcZlM=	2022-08-23 15:54:57.223294+05:30	f	Vcarts123	Vc	Arts	vcvaseem@gmail.com	f	t	2022-08-23 15:54:56.619556+05:30		9037711714	\N
251	pbkdf2_sha256$260000$9nRIzLLDnm2kXFBfZKMuc9$IE0Ttqimk+gECGzkVGnBqa8JgI/6sZaboDAf+0cscac=	2022-08-22 16:22:03.835942+05:30	f	Smeer mishra	Smeer	mishra	smeer@gmail.com	f	t	2022-08-22 16:22:03.456909+05:30		8381830861	\N
252	pbkdf2_sha256$260000$w2X7uAkfWMfl02JrxngMSb$li7CQ1wvKimezesh9QiC1J8rK6CO18pGsPSR4638JNc=	2022-08-22 20:30:17.239153+05:30	f	Hemu	Hemant 	Dessai 	hemantdessai3@gmail.com	f	t	2022-08-22 20:30:16.858583+05:30		9356893762	\N
260	pbkdf2_sha256$260000$qylodwPfpIlXgkQO4z8ngQ$+XmYiSsdu4jlmCtZWE9GuYaCIrn1fLXdEGwl0q7kB2k=	2022-08-23 19:05:55.276193+05:30	f	Shinde pooja	Shinde 	Pooja 	sandipjanmale@gmail.com	f	t	2022-08-23 19:05:54.886045+05:30		8275963415	\N
249	pbkdf2_sha256$260000$UzjaHkYZbHZFeiaOM7ascw$JF0iYjQpSNqfpMMY+PQd/hmPGk1m7VXNBCC35e4/+iY=	2022-08-25 22:32:10.68141+05:30	f	Ashu	Ashu	Bishnoi	1996ashokbishnoi@gmail.com	f	t	2022-08-21 23:20:44.47456+05:30		9530095940	\N
253	pbkdf2_sha256$260000$wqLzbuxXOigP7m46Z76mXT$albcwt+gAPjJEHGnHF2VKouB0rLAV0Wz8YEyNHfPxI4=	2022-08-24 08:25:58.232185+05:30	f	Saurabh Sharma 	Saurabh 	Sharma 	sb6519295@gmail.com	f	t	2022-08-23 06:37:38.419859+05:30		7590883144	\N
254	pbkdf2_sha256$260000$LVzPeadjeVNY3pjjsxdbfq$Vftp7ioA+G2cbeTp88+p1qBH/dHNhu+aO6abmqAcOBE=	2022-08-23 11:55:21.980131+05:30	f	Shiv	Shankar	Shrivastav	shankarshrivastav5810@gmail.com	f	t	2022-08-23 11:55:21.603858+05:30		7383880285	\N
255	pbkdf2_sha256$260000$9zjUVBrMX79BdjeOAcIxpm$+yPiV6uux7dHQLD6zMt+r0LSAXZfLGCt00/V2+DjDPg=	2022-08-23 12:12:23.37926+05:30	f	Chani5911	Charanjeet	Singh	charanjeetsingh40517@gmail.com	f	t	2022-08-23 12:12:23.001889+05:30		7814918954	\N
266	pbkdf2_sha256$260000$fgOl882TZIn9gonNrBhxkM$kvd0vu05aKQjhfWpaoU0ngLxxMEvum9D/Cav8YiXVrE=	2022-08-25 14:48:15.896327+05:30	f	Vishal	Gurjar	Monu	sg3148700@gmail.com	f	t	2022-08-25 14:48:15.519064+05:30		6376082205	\N
256	pbkdf2_sha256$260000$z7vGGtgRMHxx50yscrIxHd$JGoIOLVGg1/rRBD8N8+swBJ07ovDIrI7UOBweR7tzyw=	2022-08-23 13:23:30.848857+05:30	f	Gadariyaking890	Saurabh	Pal	palsaurabh059@gmail.com	f	t	2022-08-23 13:23:30.43919+05:30		8467814460	\N
261	pbkdf2_sha256$260000$ANma17g9SDDse2VB0FyeXr$bfuulym9fh1+9R9Byz64hi6T3yrd+rxMQL9djSmurIY=	2022-08-24 13:49:57.139512+05:30	f	Sagkumar8521	Sagar	Kumar	mahima8445700@gmail.com	f	t	2022-08-24 13:49:56.761522+05:30		8445700807	\N
262	pbkdf2_sha256$260000$y8ROD0mboHrozVAAur1tfI$zRYQ9CTKonSt3bvzsum+FbdPULSmbLWL7oFwd1EHIFI=	2022-08-24 14:27:07.526118+05:30	f	Mishra smeer	Mishra	smeee	Mishra@gmail.com	f	t	2022-08-24 14:27:07.147528+05:30		6306573810	\N
267	pbkdf2_sha256$260000$pPehsFWBnRuhyQKZ5f38mY$3eXrUvmENw+UvlHODMh2eHUe8mT7IY0cW7ZVEfdt5nc=	2022-08-25 15:01:29.060119+05:30	f	anjalirajput	Anjali	Rajput 	anjalirajput10200224@gmail.com	f	t	2022-08-25 15:01:28.681686+05:30		8629972503	\N
263	pbkdf2_sha256$260000$lpQwg50vTdABt6JpZ1DZcN$NxTynjo8PhM5VRpOk3Pl2zFwQFkpB5NK36vuLiH5jug=	2022-08-24 16:56:40.468624+05:30	f	Brijboy09	Bharat	sanjot	brijeshsanjot143@gmail.com	f	t	2022-08-24 16:54:12.182342+05:30		9638477382	\N
271	pbkdf2_sha256$260000$WPs3CNxbjt7OeWXlVoEmjK$vdc70+71aYqJjdhFHyXfZTBzRIKuQ8h93NjiAo+IBN8=	2022-08-27 09:49:35.724292+05:30	f	Jazz@132	Jasmeet 	Sodhi	jasmeetsodhi99@gmail.com	f	t	2022-08-26 08:58:01.841951+05:30		8587983264	FFk73x3IZEX9Rw0UJvm1lSsKh03Ozdn9JkU
270	pbkdf2_sha256$260000$uu1YRPwCgxDWW1KK494u1t$zkbGtEn8qE1FNzLiz3xDI8cosVwfOOKWmDdJsKKY6T0=	2022-08-26 08:05:25.787513+05:30	f	Danishraaz86	Danish	Raaz	raazdanish86@gmail.com	f	t	2022-08-26 08:05:25.411141+05:30		6399908849	\N
275	pbkdf2_sha256$260000$mTD3QJq00DGxF1G5ZriTzb$9Bi8l4+t/u0Rj8S5fQaPxuDVdcig8XrFIwlKYiZ22XA=	2022-08-26 20:36:21.430311+05:30	f	Ashu12	Ashu	M	ashutoshmishra679@gmail.com	f	t	2022-08-26 20:36:21.050627+05:30		8429908541	\N
273	pbkdf2_sha256$260000$9ABDpDPXeCh42ddG6I4Joa$tWUI99ZXFrHwY2WnF11toKH3zYTZ6wsvwIsDk9WsZuY=	2022-08-26 14:58:44.834717+05:30	f	Yashpathak123	Yash	Pathak	yash2121pathak@gmail.com	f	t	2022-08-26 14:58:44.437156+05:30		8317087321	\N
272	pbkdf2_sha256$260000$iB8ST4KNxNUSW6cFEYU0ts$g27c9B9mX7d/iYAfkWMISVuot6rAjMPwtfsth7gEHJA=	2022-09-02 16:02:45.375225+05:30	f	King	King 	Khan	rajashab060@gmail.com	f	t	2022-08-26 13:54:12.051288+05:30		7827064021	\N
269	pbkdf2_sha256$260000$x7a5U9sXfXkc2lNyf5bieZ$Xo8N7S+8F+/e5CaDAZUvtcdWwBiVNY1nhcv2WRHkrm0=	2022-08-26 18:49:05.748818+05:30	f	Insta helper	Insta	Helper	ravishankarravishankar261@gmail.com	f	t	2022-08-26 01:22:39.479116+05:30		9580022048	\N
276	pbkdf2_sha256$260000$1gaJvglm1p7MdhNzDP1lvL$DkdQjh35sc8V/I3Hos9ipqcP1LCyORvO9BMWzUx2uMU=	2022-08-26 21:43:23.279966+05:30	f	Sharma123	Ravi	Sharma	hmmmmmha@gmail.com	f	t	2022-08-26 21:43:22.898601+05:30		9795294089	\N
277	pbkdf2_sha256$260000$ciyJ5vMV0ymvCWJ7FmFI5v$NsHfc61TlPLEorufXy7+DmiyPOxYZ4N6VRVK8JDOuxQ=	2022-08-26 22:54:43.593112+05:30	f	anu_creations.143	Karthik	Karthik	vikkin438@gmail.com	f	t	2022-08-26 22:54:43.211131+05:30		6303831368	\N
278	pbkdf2_sha256$260000$8UeBhxmhrGLBz05zmv56hd$YQFqhh9V6zqv48DzmZFhaX6pNi44CyCJRTyTjUvIMTA=	2022-08-27 12:03:38.404331+05:30	f	Mohim__khan09	Mohim	Ali	mohimali9890@gmail.com	f	t	2022-08-27 12:03:38.023146+05:30		9372572603	\N
279	pbkdf2_sha256$260000$irgkCsiZUhwJnoPjKWPjI4$tGy79GegL9JroCK/vdSLOy0AUmbv8AW5/R4A5gXDEyQ=	2022-08-27 13:57:06.714693+05:30	f	yahab yadav 	yahab	yadav 	yahabydaev@gmail.com	f	t	2022-08-27 13:57:06.335611+05:30		9305470165	\N
274	pbkdf2_sha256$260000$P5zS42sdCZc1zotSsn0mxy$Ubt70y2TdNtOy3fm2xTSevWHEAnPdRbPa+9+k7Tn1dY=	2022-08-29 10:56:51.078227+05:30	f	Ankush jha	Ankush	Jha	aj96@gmail.com	f	t	2022-08-26 15:12:52.041152+05:30		9153931513	\N
280	pbkdf2_sha256$260000$Cw9bjGU6m1nhSH9dbU51aS$uaJ4W2JSmCfOURRjFZK3vGCdkrdO/Ds22wVjZSNL4bI=	2022-08-27 14:25:47.975617+05:30	f	Caryybhai	Caryybhai	Caryybhai	igfollower325@gmail.com	f	t	2022-08-27 14:25:47.597341+05:30		7839388696	\N
281	pbkdf2_sha256$260000$lASuq0PkuqJ7e7j49NNbsP$dYtoyB0i7IEOnz832vFvCf+n43Brf7WWrWcnsPwO3t0=	2022-08-27 16:09:36.974318+05:30	f	_kabaddi__lover__shivu__17	Shivaraj	Dodamani 	dodamanishivaraj17@gmail.com	f	t	2022-08-27 16:09:36.595298+05:30		7899538513	\N
292	pbkdf2_sha256$260000$fV1wMwiO8OMvXNN5wDKEhW$+FzjUVdjQYYYjfTT9WEyXuJ48/nGb9KgagfSFFe0cHc=	2022-08-30 15:34:43.402394+05:30	f	Alone yar	Yaar	Alone	mukeshhans738@gmail.com	f	t	2022-08-30 15:34:43.02343+05:30		+91839697995	\N
282	pbkdf2_sha256$260000$NWbzAzwPrG4xQz24EQ8Dw6$YN5GM0+N8fPiN8C0TVr6HbVHe/W0s+KJnvpiNFHqBpQ=	2022-08-27 17:43:53.267707+05:30	f	Narsa7732	nihaal	sahu	sahunihaal885@gmail.com	f	t	2022-08-27 17:43:52.886887+05:30		8769377665	\N
283	pbkdf2_sha256$260000$ZMWWy72XgIshPeUrm1siH8$KEZWEA5cbz6K63QBhM2s+YismVK/pRlsRWI5edQmnlw=	2022-08-28 18:43:33.640913+05:30	f	Ajaymaan	Ajay	Maan	ajaymaan@gmail.com	f	t	2022-08-28 18:43:33.26083+05:30		8053192034	\N
284	pbkdf2_sha256$260000$4j8BE4KpxdoTRt8isPiJCp$1yMQa9eD8qE1J8jQoiNEbSGdtooyIKKMZ1aAgb+cxQQ=	2022-08-28 19:00:57.724887+05:30	f	Dhansa	7773	Shekhwat	dhansa266@gmail.com	f	t	2022-08-28 19:00:57.346012+05:30		9636225988	\N
293	pbkdf2_sha256$260000$mxZMddcCxnjFmXodo9kzci$p7NSKr2DCXv8w3cHTvqp1oPjEzFCUl/zHIa2IsTHjCc=	2022-08-30 15:57:21.391435+05:30	f	Prem_21_	Prem	Patel	prembhatasana@gmail.com	f	t	2022-08-30 15:57:21.012289+05:30		7283960090	\N
285	pbkdf2_sha256$260000$NEO9jLx8BZDbfNlOuZhf8f$vQXpgBzfu1AusN/c43RClWjSB9uGaxMQSpEpry8fMek=	2022-08-28 22:40:27.205705+05:30	f	jumman_203	Shekh 	Jumman	sahabshekh446@gmail.com	f	t	2022-08-28 22:40:26.825794+05:30		8103660203	\N
286	pbkdf2_sha256$260000$U88zkI54s4ejnj2St8XJtG$0raWZGySdXw0i50Fj7Kt142lNNk/tud/1J5EOawpSEw=	2022-08-29 07:46:42.186462+05:30	f	Rana partap	Rana parap	Rana	ranapartap65747@gmail.com	f	t	2022-08-29 07:46:41.806807+05:30		9528287427	\N
300	pbkdf2_sha256$260000$jTdKrCtXSC4qJoYrnWEZzg$CN4JdnmrXBBTQzNbHidnrKZh0zNgTkviH06PkOsqJ+k=	2022-08-31 21:39:18.267635+05:30	f	atharraza78	athar	raza	ansarishakil79987@gmail.com	f	t	2022-08-31 21:39:17.890396+05:30		7464006198	\N
287	pbkdf2_sha256$260000$bAOosc82m8b95hG2OPWG2M$hX/CLHZiZ7bl6j10xmsSRitbqrnfwxWmihThXk/979c=	2022-08-29 12:36:38.044523+05:30	f	a_k_dj_dholika_edition_7383_	Anil	Shrivastava 	seemadevshrivastav@gmail.com	f	t	2022-08-29 12:36:37.664885+05:30		7383880285	\N
294	pbkdf2_sha256$260000$3dI6jkwO1BoY6K3xWmxBCe$3LtbA7bIDIST43S7zq65e94AwVRPZmXoEqVJLRIDkU0=	2022-08-30 21:25:02.422852+05:30	f	rose.evalley68	Soham	Chakraborty	sohamchakraborty2004@gimal.com	f	t	2022-08-30 21:25:02.046737+05:30		9832944191	\N
288	pbkdf2_sha256$260000$34Ne9HimTtVLn1xsbtwbOC$CwojVIaGUJ1ru/H5aHJM4MzyazvDUrc6R3XvSnTLnz0=	2022-08-29 17:21:05.658096+05:30	f	Mohd wasi khan 	Iram	Khan	khanmohdwasi797@gmail.com	f	t	2022-08-29 15:03:58.825687+05:30		7460841729	\N
295	pbkdf2_sha256$260000$Hdb3wqsVtth4BKTbBJA4bY$Jvp352IihpRsj0dTfLM2aAvZT1UYLKZ1xauASF3Q4is=	2022-08-31 11:22:29.042693+05:30	f	sumanta9323	Ramprosad	Mukherjee 	ramprosadmukherjee1234@gmail.com	f	t	2022-08-31 11:22:28.662852+05:30		9734543241	\N
289	pbkdf2_sha256$260000$zVMahyxMQ0NrLqbOhmwa2B$sjumOi8wJ9BJ/idS5DyGRvzcA7s11gB60eqMU8m27M8=	2022-08-29 17:29:11.158835+05:30	f	Chetan kumawat	Chetan 	Kumawat	chetankumawatk356@gmail.com	f	t	2022-08-29 17:29:10.779179+05:30		8094156918	\N
290	pbkdf2_sha256$260000$a7NwrBGnYYf6CDelvUM2Cp$2/8O7P4jadr3mdXYUhy1uMSha1vlx102j0rPDfu5dCk=	2022-08-29 18:42:10.554446+05:30	f	Yadavjii	Yadav	Ji	yamit317@gmail.com	f	t	2022-08-29 18:42:10.178575+05:30		8115446281	\N
307	pbkdf2_sha256$260000$4P95rB0tqdHcEyRl90ZwUZ$GNULfmpVlUx8NeJmYmWTb2YcK3Zl3njodY/17wfi5EI=	2022-09-02 23:35:00.665755+05:30	f	sunn_y5004	Sanny 	Khan	shekhjumman38@gmail.com	f	t	2022-09-01 23:36:04.0904+05:30		8103660203	\N
291	pbkdf2_sha256$260000$BWDTO3zT10eW1xsUGBPaLC$UhXhaLamOa75qFaNiHRQA0LZqXL/rc23q8H9AYRz8vs=	2022-08-30 00:45:51.516173+05:30	f	miss__shmriti__dutta	Shmriti Rekha Dutta	Dutta	shmritirekhadutta@gmail.com	f	t	2022-08-30 00:45:51.136306+05:30		6901387033	\N
296	pbkdf2_sha256$260000$mBeuO30DvIZhiivQoLuCCS$+cJ1PUUPyC9gM0UdUPlnu3btHYtcEQ5NaNfM5YxJ2Zk=	2022-08-31 15:17:27.939884+05:30	f	alone_aman_4141	Gold	Ji	golu50549@gmail.com	f	t	2022-08-31 15:17:27.560224+05:30		8115446287	\N
301	pbkdf2_sha256$260000$nydHVhDY4MJqTPYtv4AoW2$UPA1uu9ItwOfmOonTaGS0rJ+8O/UuouUfjY7hkovME0=	2022-08-31 22:04:23.225512+05:30	f	It's _officail_yadac_54	Prince	Yadav	princeyadav738062@gmail.com	f	t	2022-08-31 22:04:22.849426+05:30		7380623815	\N
297	pbkdf2_sha256$260000$eTOlbpwTLBYauRBm9Ha3im$tpz9wSM4l0/X9gdBwmB+W1fYZMlLsrOrH4/Ra5R+C1U=	2022-08-31 18:22:35.572898+05:30	f	Sukh6789	Sukh	Gill 	RajputKashi93@gmail.com	f	t	2022-08-31 18:22:35.192709+05:30		7526983539	\N
299	pbkdf2_sha256$260000$sGe5vOe676c9vo1YpQvZle$4DEOtiCSIUtrO9O0xzP9r8wQ0r8Wp6mpuJKL8Kpc2ao=	2022-08-31 21:34:26.220679+05:30	f	Babar 	Babar	Ali	babarali77451@gamil.com	f	t	2022-08-31 21:34:25.830173+05:30		8449516963	\N
302	pbkdf2_sha256$260000$ZV8fZibxE9QFny1Y3wJjvD$+S5D3ShrZze5zi4ojUrxfxozZT+21Ze3YcVDRc0iTKw=	2022-09-01 14:00:15.637921+05:30	f	Priyank	Priyank	Rana	tomar@gmail.com	f	t	2022-09-01 14:00:15.25693+05:30		8279410007	\N
308	pbkdf2_sha256$260000$Tz6FqpKJ6mMgKLpXKif2wX$GkmRd7A1O5Ydii20bIpylEAX0qLifqSAgAropd1QGT8=	2022-09-02 16:50:08.032157+05:30	f	Gupta	Pawan	Raj	gupatap4@gmail.com	f	t	2022-09-02 16:50:07.653507+05:30		9128844365	\N
306	pbkdf2_sha256$260000$n6QPpWDGCgBqDhM0M2etPR$l3YFxbr1uwJ6aPyklqHUHB/jL4CE37WoI/Sb/Tx+YZ0=	2022-09-01 20:05:47.251205+05:30	f	love_boy_aftab.786	Love 	Aftab	donaftab67@gmail.com	f	t	2022-09-01 20:05:46.865608+05:30		7076502124	\N
304	pbkdf2_sha256$260000$hEuqDDdRYzmYfqH1FNuP7N$R29gcBotMi47py8JF2IKMl4zt14OtWVdOVf9TtyAMho=	2022-09-01 19:37:15.251563+05:30	f	Salman	Salman	Khan	salman2324@gmail.com	f	t	2022-09-01 19:37:14.87096+05:30		9456485684	\N
309	pbkdf2_sha256$260000$bh3EzEW2vukYayUw5tcgXG$CueSdm8luYFq9kK3k7D2flLzd0mZOwYvPPIpnhLHUmA=	2022-09-02 20:43:47.073961+05:30	f	munj366	Shubham 	Verma	shubhamkushwaha10102003@gmail.com	f	t	2022-09-02 20:43:46.696636+05:30		6386557731	\N
311	pbkdf2_sha256$260000$LrGMhniX9M07Fj0RmSla5j$EVMvXvxZ0w3tDpCV9ZklGi/6tb2fP5HDrJBOJg5duwY=	2022-09-03 10:24:24.356398+05:30	f	roy_kaushal55	KAUSHAL	ROY	k.kaushalraj17@gmail.com	f	t	2022-09-03 10:14:46.496258+05:30		8340116029	\N
310	pbkdf2_sha256$260000$dV6TF2H6Uest59YBIjKBIw$Odak69QO0AcwRBPItEupL4E338IJ12qlmdzaO9w5yMY=	2022-09-03 07:50:47.395217+05:30	f	shrey_ansh870	Vikky 	Yadav 	yprateek294@gmail.com	f	t	2022-09-03 07:50:47.013065+05:30		9137607596	\N
298	pbkdf2_sha256$260000$xSOOHh2u1Z7uAKnFVBxT34$H5RcXRYhIXt+6yU4igUKfmtkGRVGPUu5B06e4e2LSpU=	2022-09-03 11:02:17.124333+05:30	f	Pussu_dada_rdx	Pussu	Rdx	pussugujjar8@gmail.com	f	t	2022-08-31 21:32:40.097879+05:30		7850813556	\N
312	pbkdf2_sha256$260000$9YgX89FBnHUKTn7XXfIB8x$UTo56ShPR8j8NxSH6ChDz0l6vJtwMBZqr0SfIJW7HYI=	2022-09-03 13:23:33.35706+05:30	f	utta.m6501	Akaah	Yadav	uttamYadav163@gmail.com	f	t	2022-09-03 13:23:32.98234+05:30		7068659048	\N
305	pbkdf2_sha256$260000$sw3EeqxjtKgvGoNfFE1dcd$08+UjL2Pz2W8fxNz7eiI/wJBKMW6K6jP3RIg3VEFKcw=	2022-09-03 19:27:59.356357+05:30	f	Jhonsena	Jhon	Sena	jhsonena2342@gmail.com	f	t	2022-09-01 19:45:27.606967+05:30		8545635522	\N
313	pbkdf2_sha256$260000$5cNTVmjYFzQPF9YgnLNS5Q$GNzjXNex7QTp/tFKxZUffTYUhAbtWCoMToEGazkAHEY=	2022-09-03 17:32:46.418464+05:30	f	deepak251160	Deepak	Yadav	yadavdeepak69@gmail.com	f	t	2022-09-03 17:32:46.039501+05:30		8528836049	\N
314	pbkdf2_sha256$260000$TooNid0rczQOGXaqfx5ju6$dH54yJLDL2SfiKOMjga3zeHX0AAbG5bLmzBjr+pJefo=	2022-09-03 19:46:12.036346+05:30	f	Monuverma__14	Monu	Verma	monuverma.97532@gmail.com	f	t	2022-09-03 19:46:11.659467+05:30		7489332808	\N
315	pbkdf2_sha256$260000$0sSOHrmf2wWBjihAK6wk6N$wZx64dNm/nCCkDM/d9Xj2tzjBMjFWJCM931VsZH7/38=	2022-09-03 21:18:13.590178+05:30	f	Shivam	Prajapati	Prajapati	shivam221404@gmail.com	f	t	2022-09-03 21:18:13.210657+05:30		9219560703	\N
316	pbkdf2_sha256$260000$ptKIMf4aBMdir1V2txUdAt$io+Imn95UmE6NmZKXPj8NZE1wW9RtNvmisrMMwbdnJE=	2022-09-03 22:12:58.879149+05:30	f	Lone	Momin	5674	sablone719@gmail.com	f	t	2022-09-03 22:12:58.501675+05:30		9103249347	\N
317	pbkdf2_sha256$260000$hoZzjAJ04ji6aKyGw81f1K$B20fqFNHfU+apOgGaRfvrOLM46OlzsE5aze9wOjn2XI=	2022-09-03 22:14:09.614748+05:30	f	Bhit	Momin	5674	mudasirlone565@gmail.com	f	t	2022-09-03 22:14:09.238188+05:30		9103249347	\N
318	pbkdf2_sha256$260000$nxz4GvWfcxAhEc3nM5XWnJ$KbeE5gM7bV+Lu9StxqmQnvWcqDNACyi4X7+yqSWj2ls=	2022-09-04 07:38:21.775464+05:30	f	Rafiq	Lone	Rafiq	lonerafiq800@gmail.com	f	t	2022-09-04 07:38:21.394847+05:30		9622497142	\N
319	pbkdf2_sha256$260000$gR2aJB2ayoX953dS4dKlJu$qnKQJkkJvHbyFLdWOxKKEY3MjHwo3JiXQznLhrlUbI8=	2022-09-05 12:27:34.380046+05:30	f	Ved_00	Vedant	Mhatre	vedantmhatre398@gmail.com	f	t	2022-09-05 12:27:33.986042+05:30		9767092727	\N
320	pbkdf2_sha256$260000$6pykYuIuZMf2OejX5Qo9eh$FI3aYibJonJ5ovONtQFhvYa7WABWPA5ClQB+q+V5lFc=	2022-09-05 13:16:55.311112+05:30	f	Raja Prajapati 	Raja 	Prajapati 	rajaprajapati29275@gmail.com	f	t	2022-09-05 13:16:54.91649+05:30		8009964417	\N
321	pbkdf2_sha256$260000$JKwzwgYwO1NW9ypQcrYJGR$Rz3Qx0ZiYlq3PwnHpyEm4DiwGkucyWhMcUFoLUDrjRI=	2022-09-05 14:20:29.312775+05:30	f	Dipak Rajput 	Gohil	Dipak	gohildipakgohil2005@gmail.com	f	t	2022-09-05 14:20:28.929+05:30		9328331995	\N
322	pbkdf2_sha256$260000$wfETa3qurg8cocoe12F6Ro$Et4bMtETMgbDpzvRb54xJtfKM90uN6mgwWcF30B7oVU=	2022-09-05 15:54:44.326202+05:30	f	mr_parfect_2003	Suraj	Jadhav	surajjadhav93070@gmail.com	f	t	2022-09-05 15:54:43.929252+05:30		९३०७०६३५६९	\N
323	pbkdf2_sha256$260000$WkYNTFvEZ5M05NIwbxqbtY$9X/i+zenAYuH3VYxfuBJL7a6FGOVchI20WRRy0dFJ5c=	2022-09-05 16:19:31.345169+05:30	f	Vidhayadher	Vidhayadher	Talepa	garenatopuplow@gmail.com	f	t	2022-09-05 16:19:30.966101+05:30		9351149892	\N
324	pbkdf2_sha256$260000$OAKojCLM48j2O2OKcUngQT$2UqUexdEw1EkKMsoYbTy/HSwueduxLEudQM20trnM2k=	2022-09-05 20:29:46.52909+05:30	f	Soni Thakur 	Soni	Thakur 	sonithakur121@gmail.com	f	t	2022-09-05 20:29:46.149512+05:30		9557210463	\N
\.


--
-- Data for Name: authapp_user_groups; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.authapp_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: authapp_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.authapp_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: dashboard_api; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.dashboard_api (id, name, api_key, api_url, active) FROM stdin;
1	The Royal SMM	33d9d2dffca6a2c92ff8eb39521c1c81	https://theroyalsmm.com/api/v2	t
\.


--
-- Data for Name: dashboard_counterorder; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.dashboard_counterorder (id, counter) FROM stdin;
1	750791
\.


--
-- Data for Name: dashboard_settings; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.dashboard_settings (id, keyword, whatsapp_no, description, logo, pyament_qr, site_name, site_title, whatsapp_message, paytm_merchant_id, paytmqr_active) FROM stdin;
1	\N	+91 8871103363		image/LogoMakerCa-1641307466005.png	image/paytmqr_1.jpeg	Promotion maro	Promotion maro | Cheap service	Hello I want to increase my follower	DjuTWZ44811387175510	t
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-01-04 20:17:16.513413+05:30	1	INSTAGRAM FOLLOWERS 🔥🔥	1	[{"added": {}}]	3	1
2	2022-01-04 20:20:18.894671+05:30	1	INSTAGRAM REAL FOLLOWERS	1	[{"added": {}}]	4	1
3	2022-01-04 20:27:31.22223+05:30	2	INSTAGRAM REAL FOLLOWERS	1	[{"added": {}}]	4	1
4	2022-01-04 20:28:06.194005+05:30	2	INSTAGRAM REAL FOLLOWERS	3		4	1
5	2022-01-04 20:29:56.759612+05:30	1	INSTAGRAM REAL FOLLOWERS WITH REFIL	2	[{"changed": {"fields": ["Name", "Max order", "Description"]}}]	4	1
6	2022-01-04 20:33:00.872847+05:30	3	INSTAGRAM REAL FOLLOWERS NON REFIL	1	[{"added": {}}]	4	1
7	2022-01-04 20:38:38.431918+05:30	1	INSTAGRAM REAL FOLLOWERS WITH REFIL	2	[]	4	1
8	2022-01-04 20:40:37.442748+05:30	2	INSTAGRAM REELS VIEWS	1	[{"added": {}}]	3	1
9	2022-01-04 20:42:08.744757+05:30	4	INSTAGRAM REELS VIEWS PERMANENT	1	[{"added": {}}]	4	1
10	2022-01-04 20:42:48.951423+05:30	3	INSTAGRAM LIKES 👍👍	1	[{"added": {}}]	3	1
11	2022-01-04 20:43:56.606077+05:30	5	Instagram real likes	1	[{"added": {}}]	4	1
12	2022-01-04 20:44:24.87761+05:30	4	Instagram Comments	1	[{"added": {}}]	3	1
13	2022-01-04 20:46:41.679916+05:30	6	Instagram Comments	1	[{"added": {}}]	4	1
14	2022-01-08 20:33:10.088021+05:30	1	- 0.0 Rs 	1	[{"added": {}}]	2	1
15	2022-01-08 21:29:54.224635+05:30	2	Test	3		1	1
16	2022-01-09 11:11:16.33403+05:30	2	- 100.0 Rs 	1	[{"added": {}}]	2	1
17	2022-01-09 19:18:35.131875+05:30	1	TransanctionsModel object (1)	2	[{"changed": {"fields": ["Is approved", "Status"]}}]	11	1
18	2022-01-09 19:31:59.131251+05:30	1	INSTAGRAM REAL FOLLOWERS NON REFIL-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	1
19	2022-01-12 20:54:14.628348+05:30	2	TransanctionsModel object (2)	2	[{"changed": {"fields": ["Status"]}}]	11	1
20	2022-01-12 20:56:59.860257+05:30	2	TransanctionsModel object (2)	2	[]	11	1
21	2022-01-12 20:59:12.381673+05:30	3	INSTAGRAM REELS VIEWS PERMANENT-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
22	2022-01-12 20:59:35.757068+05:30	3	INSTAGRAM REELS VIEWS PERMANENT-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
23	2022-01-12 21:30:08.013726+05:30	3	INSTAGRAM REELS VIEWS PERMANENT-Completed	3		10	1
24	2022-01-12 21:30:08.016112+05:30	2	INSTAGRAM REAL FOLLOWERS NON REFIL-Pending	3		10	1
25	2022-01-12 21:30:08.017768+05:30	1	INSTAGRAM REAL FOLLOWERS NON REFIL-Cancelled	3		10	1
26	2022-01-12 21:30:18.46265+05:30	4	TransanctionsModel object (4)	3		11	1
27	2022-01-12 21:30:18.46498+05:30	3	TransanctionsModel object (3)	3		11	1
28	2022-01-12 21:30:18.466769+05:30	2	TransanctionsModel object (2)	3		11	1
29	2022-01-12 21:30:18.468379+05:30	1	TransanctionsModel object (1)	3		11	1
30	2022-01-12 21:30:37.068571+05:30	2	- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
31	2022-01-12 21:30:47.745701+05:30	3	Ashish- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
32	2022-01-12 21:30:54.262895+05:30	4	Ashish- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
33	2022-01-12 21:31:21.77049+05:30	1	Admin	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	1	1
34	2022-01-14 14:29:42.879204+05:30	5	Telegram service 💖💖🔥🔥🔥	1	[{"added": {}}]	3	1
35	2022-01-14 14:30:16.483884+05:30	2	INSTAGRAM REELS VIEWS 💥💥✨	2	[{"changed": {"fields": ["Name"]}}]	3	1
36	2022-01-14 14:33:48.04384+05:30	4	Instagram Comments 📝📝	2	[{"changed": {"fields": ["Name"]}}]	3	1
37	2022-01-14 14:36:22.521639+05:30	7	Telegram member { Global }	1	[{"added": {}}]	4	1
38	2022-01-14 14:37:52.701032+05:30	8	Telegram Indian 🇮🇳🇮🇳 member  100%	1	[{"added": {}}]	4	1
39	2022-01-14 14:40:01.113857+05:30	9	Telegram Channel / Group  💥💥	1	[{"added": {}}]	4	1
40	2022-01-14 14:41:47.005327+05:30	6	Facebook Profile Followers 🙋🙋	1	[{"added": {}}]	3	1
41	2022-01-14 14:45:24.350585+05:30	10	Facebook Profile Followers 🙋🙋 {Non Drop}	1	[{"added": {}}]	4	1
42	2022-01-14 14:52:42.852194+05:30	7	⚡ Facebook: Post Likes | Post Emoji (INDIAN🔥)	1	[{"added": {}}]	3	1
43	2022-01-14 14:56:47.068988+05:30	11	🇮🇳👍 Facebook Indian Likes - [ Max - 10K | Speed: 1000/hour ][ Ultra Fast ][ R/30D ][ Real ]	1	[{"added": {}}]	4	1
44	2022-01-14 14:58:24.080514+05:30	12	India Love React - [ Max - 10K | Speed 1000/hour [ Ultra Fast ][ R/30D ][ Real ]	1	[{"added": {}}]	4	1
45	2022-01-14 14:59:39.850716+05:30	13	Service 🇮🇳😡 Facebook Indian Angry React - [ Max - 10K | Speed 1000/hour [ Ultra Fast ][ R/30D ][ Real ] Start	1	[{"added": {}}]	4	1
46	2022-01-14 15:01:03.074904+05:30	14	🇮🇳😄 Facebook Indian Haha React - [ Max - 10K | Speed 1000/hour [ Ultra Fast ][ R/30D ][ Real ]	1	[{"added": {}}]	4	1
47	2022-01-14 15:03:32.987446+05:30	15	Service 🇮🇳🥰 Facebook India Care React	1	[{"added": {}}]	4	1
48	2022-01-14 15:04:23.185938+05:30	7	⚡ Facebook: Post Likes | Post Emoji (INDIAN🔥) 30 Days Refil	2	[{"changed": {"fields": ["Name"]}}]	3	1
49	2022-01-14 15:05:31.205722+05:30	8	👍 Facebook Post Likes	1	[{"added": {}}]	3	1
50	2022-01-14 15:06:24.971756+05:30	16	✔Facebook - Post Likes || 30 Days Refill ||	1	[{"added": {}}]	4	1
51	2022-01-14 17:11:33.931629+05:30	9	👀 Youtube Views 👀	1	[{"added": {}}]	3	1
52	2022-01-14 17:12:18.728793+05:30	17	Youtube Views [Non Drop]	1	[{"added": {}}]	4	1
53	2022-01-14 17:13:08.842725+05:30	10	💥Youtube Subscribers💥	1	[{"added": {}}]	3	1
54	2022-01-14 17:16:14.456768+05:30	18	💎YouTube Subscribers [30 Days Refill Button] [40-60/D] [0-12/H] - Working	1	[{"added": {}}]	4	1
55	2022-01-14 17:17:38.937833+05:30	19	✨YouTube Subscribers ( 𝐈𝐌𝐏𝐑𝐎𝐕𝐄𝐃 ) INSTANT | 500-1000/D	1	[{"added": {}}]	4	1
56	2022-01-14 17:18:29.508657+05:30	20	YouTube Subscribers - [ Max - 1.5K | Speed: 30/Day ] [ Refill: 30 Days ] [ Non Drop ] [ Slow - Start: 0-1 Hour ]	1	[{"added": {}}]	4	1
57	2022-01-14 17:20:27.272285+05:30	21	Service 🇺🇸 YouTube USA Subscribers - [NON DROP]	1	[{"added": {}}]	4	1
58	2022-01-14 17:21:34.75474+05:30	22	YouTube Subscribers ( Russian ) - [ Max - 50K | Speed: 20-50/Day ] [ Very Slow But 100% Non-Drop ] Start: 0-12hr 🇷🇺 -	1	[{"added": {}}]	4	1
59	2022-01-14 17:22:56.546916+05:30	23	YouTube Subscribers - [ Max - 10K | Speed: 3K/Day ] [ No Refill ] Start: 0-2hr 🔥	1	[{"added": {}}]	4	1
60	2022-01-14 17:23:45.472929+05:30	24	Youtube Subscribers | Real | No Refill | MAX 10K -	1	[{"added": {}}]	4	1
61	2022-01-14 17:26:04.365984+05:30	11	🔆 Youtube Likes/Dislikes🔆	1	[{"added": {}}]	3	1
62	2022-01-14 17:28:10.183725+05:30	25	Real Likes [Non drop] [Speed 10k/day] [Max-100k] R30 Instant Starte Video Likes [Non Drop]	1	[{"added": {}}]	4	1
63	2022-01-14 17:29:27.985342+05:30	26	Dislikes | HQ Real Users | 10K | Fast	1	[{"added": {}}]	4	1
64	2022-01-14 17:29:53.299906+05:30	12	⏲👀 Youtube Watch Time 👀⏲	1	[{"added": {}}]	3	1
65	2022-01-14 17:32:24.95256+05:30	27	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day	1	[{"added": {}}]	4	1
66	2022-01-14 17:34:22.529846+05:30	28	Youtube Views [Watchtime 10 - 25 Mint] RMint] R30 ♻️ -	1	[{"added": {}}]	4	1
67	2022-01-14 17:35:43.257206+05:30	29	Youtube Views [10-30 Min Watch Time] [10K-20K/Day] R30	1	[{"added": {}}]	4	1
68	2022-01-14 17:39:21.613705+05:30	1	CounterOrder object (1)	1	[{"added": {}}]	15	1
69	2022-01-14 18:41:10.023118+05:30	5	TransanctionsModel object (5)	2	[{"changed": {"fields": ["Status"]}}]	11	1
70	2022-01-14 18:54:41.873656+05:30	5	Carry- 20.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
71	2022-01-14 18:56:19.4526+05:30	4	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
72	2022-01-14 22:52:54.528829+05:30	1	INSTAGRAM REAL FOLLOWERS WITH REFIL	2	[{"changed": {"fields": ["Rate"]}}]	4	1
73	2022-01-15 12:27:07.172711+05:30	29	Youtube Views [10-30 Min Watch Time] [10K-20K/Day] R30	2	[]	4	1
74	2022-01-15 15:41:14.001663+05:30	4	Ashish	3		1	1
75	2022-01-15 15:41:14.00367+05:30	5	Carry	3		1	1
76	2022-01-16 17:02:09.545987+05:30	10	Carry- 100.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
77	2022-01-16 18:39:52.022478+05:30	30	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳	1	[{"added": {}}]	4	1
78	2022-01-16 18:41:52.752834+05:30	31	CHEAP INSTAGRAM LIKES 👍👍	1	[{"added": {}}]	4	1
79	2022-01-16 20:11:16.262971+05:30	11		1	[{"added": {}}]	1	1
80	2022-01-16 20:11:35.865879+05:30	11	Main	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status", "Superuser status"]}}]	1	1
81	2022-01-16 22:16:39.640388+05:30	5	🇮🇳👍 Facebook Indian Likes - [ Max - 10K | Speed: 1000/hour ][ Ultra Fast ][ R/30D ][ Real ]-Pending	3		10	1
82	2022-01-16 22:37:06.190452+05:30	10	Carry	2	[{"changed": {"fields": ["password"]}}]	1	1
83	2022-01-16 22:40:53.493428+05:30	8	TransanctionsModel object (8)	2	[{"changed": {"fields": ["Status"]}}]	11	1
84	2022-01-16 22:42:14.949963+05:30	6	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
85	2022-01-16 22:42:35.984218+05:30	6	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
86	2022-01-16 22:43:15.739914+05:30	7	TransanctionsModel object (7)	2	[{"changed": {"fields": ["Is approved", "Status"]}}]	11	1
87	2022-01-16 23:00:11.962321+05:30	8	TransanctionsModel object (8)	3		11	1
88	2022-01-16 23:00:11.964597+05:30	7	TransanctionsModel object (7)	3		11	1
89	2022-01-16 23:00:32.503933+05:30	11	Main	3		1	1
90	2022-01-16 23:02:48.013359+05:30	6	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	3		10	1
91	2022-01-17 10:42:25.851538+05:30	9	TransanctionsModel object (9)	2	[{"changed": {"fields": ["Is approved"]}}]	11	1
92	2022-01-17 10:43:23.903964+05:30	9	TransanctionsModel object (9)	2	[{"changed": {"fields": ["Status"]}}]	11	1
93	2022-01-17 10:46:57.466356+05:30	11	TransanctionsModel object (11)	3		11	1
94	2022-01-17 10:46:57.468535+05:30	10	TransanctionsModel object (10)	3		11	1
95	2022-01-17 11:12:27.776595+05:30	12	TransanctionsModel object (12)	3		11	1
96	2022-01-17 11:13:24.32941+05:30	13	TransanctionsModel object (13)	3		11	1
97	2022-01-17 12:29:32.694983+05:30	14	Rajesh- 20.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
98	2022-01-17 12:44:28.461709+05:30	7	Instagram real likes-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
99	2022-01-17 12:46:07.85264+05:30	14	TransanctionsModel object (14)	2	[{"changed": {"fields": ["Status"]}}]	11	1
100	2022-01-17 12:46:16.975163+05:30	14	Rajesh- 20.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
101	2022-01-17 12:55:58.071459+05:30	13	⚡ Instagram Story & Live Video Views ⚡	1	[{"added": {}}]	3	1
102	2022-01-17 12:56:37.597216+05:30	32	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]	1	[{"added": {}}]	4	1
103	2022-01-17 12:57:37.438632+05:30	8	INSTAGRAM REELS VIEWS PERMANENT-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
104	2022-01-17 14:08:54.958921+05:30	7	Instagram real likes-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
105	2022-01-17 14:31:55.486399+05:30	16	TransanctionsModel object (16)	3		11	1
106	2022-01-17 14:31:55.488669+05:30	15	TransanctionsModel object (15)	3		11	1
107	2022-01-17 14:34:25.737594+05:30	10	Carry	2	[{"changed": {"fields": ["Username"]}}]	1	1
108	2022-01-17 14:35:27.271847+05:30	10	Carry0000	2	[{"changed": {"fields": ["First name"]}}]	1	1
109	2022-01-17 14:36:08.42398+05:30	17	TransanctionsModel object (17)	1	[{"added": {}}]	11	1
110	2022-01-17 14:36:30.464803+05:30	8	INSTAGRAM REELS VIEWS PERMANENT-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
111	2022-01-17 15:41:44.201283+05:30	18	TransanctionsModel object (18)	2	[{"changed": {"fields": ["Status", "Transaction id"]}}]	11	1
112	2022-01-17 15:48:13.480907+05:30	18	TransanctionsModel object (18)	2	[{"changed": {"fields": ["Transaction id"]}}]	11	1
113	2022-01-17 15:49:55.235824+05:30	9	INSTAGRAM REAL FOLLOWERS NON REFIL-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	1
114	2022-01-17 15:51:43.679993+05:30	10	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
115	2022-01-17 16:10:00.829186+05:30	19	TransanctionsModel object (19)	2	[{"changed": {"fields": ["Status"]}}]	11	1
116	2022-01-17 16:10:33.974813+05:30	16	Abhishek- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
117	2022-01-17 16:11:58.631401+05:30	10	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
118	2022-01-17 16:14:53.910931+05:30	12	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
119	2022-01-17 16:15:38.176759+05:30	11	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
120	2022-01-17 16:29:01.320561+05:30	11	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
121	2022-01-17 16:29:08.685279+05:30	12	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
122	2022-01-17 17:22:16.43559+05:30	21	TransanctionsModel object (21)	2	[{"changed": {"fields": ["Status", "Transaction id"]}}]	11	1
123	2022-01-17 17:26:14.183831+05:30	15	Carry- 228.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
124	2022-01-17 18:28:27.386345+05:30	13	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
125	2022-01-17 18:28:40.238909+05:30	14	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
126	2022-01-17 18:35:02.483028+05:30	10	Carry0000	2	[{"changed": {"fields": ["password"]}}]	1	1
127	2022-01-17 18:44:44.315513+05:30	20	TransanctionsModel object (20)	3		11	1
128	2022-01-17 19:29:51.899138+05:30	24	TransanctionsModel object (24)	2	[{"changed": {"fields": ["Status"]}}]	11	1
129	2022-01-17 19:30:17.805273+05:30	13	Sasi- 105.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
130	2022-01-17 19:38:02.315712+05:30	22	TransanctionsModel object (22)	2	[{"changed": {"fields": ["Status"]}}]	11	1
131	2022-01-17 19:38:30.998923+05:30	23	TransanctionsModel object (23)	2	[{"changed": {"fields": ["Status"]}}]	11	1
132	2022-01-17 19:56:58.817287+05:30	15	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
133	2022-01-17 21:03:32.267702+05:30	14	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
134	2022-01-17 21:03:39.940804+05:30	15	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
135	2022-01-17 21:12:09.166145+05:30	2	TicketsModel object (2)	3		14	1
136	2022-01-17 21:12:50.904542+05:30	13	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
137	2022-01-17 21:12:52.97633+05:30	13	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[]	10	1
138	2022-01-17 21:18:58.949987+05:30	25	TransanctionsModel object (25)	2	[{"changed": {"fields": ["Status"]}}]	11	1
139	2022-01-17 21:25:09.352647+05:30	26	TransanctionsModel object (26)	2	[{"changed": {"fields": ["Status"]}}]	11	1
140	2022-01-17 21:31:01.468808+05:30	16	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
141	2022-01-17 22:32:41.840617+05:30	16	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
142	2022-01-18 11:46:32.566523+05:30	27	TransanctionsModel object (27)	2	[{"changed": {"fields": ["Status"]}}]	11	1
143	2022-01-18 12:00:20.051442+05:30	17	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
144	2022-01-18 12:28:19.621132+05:30	18	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
145	2022-01-18 12:41:19.108834+05:30	17	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
146	2022-01-18 13:51:50.932652+05:30	18	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
147	2022-01-18 13:52:27.141707+05:30	19	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
148	2022-01-18 16:16:02.749685+05:30	28	TransanctionsModel object (28)	2	[{"changed": {"fields": ["Status"]}}]	11	1
149	2022-01-18 16:17:07.326534+05:30	19	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
150	2022-01-18 16:17:40.661517+05:30	29	TransanctionsModel object (29)	2	[{"changed": {"fields": ["Status"]}}]	11	1
151	2022-01-18 16:33:14.152268+05:30	20	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
152	2022-01-18 17:25:09.204136+05:30	15	Carry- 10.199999999999989 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
153	2022-01-18 18:34:31.798736+05:30	31	TransanctionsModel object (31)	2	[{"changed": {"fields": ["Status"]}}]	11	1
154	2022-01-18 19:02:26.885515+05:30	21	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
155	2022-01-18 19:02:35.739099+05:30	20	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
156	2022-01-18 19:11:22.311199+05:30	32	TransanctionsModel object (32)	2	[{"changed": {"fields": ["Status"]}}]	11	1
157	2022-01-18 20:10:58.669578+05:30	21	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
158	2022-01-18 20:49:15.716754+05:30	21	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
159	2022-01-18 21:54:16.713421+05:30	39	TransanctionsModel object (39)	2	[{"changed": {"fields": ["Status"]}}]	11	1
160	2022-01-18 22:37:53.662412+05:30	38	TransanctionsModel object (38)	3		11	1
161	2022-01-18 22:37:53.664848+05:30	37	TransanctionsModel object (37)	3		11	1
162	2022-01-18 22:37:53.666256+05:30	36	TransanctionsModel object (36)	3		11	1
163	2022-01-18 22:37:53.667746+05:30	35	TransanctionsModel object (35)	3		11	1
164	2022-01-18 22:37:53.669145+05:30	34	TransanctionsModel object (34)	3		11	1
165	2022-01-18 22:37:53.670608+05:30	33	TransanctionsModel object (33)	3		11	1
166	2022-01-19 12:26:10.937212+05:30	40	TransanctionsModel object (40)	2	[{"changed": {"fields": ["Status"]}}]	11	1
167	2022-01-19 12:40:09.153532+05:30	41	TransanctionsModel object (41)	2	[{"changed": {"fields": ["Status"]}}]	11	1
168	2022-01-19 12:44:50.190647+05:30	22	INSTAGRAM REELS VIEWS PERMANENT-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
169	2022-01-19 13:07:44.414402+05:30	42	TransanctionsModel object (42)	2	[{"changed": {"fields": ["Status"]}}]	11	1
170	2022-01-19 13:08:26.672279+05:30	42	TransanctionsModel object (42)	2	[]	11	1
171	2022-01-19 13:15:15.964418+05:30	25	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
172	2022-01-19 13:31:12.528062+05:30	43	TransanctionsModel object (43)	2	[{"changed": {"fields": ["Status"]}}]	11	1
173	2022-01-19 13:34:24.930481+05:30	24	INSTAGRAM REAL FOLLOWERS NON REFIL-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	1
174	2022-01-19 13:40:39.897189+05:30	45	TransanctionsModel object (45)	2	[{"changed": {"fields": ["Status"]}}]	11	1
175	2022-01-19 13:40:49.81671+05:30	44	TransanctionsModel object (44)	2	[{"changed": {"fields": ["Status"]}}]	11	1
176	2022-01-19 13:41:07.616379+05:30	26	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
177	2022-01-19 14:14:40.973752+05:30	25	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
178	2022-01-19 14:14:51.999819+05:30	26	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
179	2022-01-19 15:30:28.703619+05:30	45	TransanctionsModel object (45)	3		11	1
180	2022-01-19 15:30:28.706175+05:30	44	TransanctionsModel object (44)	3		11	1
181	2022-01-19 15:30:51.758419+05:30	39	TransanctionsModel object (39)	3		11	1
182	2022-01-19 15:30:51.760534+05:30	32	TransanctionsModel object (32)	3		11	1
183	2022-01-19 15:30:51.762116+05:30	29	TransanctionsModel object (29)	3		11	1
184	2022-01-19 15:31:11.607153+05:30	26	TransanctionsModel object (26)	3		11	1
185	2022-01-19 15:31:11.60923+05:30	23	TransanctionsModel object (23)	3		11	1
186	2022-01-19 15:31:11.610639+05:30	22	TransanctionsModel object (22)	3		11	1
187	2022-01-19 15:31:11.611958+05:30	19	TransanctionsModel object (19)	3		11	1
188	2022-01-19 18:17:25.242404+05:30	30	TransanctionsModel object (30)	3		11	1
189	2022-01-19 21:03:06.642816+05:30	46	TransanctionsModel object (46)	2	[{"changed": {"fields": ["Status"]}}]	11	1
190	2022-01-19 21:27:04.750683+05:30	21	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
191	2022-01-19 21:27:45.484013+05:30	27	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
192	2022-01-19 23:50:49.028436+05:30	27	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
486	2022-02-12 16:23:43.986956+05:30	88	TransanctionsModel object (88)	3		11	1
193	2022-01-20 14:29:17.984277+05:30	47	TransanctionsModel object (47)	2	[{"changed": {"fields": ["Status"]}}]	11	1
194	2022-01-20 14:29:27.350948+05:30	48	TransanctionsModel object (48)	2	[{"changed": {"fields": ["Status"]}}]	11	1
195	2022-01-20 15:21:41.997195+05:30	28	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
196	2022-01-20 17:49:08.020189+05:30	49	TransanctionsModel object (49)	2	[{"changed": {"fields": ["Status"]}}]	11	1
197	2022-01-20 18:00:09.328742+05:30	29	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
198	2022-01-20 19:19:36.502579+05:30	23	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
199	2022-01-20 19:20:43.073167+05:30	48	TransanctionsModel object (48)	3		11	1
200	2022-01-20 20:07:53.29707+05:30	23	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
201	2022-01-20 20:09:12.597727+05:30	30	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
202	2022-01-20 20:10:28.300523+05:30	28	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
203	2022-01-20 20:10:47.70183+05:30	29	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
204	2022-01-20 20:18:50.376052+05:30	22	INSTAGRAM REELS VIEWS PERMANENT-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
205	2022-01-20 21:26:44.530192+05:30	30	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
206	2022-01-21 11:31:30.731005+05:30	50	TransanctionsModel object (50)	2	[{"changed": {"fields": ["Status"]}}]	11	1
207	2022-01-21 11:31:34.259088+05:30	50	TransanctionsModel object (50)	2	[]	11	1
208	2022-01-21 11:35:22.931259+05:30	31	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
209	2022-01-21 11:41:42.971299+05:30	50	TransanctionsModel object (50)	2	[]	11	1
210	2022-01-21 11:42:00.289676+05:30	13	Sasi- 5.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
211	2022-01-21 11:43:35.227593+05:30	31	INSTAGRAM REAL FOLLOWERS NON REFIL-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	1
212	2022-01-21 11:43:47.70117+05:30	13	Sasi- 55.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
213	2022-01-21 11:43:54.14755+05:30	13	Sasi- 55.0 Rs 	2	[]	2	1
214	2022-01-21 11:50:24.64995+05:30	3	TicketsModel object (3)	2	[{"changed": {"fields": ["Status"]}}, {"added": {"name": "Message", "object": "message#4"}}, {"changed": {"name": "Message", "object": "message#3", "fields": ["Message"]}}]	14	1
215	2022-01-21 14:08:08.723555+05:30	32	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
216	2022-01-21 17:03:58.097011+05:30	32	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
217	2022-01-21 17:37:17.851814+05:30	51	TransanctionsModel object (51)	2	[{"changed": {"fields": ["Is approved", "Status"]}}]	11	1
218	2022-01-21 17:38:14.77563+05:30	13	Sasi- 131.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
219	2022-01-21 17:48:54.911802+05:30	33	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
220	2022-01-21 17:54:11.220548+05:30	33	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
221	2022-01-21 18:27:11.25418+05:30	26	Ashish- 500.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
222	2022-01-21 19:48:15.425359+05:30	52	TransanctionsModel object (52)	2	[{"changed": {"fields": ["Status"]}}]	11	1
223	2022-01-21 19:48:40.870739+05:30	13	Sasi- 291.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
224	2022-01-21 19:49:20.005527+05:30	34	INSTAGRAM REELS VIEWS PERMANENT-Pending	3		10	1
225	2022-01-21 20:03:55.671304+05:30	36	Instagram real likes-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
226	2022-01-21 20:05:23.874439+05:30	37	Instagram real likes-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
227	2022-01-21 20:06:30.180763+05:30	38	Instagram real likes-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
228	2022-01-21 20:15:50.431036+05:30	35	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
229	2022-01-21 21:27:58.354617+05:30	35	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
230	2022-01-22 07:39:18.979445+05:30	39	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
231	2022-01-22 07:39:48.274821+05:30	40	Instagram real likes-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
232	2022-01-22 11:08:47.691865+05:30	54	TransanctionsModel object (54)	2	[{"changed": {"fields": ["Status"]}}]	11	1
233	2022-01-22 11:09:06.513799+05:30	53	TransanctionsModel object (53)	3		11	1
234	2022-01-22 13:32:33.231614+05:30	40	Instagram real likes-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
235	2022-01-22 15:33:12.018877+05:30	55	TransanctionsModel object (55)	2	[{"changed": {"fields": ["Status"]}}]	11	1
236	2022-01-22 15:33:50.582457+05:30	41	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
237	2022-01-22 15:52:15.397723+05:30	55	TransanctionsModel object (55)	3		11	1
238	2022-01-22 15:52:35.671822+05:30	41	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	3		10	1
239	2022-01-22 17:40:54.565158+05:30	38	Instagram real likes-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
240	2022-01-22 17:41:03.11018+05:30	36	Instagram real likes-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
241	2022-01-22 17:41:18.133035+05:30	37	Instagram real likes-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
242	2022-01-22 19:32:14.895404+05:30	27	Ashish	3		1	1
243	2022-01-22 19:32:37.586525+05:30	3	Ashish	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	1	1
244	2022-01-22 19:33:51.633485+05:30	3	Ashish- 2000.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
245	2022-01-22 19:55:35.253682+05:30	14	Free Service 💥💥🔥🔥🔥🔥🔥	1	[{"added": {}}]	3	3
246	2022-01-22 19:59:16.35634+05:30	33	Free instagram likes 🔥🔥🔥	1	[{"added": {}}]	4	3
247	2022-01-22 20:30:16.779183+05:30	42	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
248	2022-01-22 20:51:04.976894+05:30	42	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
249	2022-01-22 23:06:24.49172+05:30	43	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
250	2022-01-23 12:01:41.124304+05:30	56	TransanctionsModel object (56)	2	[{"changed": {"fields": ["Status"]}}]	11	1
251	2022-01-23 12:02:02.978971+05:30	57	TransanctionsModel object (57)	3		11	1
252	2022-01-23 13:06:44.942406+05:30	45	Instagram real likes-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
253	2022-01-23 13:21:53.506165+05:30	44	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
254	2022-01-23 18:40:54.307587+05:30	44	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
255	2022-01-23 18:41:08.609821+05:30	45	Instagram real likes-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
256	2022-01-23 18:42:26.928387+05:30	58	TransanctionsModel object (58)	3		11	1
257	2022-01-23 20:24:10.709774+05:30	46	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
258	2022-01-23 20:48:02.04654+05:30	46	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
259	2022-01-23 21:30:07.641648+05:30	32	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]	2	[{"changed": {"fields": ["Rate"]}}]	4	3
260	2022-01-23 21:45:41.968487+05:30	60	TransanctionsModel object (60)	2	[{"changed": {"fields": ["Status"]}}]	11	3
261	2022-01-23 21:46:11.830445+05:30	59	TransanctionsModel object (59)	2	[{"changed": {"fields": ["Status"]}}]	11	3
262	2022-01-23 21:47:53.151039+05:30	4	INSTAGRAM REELS VIEWS PERMANENT	2	[{"changed": {"fields": ["Rate"]}}]	4	3
263	2022-01-23 21:58:48.493851+05:30	59	TransanctionsModel object (59)	3		11	1
264	2022-01-24 02:08:30.83878+05:30	14	Free Service 💥💥🔥🔥🔥🔥🔥	2	[]	3	3
265	2022-01-24 02:08:43.179201+05:30	14	Free Service 💥💥🔥🔥🔥🔥🔥	2	[]	3	3
266	2022-01-24 02:10:21.920928+05:30	1	INSTAGRAM REAL FOLLOWERS WITH REFIL	2	[{"changed": {"fields": ["Rate"]}}]	4	3
267	2022-01-24 02:10:33.302949+05:30	30	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳	2	[{"changed": {"fields": ["Rate"]}}]	4	3
268	2022-01-24 02:10:57.319679+05:30	3	INSTAGRAM REAL FOLLOWERS NON REFIL	2	[{"changed": {"fields": ["Rate"]}}]	4	3
269	2022-01-24 02:17:29.758444+05:30	34	💲Instagram + Video views + Igtv + Reel	1	[{"added": {}}]	4	3
270	2022-01-24 10:41:01.370331+05:30	48	INSTAGRAM REELS VIEWS PERMANENT-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
271	2022-01-24 12:01:13.439973+05:30	61	TransanctionsModel object (61)	2	[{"changed": {"fields": ["Status"]}}]	11	3
272	2022-01-24 12:21:37.304634+05:30	49	Instagram real likes-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
273	2022-01-24 12:22:42.275359+05:30	49	Instagram real likes-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
274	2022-01-24 12:43:30.908894+05:30	1	Settings object (1)	1	[{"added": {}}]	16	1
275	2022-01-24 12:52:43.324703+05:30	34	💲Instagram + Video views + Igtv + Reel	2	[{"changed": {"fields": ["Blow id"]}}]	4	1
276	2022-01-24 12:59:03.397427+05:30	34	💲Instagram + Video views + Igtv + Reel	2	[{"changed": {"fields": ["Blow active"]}}]	4	3
277	2022-01-24 13:00:01.481787+05:30	34	💲Instagram + Video views + Igtv + Reel	2	[{"changed": {"fields": ["Snakers id"]}}]	4	3
278	2022-01-24 13:01:01.88217+05:30	33	Free instagram likes 🔥🔥🔥	2	[{"changed": {"fields": ["Active", "Blow id", "Blow active", "Snakers id"]}}]	4	3
279	2022-01-24 13:01:24.009639+05:30	34	💲Instagram + Video views + Igtv + Reel	2	[{"changed": {"fields": ["Snakers active"]}}]	4	3
280	2022-01-24 13:01:46.72566+05:30	5	Instagram real likes	2	[{"changed": {"fields": ["Snakers id", "Snakers active"]}}]	4	3
281	2022-01-24 13:03:29.824647+05:30	5	Instagram real likes	2	[{"changed": {"fields": ["Min order"]}}]	4	1
282	2022-01-24 13:06:02.647035+05:30	51	Instagram real likes-Pending	3		10	1
283	2022-01-24 13:06:02.649637+05:30	50	Instagram real likes-Pending	3		10	1
284	2022-01-24 16:08:56.006019+05:30	62	TransanctionsModel object (62)	2	[{"changed": {"fields": ["Status"]}}]	11	3
285	2022-01-24 16:23:27.255632+05:30	52	INSTAGRAM REELS VIEWS PERMANENT-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
286	2022-01-24 16:37:51.333962+05:30	52	INSTAGRAM REELS VIEWS PERMANENT-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
287	2022-01-24 16:38:20.213658+05:30	47	INSTAGRAM REELS VIEWS PERMANENT-Test	2	[{"changed": {"fields": ["Status"]}}]	10	1
288	2022-01-24 19:32:02.1684+05:30	2	Admin- 1000.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
289	2022-01-24 19:35:15.641529+05:30	53	Instagram real likes-Pending	3		10	1
290	2022-01-24 19:36:18.579144+05:30	54	Instagram real likes-Pending	3		10	1
291	2022-01-24 20:23:34.148966+05:30	55	Instagram real likes-Test	2	[{"changed": {"fields": ["Status"]}}]	10	1
292	2022-01-24 20:24:26.720513+05:30	56	INSTAGRAM REAL FOLLOWERS NON REFIL-Test	2	[{"changed": {"fields": ["Status"]}}]	10	1
293	2022-01-24 20:32:40.278493+05:30	57	Instagram real likes-Test	2	[{"changed": {"fields": ["Status"]}}]	10	1
294	2022-01-24 20:56:28.326928+05:30	58	Instagram real likes-Pending	3		10	1
295	2022-01-24 20:56:28.329251+05:30	57	Instagram real likes-Test	3		10	1
296	2022-01-24 20:56:28.330664+05:30	56	INSTAGRAM REAL FOLLOWERS NON REFIL-Test	3		10	1
297	2022-01-24 20:56:28.332045+05:30	55	Instagram real likes-Test	3		10	1
298	2022-01-25 11:56:01.18157+05:30	4	TicketsModel object (4)	2	[{"changed": {"fields": ["Subject", "Status"]}}, {"added": {"name": "Message", "object": "message#7"}}]	14	1
299	2022-01-25 11:56:18.321572+05:30	5	TicketsModel object (5)	2	[{"changed": {"fields": ["Status"]}}, {"added": {"name": "Message", "object": "message#8"}}]	14	1
300	2022-01-25 12:50:38.101212+05:30	63	TransanctionsModel object (63)	2	[{"changed": {"fields": ["Status"]}}]	11	3
301	2022-01-25 13:58:26.180737+05:30	59	INSTAGRAM REAL FOLLOWERS WITH REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
302	2022-01-25 16:56:47.370106+05:30	34	sanjot	3		1	1
303	2022-01-25 20:08:16.623294+05:30	60	INSTAGRAM REELS VIEWS PERMANENT-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
304	2022-01-25 20:08:25.113828+05:30	59	INSTAGRAM REAL FOLLOWERS WITH REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
305	2022-01-25 20:39:04.529828+05:30	60	INSTAGRAM REELS VIEWS PERMANENT-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
306	2022-01-25 21:32:49.987537+05:30	64	TransanctionsModel object (64)	2	[{"changed": {"fields": ["Status"]}}]	11	3
307	2022-01-25 21:42:03.753791+05:30	61	INSTAGRAM REELS VIEWS PERMANENT-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
308	2022-01-25 21:42:27.083675+05:30	61	INSTAGRAM REELS VIEWS PERMANENT-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
309	2022-01-25 21:43:51.588991+05:30	1	Settings object (1)	2	[{"changed": {"fields": ["Sneaker active"]}}]	16	1
310	2022-01-25 22:20:28.848219+05:30	34	💲Instagram + Video views + Igtv + Reel	2	[{"changed": {"fields": ["Snakers id", "Snakers active"]}}]	4	3
311	2022-01-25 22:47:15.140308+05:30	15	🌱 Natural Growth Service Instagram🍁	1	[{"added": {}}]	3	1
312	2022-01-25 22:48:36.867719+05:30	35	Instagram Natural Growth Service	1	[{"added": {}}]	4	1
313	2022-01-25 22:49:34.065243+05:30	36	Natural Growth Service	1	[{"added": {}}]	4	1
314	2022-01-25 22:49:42.973058+05:30	37	Natural Growth Service	1	[{"added": {}}]	4	1
315	2022-01-25 22:53:12.871091+05:30	16	❌ Instagram Reports ❌	1	[{"added": {}}]	3	1
316	2022-01-25 22:54:01.399821+05:30	17	✔️✔️Instagram Profile Visits | Poll Votes (Story) | Highlight Views	1	[{"added": {}}]	3	1
317	2022-01-25 22:54:51.561639+05:30	18	✔️💥Instagram Direct Message And Mentions💥	1	[{"added": {}}]	3	1
318	2022-01-25 22:56:05.622878+05:30	19	Instagram Story | Impression | Saves | Reach	1	[{"added": {}}]	3	1
319	2022-01-25 23:01:43.166986+05:30	20	Instagram female followers	1	[{"added": {}}]	3	1
320	2022-01-25 23:04:17.892124+05:30	20	Instagram female followers	2	[{"changed": {"fields": ["Ranking"]}}]	3	1
321	2022-01-26 13:18:42.612814+05:30	34	💲Instagram + Video views + Igtv + Reel	2	[]	4	1
322	2022-01-26 13:20:37.968664+05:30	31	CHEAP INSTAGRAM LIKES 👍👍	2	[{"changed": {"fields": ["Snakers id", "Snakers active"]}}]	4	3
323	2022-01-26 20:41:40.446996+05:30	69	CHEAP INSTAGRAM LIKES 👍👍-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
324	2022-01-26 20:41:57.012435+05:30	68	💲Instagram + Video views + Igtv + Reel-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
325	2022-01-26 20:42:08.228998+05:30	67	CHEAP INSTAGRAM LIKES 👍👍-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
326	2022-01-26 21:06:12.419386+05:30	67	CHEAP INSTAGRAM LIKES 👍👍-Cancelled	3		10	1
327	2022-01-26 21:07:03.386005+05:30	68	💲Instagram + Video views + Igtv + Reel-Cancelled	3		10	1
328	2022-01-27 13:41:53.610621+05:30	65	TransanctionsModel object (65)	2	[{"changed": {"fields": ["Status"]}}]	11	3
329	2022-01-27 14:04:49.677656+05:30	5	Instagram real likes	2	[]	4	3
330	2022-01-27 14:05:46.161372+05:30	4	INSTAGRAM REELS VIEWS PERMANENT	2	[{"changed": {"fields": ["Snakers id", "Snakers active"]}}]	4	3
331	2022-01-27 14:12:48.669184+05:30	73	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
332	2022-01-27 14:16:18.293982+05:30	66	TransanctionsModel object (66)	2	[{"changed": {"fields": ["Status"]}}]	11	3
333	2022-01-27 14:43:06.91109+05:30	67	TransanctionsModel object (67)	2	[{"changed": {"fields": ["Status"]}}]	11	1
334	2022-01-27 14:43:44.55572+05:30	73	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
335	2022-01-27 15:13:12.462189+05:30	41	Simmi- 1000.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
336	2022-01-27 18:31:01.546272+05:30	68	TransanctionsModel object (68)	2	[{"changed": {"fields": ["Status"]}}]	11	1
337	2022-01-27 18:54:07.988975+05:30	47	INSTAGRAM REELS VIEWS PERMANENT-Test	3		10	1
338	2022-01-27 19:02:06.153987+05:30	42	Rohit- 500.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
339	2022-01-27 19:07:03.826329+05:30	43	Rohit	3		1	1
340	2022-01-27 19:08:10.910542+05:30	43	Rohit- 500.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
341	2022-01-27 20:32:28.548758+05:30	69	TransanctionsModel object (69)	2	[{"changed": {"fields": ["Status"]}}]	11	1
342	2022-01-27 21:43:18.130354+05:30	13	Sasi	2	[{"changed": {"fields": ["password"]}}]	1	1
343	2022-01-27 21:45:53.547407+05:30	14	Sasi	2	[{"changed": {"fields": ["password"]}}]	1	1
344	2022-01-27 21:48:05.579878+05:30	14	Sasi	2	[{"changed": {"fields": ["password"]}}]	1	1
345	2022-01-28 10:56:39.898288+05:30	70	TransanctionsModel object (70)	2	[{"changed": {"fields": ["Status"]}}]	11	1
346	2022-01-28 10:57:25.569563+05:30	74	TransanctionsModel object (74)	3		11	1
347	2022-01-28 10:57:25.571909+05:30	73	TransanctionsModel object (73)	3		11	1
348	2022-01-28 10:57:25.573435+05:30	72	TransanctionsModel object (72)	3		11	1
349	2022-01-28 10:57:25.575114+05:30	71	TransanctionsModel object (71)	3		11	1
350	2022-01-28 20:08:53.632876+05:30	75	TransanctionsModel object (75)	2	[{"changed": {"fields": ["Status"]}}]	11	1
351	2022-01-28 20:24:12.352779+05:30	6	TicketsModel object (6)	2	[{"changed": {"fields": ["Status"]}}, {"added": {"name": "Message", "object": "message#10"}}, {"changed": {"name": "Message", "object": "message#9", "fields": ["Message"]}}]	14	1
352	2022-01-29 09:15:19.768256+05:30	79	INSTAGRAM REAL FOLLOWERS WITH REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
353	2022-01-29 09:18:58.822941+05:30	79	INSTAGRAM REAL FOLLOWERS WITH REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
354	2022-01-29 15:16:37.058164+05:30	76	TransanctionsModel object (76)	2	[{"changed": {"fields": ["Status"]}}]	11	1
355	2022-01-29 15:38:05.202645+05:30	7	TicketsModel object (7)	2	[{"changed": {"fields": ["Subject", "Status"]}}, {"added": {"name": "Message", "object": "message#12"}}]	14	1
356	2022-01-29 16:46:43.667612+05:30	77	TransanctionsModel object (77)	2	[{"changed": {"fields": ["Status"]}}]	11	3
357	2022-01-29 18:01:55.902926+05:30	84	INSTAGRAM REAL FOLLOWERS NON REFIL-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
358	2022-01-29 21:03:41.714587+05:30	83	INSTAGRAM REAL FOLLOWERS NON REFIL-Pending	3		10	1
359	2022-01-29 21:08:49.304216+05:30	84	INSTAGRAM REAL FOLLOWERS NON REFIL-Cancelled	3		10	3
360	2022-01-29 22:01:17.963735+05:30	78	TransanctionsModel object (78)	2	[{"changed": {"fields": ["Status"]}}]	11	3
361	2022-01-29 23:00:31.333146+05:30	86	INSTAGRAM REAL FOLLOWERS WITH REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
362	2022-01-30 08:03:58.453283+05:30	79	TransanctionsModel object (79)	2	[{"changed": {"fields": ["Status"]}}]	11	1
363	2022-01-30 10:14:58.848786+05:30	86	INSTAGRAM REAL FOLLOWERS WITH REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
364	2022-01-30 10:15:38.091407+05:30	43	Rohit- 100.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
365	2022-01-30 23:04:35.694361+05:30	80	TransanctionsModel object (80)	2	[{"changed": {"fields": ["Status"]}}]	11	1
366	2022-01-30 23:05:37.244686+05:30	8	TicketsModel object (8)	2	[{"changed": {"fields": ["Subject"]}}, {"added": {"name": "Message", "object": "message#14"}}]	14	1
367	2022-01-30 23:05:45.372497+05:30	8	TicketsModel object (8)	2	[{"changed": {"fields": ["Status"]}}]	14	1
368	2022-01-31 16:09:53.766454+05:30	88	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
369	2022-01-31 21:55:09.093214+05:30	82	TransanctionsModel object (82)	2	[{"changed": {"fields": ["Status"]}}]	11	3
370	2022-01-31 22:08:26.321504+05:30	90	INSTAGRAM REAL FOLLOWERS WITH REFIL-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
371	2022-02-03 12:00:19.118448+05:30	103	INSTAGRAM REAL FOLLOWERS NON REFIL-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
372	2022-02-03 18:50:25.946275+05:30	105	INSTAGRAM REAL FOLLOWERS NON REFIL-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
373	2022-02-03 19:26:18.293891+05:30	105	INSTAGRAM REAL FOLLOWERS NON REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
374	2022-02-03 20:02:55.484586+05:30	1	Settings object (1)	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	16	1
375	2022-02-03 20:03:41.584801+05:30	81	TransanctionsModel object (81)	3		11	1
376	2022-02-03 20:05:12.324997+05:30	1	INSTAGRAM REAL FOLLOWERS WITH REFIL	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	1
377	2022-02-06 13:05:25.801742+05:30	48	balram- 1000.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
378	2022-02-06 13:45:59.536611+05:30	118	INSTAGRAM REAL FOLLOWERS NON REFIL-Pending	3		10	1
379	2022-02-06 15:27:45.564647+05:30	122	INSTAGRAM REAL FOLLOWERS WITH REFIL-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
380	2022-02-06 20:30:59.976552+05:30	124	INSTAGRAM REAL FOLLOWERS NON REFIL-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
381	2022-02-06 20:32:59.155798+05:30	48	balram- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
382	2022-02-06 21:26:37.376796+05:30	48	balram- 50.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
383	2022-02-06 21:26:47.190727+05:30	48	balram- 100.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
384	2022-02-06 21:32:42.403537+05:30	84	TransanctionsModel object (84)	2	[{"changed": {"fields": ["Status"]}}]	11	3
385	2022-02-06 21:32:59.98535+05:30	83	TransanctionsModel object (83)	2	[{"changed": {"fields": ["Status"]}}]	11	3
386	2022-02-06 22:14:26.989063+05:30	125	INSTAGRAM REAL FOLLOWERS NON REFIL-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
387	2022-02-06 22:56:39.147457+05:30	41	Simmi- 1000.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
388	2022-02-06 23:35:09.660375+05:30	127	INSTAGRAM REAL FOLLOWERS WITH REFIL-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
389	2022-02-07 15:55:48.702279+05:30	48	balram- 50.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
390	2022-02-08 16:55:36.520822+05:30	1	Instagram Followers With Refill Guarantee 🙋🙋🔥	2	[{"changed": {"fields": ["Name"]}}]	3	3
391	2022-02-08 16:59:44.83314+05:30	38	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]	1	[{"added": {}}]	4	3
392	2022-02-08 17:09:08.112234+05:30	39	🇮🇳✨1 Year Refill || Instagram Followers || Stable	1	[{"added": {}}]	4	3
393	2022-02-08 17:13:37.298432+05:30	40	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	1	[{"added": {}}]	4	3
394	2022-02-08 17:14:35.404295+05:30	41	Instagram Followers - 2 year REFILL ♻️[ HQ ] [ 💎Drop - 5% Only ] [ Never drop ] Start: 0-3hr] Stable Lifetime	1	[{"added": {}}]	4	3
395	2022-02-08 17:15:59.89176+05:30	41	Instagram Followers - 2 year REFILL ♻️[ HQ ] [ 💎Drop - 5% Only ] [ Never drop ] Start: 0-3hr] Stable Lifetime	2	[{"changed": {"fields": ["Description"]}}]	4	3
396	2022-02-08 17:20:47.768144+05:30	42	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	1	[{"added": {}}]	4	3
397	2022-02-08 17:21:40.188385+05:30	43	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	1	[{"added": {}}]	4	3
398	2022-02-08 17:22:29.484262+05:30	44	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	1	[{"added": {}}]	4	3
399	2022-02-08 17:23:14.316683+05:30	45	Instagram Followers | Indian Mix | Good Quality | Low Drop | R100♻️ | 1M | 20-40K Per Day(Recommended)	1	[{"added": {}}]	4	3
400	2022-02-08 18:49:51.334794+05:30	21	👨Instagram Followers [ No Refill ] not garrented	1	[{"added": {}}]	3	3
401	2022-02-08 18:53:53.522039+05:30	46	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]	1	[{"added": {}}]	4	3
402	2022-02-08 18:55:08.179924+05:30	47	◼ Instagram Followers [Real Look] [Nice Quality] [5-10K/D] [Instant]	1	[{"added": {}}]	4	3
403	2022-02-08 18:56:32.5481+05:30	48	◼ Instagram Followers [Mix] [Nice Quality] [1-2K/D] [0-1/H]	1	[{"added": {}}]	4	3
404	2022-02-08 18:58:23.116438+05:30	49	Instagram Followers | Fastest | MAX 10K ⚡️	1	[{"added": {}}]	4	3
405	2022-02-09 14:02:27.837245+05:30	21	👨Instagram Followers [ No Refill ] not garrented	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
406	2022-02-09 14:06:17.328975+05:30	14	Free Service 💥💥🔥🔥🔥🔥🔥	3		3	1
407	2022-02-09 14:06:36.115227+05:30	1	Instagram Followers With Refill Guarantee 🙋🙋🔥	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
408	2022-02-09 14:50:16.959467+05:30	3	INSTAGRAM LIKES 👍👍	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
409	2022-02-09 14:50:25.523711+05:30	20	Instagram female followers	3		3	3
410	2022-02-09 14:50:31.410261+05:30	3	INSTAGRAM LIKES 👍👍	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
411	2022-02-09 14:50:41.567865+05:30	2	INSTAGRAM REELS VIEWS 💥💥✨	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
412	2022-02-09 14:52:19.153969+05:30	3	💖 Instagram Likes { 𝙃𝙄𝙂𝙃 𝙌𝙐𝘼𝙇𝙄𝙏𝙔 }💖	2	[{"changed": {"fields": ["Name"]}}]	3	3
413	2022-02-09 14:55:39.374105+05:30	50	◾ ❤️𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Likes | Mix Users | High Quality | No Drop | 15K | 3K-5K Per Day	1	[{"added": {}}]	4	3
414	2022-02-09 14:56:32.93781+05:30	51	👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]	1	[{"added": {}}]	4	3
415	2022-02-09 14:57:51.725143+05:30	52	◾ 💎 Instagram Likes | Indian Real Users | High Quality 100% Indian | 10K | Fast ⚡Best In Market[recommended]	1	[{"added": {}}]	4	3
416	2022-02-09 14:59:13.799961+05:30	53	🎊 🇮🇳 Instagram HQ Likes [Real Indian with Stories]🔥👌NON DROP👌🔥 [ Story✔ [Active ✔ [Speed :20k/D [ Start 0-15min ]	1	[{"added": {}}]	4	3
417	2022-02-09 15:01:31.625569+05:30	54	💎Instagram Likes [🇮🇳 Real India 🇮🇳] Natural Speed | 500-5k Per Hour | 0-30M Start	1	[{"added": {}}]	4	3
418	2022-02-09 15:02:13.796431+05:30	55	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]	1	[{"added": {}}]	4	3
419	2022-02-09 15:02:52.733865+05:30	51	Ravinder	3		1	3
420	2022-02-09 15:03:07.869692+05:30	28	aiyyu	3		1	3
421	2022-02-09 15:04:33.122563+05:30	56	💎⚡🔥 𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Power Likes [Non Drop] R30	1	[{"added": {}}]	4	3
422	2022-02-09 15:06:54.042805+05:30	57	Instagram Reel Views [Non Drop] No Refill 💧 ✪[working]	1	[{"added": {}}]	4	3
423	2022-02-09 15:07:13.25959+05:30	57	Instagram Reel Views [Non Drop] No Refill 💧 ✪[working]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
424	2022-02-09 15:08:15.751577+05:30	58	💲Instagram + Video views + Igtv + Reel [working] - (SUPER FAST⚡)	1	[{"added": {}}]	4	3
425	2022-02-09 15:10:09.806694+05:30	59	Instagram Reel Views [Non Drop]  💜💜🥰💥	1	[{"added": {}}]	4	3
426	2022-02-09 15:13:17.708525+05:30	60	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️	1	[{"added": {}}]	4	3
427	2022-02-09 16:39:12.855225+05:30	22	💲💝Cheapest Instagram Likes💝💲 [ Not Guaranteed ]	1	[{"added": {}}]	3	3
428	2022-02-09 16:40:18.722286+05:30	61	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	1	[{"added": {}}]	4	3
429	2022-02-09 16:41:12.980972+05:30	62	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	1	[{"added": {}}]	4	3
487	2022-02-12 16:23:52.970029+05:30	83	TransanctionsModel object (83)	3		11	1
430	2022-02-09 16:41:40.636011+05:30	63	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	1	[{"added": {}}]	4	3
431	2022-02-09 16:42:12.581386+05:30	61	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
432	2022-02-09 16:42:25.620974+05:30	63	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
433	2022-02-09 16:42:42.743548+05:30	62	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
434	2022-02-09 16:44:19.174588+05:30	60	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
435	2022-02-09 16:44:48.939278+05:30	59	Instagram Reel Views [Non Drop]  💜💜🥰💥	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
436	2022-02-09 16:45:23.080703+05:30	58	💲Instagram + Video views + Igtv + Reel [working] - (SUPER FAST⚡)	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
437	2022-02-09 16:46:00.990201+05:30	57	Instagram Reel Views [Non Drop] 💧 ✪[working]	2	[{"changed": {"fields": ["Name", "Sasta id"]}}]	4	3
438	2022-02-09 16:52:41.064779+05:30	4	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also	2	[{"changed": {"fields": ["Name", "Sasta id", "Sasta active"]}}]	4	3
439	2022-02-10 15:47:00.224092+05:30	1	INSTAGRAM REAL FOLLOWERS WITH REFIL	2	[{"changed": {"fields": ["Active"]}}]	4	3
440	2022-02-10 15:47:09.712394+05:30	3	INSTAGRAM REAL FOLLOWERS NON REFIL	2	[{"changed": {"fields": ["Active"]}}]	4	3
441	2022-02-10 15:48:02.985598+05:30	64	mm	1	[{"added": {}}]	4	1
442	2022-02-10 15:48:08.017944+05:30	64	mm	3		4	1
443	2022-02-10 16:10:23.775599+05:30	86	TransanctionsModel object (86)	2	[{"changed": {"fields": ["Status"]}}]	11	3
444	2022-02-10 16:51:24.564389+05:30	85	TransanctionsModel object (85)	3		11	3
445	2022-02-10 16:51:59.559028+05:30	87	TransanctionsModel object (87)	2	[{"changed": {"fields": ["Status"]}}]	11	3
446	2022-02-10 17:00:41.416706+05:30	1	Settings object (1)	2	[{"changed": {"fields": ["Whatsapp no"]}}]	16	1
447	2022-02-10 18:29:56.892598+05:30	92	TransanctionsModel object (92)	2	[{"changed": {"fields": ["Status"]}}]	11	3
448	2022-02-10 19:01:48.866854+05:30	147	Instagram Natural Growth Service-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
449	2022-02-10 19:03:51.971096+05:30	147	Instagram Natural Growth Service-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
450	2022-02-10 19:04:11.305462+05:30	15	🌱 Natural Growth Service Instagram🍁	2	[{"changed": {"fields": ["Active"]}}]	3	3
451	2022-02-10 19:09:20.472846+05:30	22	💲💝Cheapest Instagram Likes💝💲 [ Not Guaranteed ]	2	[]	3	3
452	2022-02-10 19:11:24.905057+05:30	63	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[{"changed": {"fields": ["Min order", "Max order", "Rate"]}}]	4	3
453	2022-02-10 19:11:43.649945+05:30	61	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	2	[{"changed": {"fields": ["Rate"]}}]	4	3
454	2022-02-10 19:13:28.59368+05:30	62	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	2	[{"changed": {"fields": ["Name"]}}]	4	3
455	2022-02-10 19:15:11.409855+05:30	48	◼ Instagram Followers [Mix] [Nice Quality] [1-2K/D] [0-1/H]	2	[{"changed": {"fields": ["Rate"]}}]	4	3
456	2022-02-10 19:21:38.299303+05:30	2	INSTAGRAM REELS VIEWS 💥💥✨	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
457	2022-02-10 19:21:44.877089+05:30	22	💲💝Cheapest Instagram Likes💝💲 [ Not Guaranteed ]	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
458	2022-02-10 19:31:05.521393+05:30	23	👸👸 Instagram female followers👸👸	1	[{"added": {}}]	3	3
459	2022-02-10 19:33:49.993033+05:30	65	👸 Instagram female followers👸👸 | Max 100K { 60 day Reffil} Instant start 🔥	1	[{"added": {}}]	4	3
460	2022-02-10 19:34:27.789779+05:30	65	👸 Instagram female followers👸👸 | Max 100K { 60 day Reffil} Instant start 🔥	2	[{"changed": {"fields": ["Description"]}}]	4	3
461	2022-02-10 19:35:05.850299+05:30	65	👸 Instagram female followers👸👸 | Max 100K { 60 day Reffil} Instant start 🔥	2	[{"changed": {"fields": ["Snakers id", "Snakers active"]}}]	4	3
462	2022-02-10 19:36:03.018801+05:30	23	👸👸 Instagram female followers👸👸	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
463	2022-02-10 22:18:30.549221+05:30	93	TransanctionsModel object (93)	2	[{"changed": {"fields": ["Status"]}}]	11	3
464	2022-02-10 22:21:51.772041+05:30	151	Instagram Followers - 2 year REFILL ♻️[ HQ ] [ 💎Drop - 5% Only ] [ Never drop ] Start: 0-3hr] Stable Lifetime-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
465	2022-02-10 22:36:26.004008+05:30	153	🇮🇳✨1 Year Refill || Instagram Followers || Stable-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
466	2022-02-10 22:43:09.575037+05:30	41	Instagram Followers - 2 year REFILL ♻️[ HQ ] [ 💎Drop - 5% Only ] [ Never drop ] Start: 0-3hr] Stable Lifetime	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
467	2022-02-10 22:45:27.841085+05:30	95	TransanctionsModel object (95)	2	[{"changed": {"fields": ["Status"]}}]	11	3
468	2022-02-10 22:49:20.373068+05:30	154	🇮🇳✨1 Year Refill || Instagram Followers || Stable-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
469	2022-02-10 23:05:35.760182+05:30	155	🇮🇳✨1 Year Refill || Instagram Followers || Stable-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
470	2022-02-11 16:12:00.020156+05:30	13	Sasi	2	[{"changed": {"fields": ["password"]}}]	1	3
471	2022-02-11 16:21:33.302181+05:30	13	Sasi	2	[{"changed": {"fields": ["password"]}}]	1	3
472	2022-02-11 16:28:54.362456+05:30	14	Sasi	2	[{"changed": {"fields": ["password"]}}]	1	1
473	2022-02-11 19:40:17.609075+05:30	96	TransanctionsModel object (96)	2	[{"changed": {"fields": ["Status"]}}]	11	3
474	2022-02-12 12:34:49.160825+05:30	101	TransanctionsModel object (101)	2	[{"changed": {"fields": ["Status"]}}]	11	3
475	2022-02-12 13:10:53.896322+05:30	100	TransanctionsModel object (100)	2	[{"changed": {"fields": ["Status"]}}]	11	3
476	2022-02-12 13:29:46.416483+05:30	48	balram- 5.5 Rs 	2	[]	2	3
477	2022-02-12 16:23:16.84276+05:30	101	TransanctionsModel object (101)	3		11	1
478	2022-02-12 16:23:16.845407+05:30	99	TransanctionsModel object (99)	3		11	1
479	2022-02-12 16:23:16.846905+05:30	98	TransanctionsModel object (98)	3		11	1
480	2022-02-12 16:23:16.848539+05:30	97	TransanctionsModel object (97)	3		11	1
481	2022-02-12 16:23:16.8501+05:30	96	TransanctionsModel object (96)	3		11	1
482	2022-02-12 16:23:43.979905+05:30	94	TransanctionsModel object (94)	3		11	1
483	2022-02-12 16:23:43.982055+05:30	91	TransanctionsModel object (91)	3		11	1
484	2022-02-12 16:23:43.983676+05:30	90	TransanctionsModel object (90)	3		11	1
485	2022-02-12 16:23:43.985304+05:30	89	TransanctionsModel object (89)	3		11	1
488	2022-02-13 00:49:40.86753+05:30	143	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
489	2022-02-13 14:21:42.89959+05:30	162	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
490	2022-02-13 14:34:52.73915+05:30	30	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳	2	[{"changed": {"fields": ["Rate"]}}]	4	3
491	2022-02-13 14:38:14.202588+05:30	47	◼ Instagram Followers [Real Look] [Nice Quality] [5-10K/D] [Instant]	2	[{"changed": {"fields": ["Rate"]}}]	4	3
492	2022-02-13 14:46:58.027638+05:30	5	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑	2	[{"changed": {"fields": ["Name", "Snakers id", "Snakers active"]}}]	4	3
493	2022-02-13 14:48:07.755249+05:30	31	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]🔥🔥👑👑	2	[{"changed": {"fields": ["Name", "Snakers id", "Snakers active"]}}]	4	3
494	2022-02-13 14:52:37.852049+05:30	66	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	1	[{"added": {}}]	4	3
495	2022-02-13 16:29:42.231003+05:30	66	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
496	2022-02-13 16:29:59.097822+05:30	63	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[]	4	3
497	2022-02-13 16:30:31.660752+05:30	56	💎⚡🔥 𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Power Likes [Non Drop] R30	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
498	2022-02-13 16:30:50.824491+05:30	55	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
499	2022-02-13 16:31:06.020827+05:30	54	💎Instagram Likes [🇮🇳 Real India 🇮🇳] Natural Speed | 500-5k Per Hour | 0-30M Start	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
500	2022-02-13 16:32:30.136872+05:30	53	🎊 🇮🇳 Instagram HQ Likes [Real Indian with Stories]🔥👌NON DROP👌🔥 [ Story✔ [Active ✔ [Speed :20k/D [ Start 0-15min ]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
501	2022-02-13 16:32:46.501087+05:30	52	◾ 💎 Instagram Likes | Indian Real Users | High Quality 100% Indian | 10K | Fast ⚡Best In Market[recommended]	2	[{"changed": {"fields": ["Sasta id"]}}]	4	3
502	2022-02-13 16:33:48.737912+05:30	51	👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
503	2022-02-13 16:35:03.419035+05:30	55	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]	2	[{"changed": {"fields": ["Rate"]}}]	4	3
504	2022-02-13 16:35:31.822602+05:30	52	◾ 💎 Instagram Likes | Indian Real Users | High Quality 100% Indian | 10K | Fast ⚡Best In Market[recommended]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
505	2022-02-13 16:36:16.359263+05:30	51	👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]	2	[]	4	3
506	2022-02-13 16:36:40.65809+05:30	50	◾ ❤️𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Likes | Mix Users | High Quality | No Drop | 15K | 3K-5K Per Day	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
507	2022-02-13 19:10:41.72592+05:30	49	Instagram Followers | Fastest | MAX 10K ⚡️	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
508	2022-02-13 19:11:03.530089+05:30	48	◼ Instagram Followers [Mix] [Nice Quality] [1-2K/D] [0-1/H]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
509	2022-02-13 19:11:22.348632+05:30	47	◼ Instagram Followers [Real Look] [Nice Quality] [5-10K/D] [Instant]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
510	2022-02-13 19:11:51.332561+05:30	46	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
511	2022-02-13 19:12:24.25272+05:30	45	Instagram Followers | Indian Mix | Good Quality | Low Drop | R100♻️ | 1M | 20-40K Per Day(Recommended)	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
512	2022-02-13 19:12:37.382491+05:30	44	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
513	2022-02-13 19:12:48.852798+05:30	42	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
514	2022-02-13 19:13:07.329575+05:30	40	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
515	2022-02-13 19:13:24.775253+05:30	43	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
516	2022-02-13 19:13:51.289379+05:30	39	🇮🇳✨1 Year Refill || Instagram Followers || Stable	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
517	2022-02-13 19:19:14.172757+05:30	31	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]🔥🔥👑👑	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
518	2022-02-13 19:20:10.054384+05:30	34	💲Instagram + Video views + Igtv + Reel	2	[{"changed": {"fields": ["Sasta id", "Sasta active", "Snakers id", "Snakers active"]}}]	4	3
519	2022-02-13 19:21:38.864439+05:30	32	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
520	2022-02-13 19:22:14.562092+05:30	30	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳	2	[{"changed": {"fields": ["Sasta id", "Sasta active"]}}]	4	3
521	2022-02-13 19:22:51.245391+05:30	4	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also	2	[{"changed": {"fields": ["Snakers id", "Snakers active"]}}]	4	3
522	2022-02-13 19:24:27.825788+05:30	40	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	2	[{"changed": {"fields": ["Rate"]}}]	4	3
523	2022-02-13 19:30:24.077911+05:30	5	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑	2	[{"changed": {"fields": ["Rate", "Sasta id", "Sasta active"]}}]	4	3
524	2022-02-14 20:18:54.780935+05:30	102	TransanctionsModel object (102)	2	[{"changed": {"fields": ["Status"]}}]	11	3
525	2022-02-14 20:38:17.540096+05:30	105	TransanctionsModel object (105)	2	[{"changed": {"fields": ["Status"]}}]	11	3
526	2022-02-14 20:43:31.94277+05:30	106	TransanctionsModel object (106)	2	[{"changed": {"fields": ["Status"]}}]	11	3
527	2022-02-14 21:04:05.4308+05:30	108	TransanctionsModel object (108)	2	[{"changed": {"fields": ["Status"]}}]	11	3
528	2022-02-14 21:26:12.558732+05:30	110	TransanctionsModel object (110)	2	[{"changed": {"fields": ["Status"]}}]	11	3
529	2022-02-15 11:21:45.877778+05:30	111	TransanctionsModel object (111)	2	[{"changed": {"fields": ["Status"]}}]	11	3
530	2022-02-15 11:49:15.806136+05:30	112	TransanctionsModel object (112)	2	[{"changed": {"fields": ["Status"]}}]	11	3
531	2022-02-15 12:31:24.693462+05:30	113	TransanctionsModel object (113)	2	[{"changed": {"fields": ["Status"]}}]	11	3
532	2022-02-15 13:09:07.813759+05:30	1	Settings object (1)	2	[{"changed": {"fields": ["Whatsapp no"]}}]	16	1
533	2022-02-15 17:44:26.810298+05:30	109	TransanctionsModel object (109)	3		11	1
534	2022-02-15 17:44:26.812713+05:30	107	TransanctionsModel object (107)	3		11	1
535	2022-02-15 17:44:26.814303+05:30	104	TransanctionsModel object (104)	3		11	1
536	2022-02-15 17:44:26.815855+05:30	103	TransanctionsModel object (103)	3		11	1
537	2022-02-15 18:39:17.59349+05:30	182	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
538	2022-02-15 18:40:15.728555+05:30	185	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
539	2022-02-15 18:41:20.19147+05:30	184	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
540	2022-02-15 18:42:01.715869+05:30	183	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
541	2022-02-15 18:52:38.153833+05:30	114	TransanctionsModel object (114)	2	[{"changed": {"fields": ["Status"]}}]	11	3
542	2022-02-15 19:03:33.46124+05:30	186	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
543	2022-02-15 19:03:42.239984+05:30	185	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
544	2022-02-15 19:03:53.634145+05:30	184	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
545	2022-02-15 19:04:04.315539+05:30	183	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
546	2022-02-15 19:04:16.800564+05:30	182	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
547	2022-02-15 19:32:06.170433+05:30	51	👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]	2	[{"changed": {"fields": ["Sasta id"]}}]	4	3
548	2022-02-15 20:50:44.340458+05:30	115	TransanctionsModel object (115)	2	[{"changed": {"fields": ["Status"]}}]	11	3
549	2022-02-16 19:40:18.363782+05:30	116	TransanctionsModel object (116)	2	[{"changed": {"fields": ["Status"]}}]	11	3
550	2022-02-16 19:56:41.955551+05:30	190	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
551	2022-02-16 19:57:48.588904+05:30	117	TransanctionsModel object (117)	2	[{"changed": {"fields": ["Status"]}}]	11	3
552	2022-02-17 13:49:19.503918+05:30	118	TransanctionsModel object (118)	2	[{"changed": {"fields": ["Status"]}}]	11	3
553	2022-02-17 15:29:27.266967+05:30	119	TransanctionsModel object (119)	2	[{"changed": {"fields": ["Status"]}}]	11	3
554	2022-02-17 18:29:54.320962+05:30	197	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
555	2022-02-17 22:32:10.454232+05:30	120	TransanctionsModel object (120)	2	[{"changed": {"fields": ["Status"]}}]	11	3
556	2022-02-17 22:38:13.443166+05:30	199	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
557	2022-02-17 22:42:13.237999+05:30	201	◾ ❤️𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Likes | Mix Users | High Quality | No Drop | 15K | 3K-5K Per Day-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
558	2022-02-17 22:43:04.130155+05:30	200	◾ ❤️𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Likes | Mix Users | High Quality | No Drop | 15K | 3K-5K Per Day-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
559	2022-02-18 17:29:29.037926+05:30	18	mrbi	3		1	3
560	2022-02-19 12:40:46.669793+05:30	159	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
561	2022-02-19 21:55:50.718156+05:30	123	TransanctionsModel object (123)	2	[{"changed": {"fields": ["Status"]}}]	11	3
562	2022-02-20 15:04:21.152914+05:30	210	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
563	2022-02-20 15:04:29.83775+05:30	209	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
564	2022-02-20 15:05:26.247461+05:30	208	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
565	2022-02-20 15:05:51.514908+05:30	207	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
566	2022-02-20 19:19:53.443144+05:30	125	TransanctionsModel object (125)	2	[{"changed": {"fields": ["Status"]}}]	11	3
567	2022-02-20 19:29:02.733526+05:30	214	◼ Instagram Followers [Real Look] [Nice Quality] [5-10K/D] [Instant]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
568	2022-02-21 20:49:37.657182+05:30	113	aiyyu- 200.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
569	2022-02-21 20:51:27.406104+05:30	60	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️	2	[{"changed": {"fields": ["Rate"]}}]	4	3
570	2022-02-23 19:08:49.066934+05:30	45	Instagram Followers | Indian Mix | Good Quality | Low Drop | R100♻️ | 1M | 20-40K Per Day(Recommended)	2	[{"changed": {"fields": ["Service id"]}}]	4	3
571	2022-02-23 19:09:10.417974+05:30	44	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	2	[{"changed": {"fields": ["Service id"]}}]	4	3
572	2022-02-23 19:09:44.203258+05:30	43	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
573	2022-02-23 19:11:54.043189+05:30	43	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	2	[]	4	3
574	2022-02-23 19:12:14.211735+05:30	42	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
575	2022-02-23 19:12:29.814941+05:30	41	Instagram Followers - 2 year REFILL ♻️[ HQ ] [ 💎Drop - 5% Only ] [ Never drop ] Start: 0-3hr] Stable Lifetime	2	[{"changed": {"fields": ["Service id"]}}]	4	3
576	2022-02-23 19:12:53.041009+05:30	40	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	2	[{"changed": {"fields": ["Service id"]}}]	4	3
577	2022-02-23 19:39:33.538756+05:30	45	Instagram Followers | Indian Mix | Good Quality | Low Drop | R100♻️ | 1M | 20-40K Per Day(Recommended)	2	[{"changed": {"fields": ["Service id"]}}]	4	3
578	2022-02-23 19:40:28.252952+05:30	38	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
579	2022-02-23 19:41:11.696861+05:30	44	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	2	[{"changed": {"fields": ["Service id"]}}]	4	3
580	2022-02-23 19:41:29.478554+05:30	43	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
581	2022-02-23 19:41:44.343921+05:30	41	Instagram Followers - 2 year REFILL ♻️[ HQ ] [ 💎Drop - 5% Only ] [ Never drop ] Start: 0-3hr] Stable Lifetime	2	[{"changed": {"fields": ["Service id"]}}]	4	3
582	2022-02-23 19:41:54.730204+05:30	42	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
583	2022-02-23 19:42:22.882742+05:30	40	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	2	[{"changed": {"fields": ["Service id"]}}]	4	3
584	2022-02-23 19:42:40.576876+05:30	39	🇮🇳✨1 Year Refill || Instagram Followers || Stable	2	[{"changed": {"fields": ["Service id"]}}]	4	3
585	2022-02-23 19:43:23.402703+05:30	38	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]	2	[]	4	3
586	2022-02-23 19:55:30.081595+05:30	30	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳	2	[{"changed": {"fields": ["Service id"]}}]	4	3
587	2022-02-23 19:55:46.298209+05:30	45	Instagram Followers | Indian Mix | Good Quality | Low Drop | R100♻️ | 1M | 20-40K Per Day(Recommended)	2	[]	4	3
588	2022-02-23 19:56:05.363275+05:30	31	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]🔥🔥👑👑	2	[{"changed": {"fields": ["Service id"]}}]	4	3
589	2022-02-23 20:00:16.295451+05:30	49	Instagram Followers | Fastest | MAX 10K ⚡️	2	[{"changed": {"fields": ["Service id"]}}]	4	3
590	2022-02-23 20:00:26.115101+05:30	48	◼ Instagram Followers [Mix] [Nice Quality] [1-2K/D] [0-1/H]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
591	2022-02-23 20:00:33.480335+05:30	47	◼ Instagram Followers [Real Look] [Nice Quality] [5-10K/D] [Instant]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
592	2022-02-23 20:03:20.683845+05:30	46	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
593	2022-02-23 20:05:29.859133+05:30	66	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
594	2022-02-23 20:05:50.39312+05:30	66	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[{"changed": {"fields": ["Rate"]}}]	4	3
595	2022-02-23 20:06:13.944109+05:30	63	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
596	2022-02-23 20:06:36.728916+05:30	62	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
597	2022-02-23 20:06:57.744667+05:30	61	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
598	2022-02-23 20:07:08.436565+05:30	61	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	2	[]	4	3
599	2022-02-23 20:11:41.240395+05:30	67	🇮🇳 ❤️ Instagram POST+REEL+IGTV Likes ~ Indian 𝗥𝗘𝗔𝗟 Users | High Quality || 10K-50k/Day || SuperFast🔥[Recommended]	1	[{"added": {}}]	4	3
600	2022-02-23 20:14:15.894754+05:30	60	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️	2	[{"changed": {"fields": ["Service id"]}}]	4	3
601	2022-02-23 20:14:49.780751+05:30	59	Instagram Reel Views [Non Drop]  💜💜🥰💥	2	[{"changed": {"fields": ["Service id"]}}]	4	3
602	2022-02-23 20:14:59.871026+05:30	58	💲Instagram + Video views + Igtv + Reel [working] - (SUPER FAST⚡)	2	[{"changed": {"fields": ["Service id"]}}]	4	3
603	2022-02-23 20:15:08.290146+05:30	59	Instagram Reel Views [Non Drop]  💜💜🥰💥	2	[]	4	3
604	2022-02-23 20:15:22.321711+05:30	57	Instagram Reel Views [Non Drop] 💧 ✪[working]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
605	2022-02-23 20:15:35.080499+05:30	59	Instagram Reel Views [Non Drop]  💜💜🥰💥	2	[]	4	3
606	2022-02-23 20:16:14.242848+05:30	57	Instagram Reel Views [Non Drop] 💧 ✪[working]	2	[]	4	3
607	2022-02-23 20:21:51.235546+05:30	32	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
608	2022-02-24 18:10:43.496912+05:30	1	Offers object (1)	1	[{"added": {}}]	18	1
609	2022-02-24 19:11:25.627+05:30	131	TransanctionsModel object (131)	2	[{"changed": {"fields": ["Status"]}}]	11	1
610	2022-02-24 19:12:11.21012+05:30	132	TransanctionsModel object (132)	3		11	1
611	2022-02-24 19:12:11.212234+05:30	130	TransanctionsModel object (130)	3		11	1
612	2022-02-24 19:12:11.213913+05:30	129	TransanctionsModel object (129)	3		11	1
613	2022-02-24 19:12:11.215373+05:30	128	TransanctionsModel object (128)	3		11	1
614	2022-02-24 19:12:11.216906+05:30	127	TransanctionsModel object (127)	3		11	1
615	2022-02-24 19:13:37.672324+05:30	232	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
616	2022-02-24 19:13:46.155047+05:30	233	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
617	2022-02-24 19:19:57.941016+05:30	133	Kumar- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
618	2022-02-24 19:31:46.832727+05:30	236	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
619	2022-02-24 19:39:34.070899+05:30	243	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
620	2022-02-24 19:39:34.073403+05:30	242	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
621	2022-02-24 19:39:34.074874+05:30	241	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
622	2022-02-24 19:39:34.076364+05:30	240	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
623	2022-02-24 19:39:34.077774+05:30	239	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
624	2022-02-24 19:39:34.079169+05:30	238	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
783	2022-03-05 22:48:35.629268+05:30	166	TransanctionsModel object (166)	2	[{"changed": {"fields": ["Status"]}}]	11	3
625	2022-02-24 19:39:34.080764+05:30	237	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
626	2022-02-24 19:39:34.082903+05:30	236	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Processing	3		10	1
627	2022-02-24 19:39:34.084393+05:30	235	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
628	2022-02-24 19:39:34.085881+05:30	234	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
629	2022-02-24 19:39:34.087201+05:30	233	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Processing	3		10	1
630	2022-02-24 19:43:26.150071+05:30	245	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
631	2022-02-24 19:44:10.95199+05:30	245	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Completed	3		10	1
632	2022-02-24 19:44:10.954096+05:30	244	INSTAGRAM REAL FOLLOWERS WITH REFIL-Pending	3		10	1
633	2022-02-24 19:58:45.062673+05:30	1	The Royal SMM	1	[{"added": {}}]	17	1
634	2022-02-24 19:59:22.665543+05:30	67	🇮🇳 ❤️ Instagram POST+REEL+IGTV Likes ~ Indian 𝗥𝗘𝗔𝗟 Users | High Quality || 10K-50k/Day || SuperFast🔥[Recommended]	2	[{"changed": {"fields": ["Api"]}}]	4	1
635	2022-02-24 19:59:34.60681+05:30	66	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[{"changed": {"fields": ["Api"]}}]	4	1
636	2022-02-25 10:44:20.932694+05:30	134	TransanctionsModel object (134)	3		11	1
637	2022-02-25 10:44:20.937985+05:30	133	TransanctionsModel object (133)	3		11	1
638	2022-02-25 15:04:01.007025+05:30	246	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	1
639	2022-02-25 15:39:53.940717+05:30	2	Offers object (2)	1	[{"added": {}}]	18	1
640	2022-02-25 20:02:53.587352+05:30	135	TransanctionsModel object (135)	2	[{"changed": {"fields": ["Status"]}}]	11	1
641	2022-02-25 21:00:02.572493+05:30	1	The Royal SMM	2	[{"changed": {"fields": ["Api key"]}}]	17	1
642	2022-02-25 21:07:44.185666+05:30	248	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
643	2022-02-25 21:07:44.188138+05:30	247	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
644	2022-02-26 12:42:21.209537+05:30	140	TransanctionsModel object (140)	2	[{"changed": {"fields": ["Status"]}}]	11	1
645	2022-02-26 12:44:03.980563+05:30	249	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
646	2022-02-26 12:50:02.687573+05:30	38	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]	2	[{"changed": {"fields": ["Api"]}}]	4	1
647	2022-02-26 13:36:09.620666+05:30	250	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-Pending	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
648	2022-02-26 13:52:28.809189+05:30	252	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
649	2022-02-26 14:07:58.977374+05:30	253	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
650	2022-02-26 14:07:58.980002+05:30	251	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-Completed	3		10	1
651	2022-02-26 14:16:14.577259+05:30	250	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-Pending	2	[]	10	1
652	2022-02-26 14:18:11.123951+05:30	254	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
653	2022-02-26 14:47:05.438101+05:30	250	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	1
654	2022-02-26 14:49:28.505315+05:30	250	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
655	2022-02-26 14:49:58.162017+05:30	231	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️-Pending	3		10	1
656	2022-02-26 14:49:58.164355+05:30	230	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Pending	3		10	1
657	2022-02-26 14:50:18.615593+05:30	226	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Pending	3		10	1
658	2022-02-26 14:50:18.618128+05:30	225	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-Pending	3		10	1
659	2022-02-26 19:09:24.733045+05:30	256	INSTAGRAM REAL FOLLOWERS WITH REFIL-Pending	2	[{"changed": {"fields": ["User"]}}]	10	1
660	2022-02-26 19:09:30.320761+05:30	256	INSTAGRAM REAL FOLLOWERS WITH REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
661	2022-02-26 19:10:04.162458+05:30	256	INSTAGRAM REAL FOLLOWERS WITH REFIL-Processing	2	[{"changed": {"fields": ["User"]}}]	10	1
662	2022-02-26 19:11:00.984971+05:30	255	INSTAGRAM REAL FOLLOWERS WITH REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
663	2022-02-26 19:19:01.659186+05:30	255	INSTAGRAM REAL FOLLOWERS WITH REFIL-Processing	2	[{"changed": {"fields": ["User"]}}]	10	1
664	2022-02-26 19:19:26.045259+05:30	135	Sanam - 502.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
665	2022-02-26 21:25:31.674954+05:30	257	INSTAGRAM REAL FOLLOWERS WITH REFIL-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	1
666	2022-02-26 21:34:01.075939+05:30	255	INSTAGRAM REAL FOLLOWERS WITH REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
667	2022-02-26 21:34:08.798671+05:30	257	INSTAGRAM REAL FOLLOWERS WITH REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
668	2022-02-26 21:34:18.479074+05:30	256	INSTAGRAM REAL FOLLOWERS WITH REFIL-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
669	2022-02-26 21:34:30.444663+05:30	246	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
670	2022-02-26 21:37:26.445818+05:30	139	TransanctionsModel object (139)	2	[{"changed": {"fields": ["Status"]}}]	11	1
671	2022-02-26 22:14:30.493124+05:30	141	TransanctionsModel object (141)	2	[{"changed": {"fields": ["Status"]}}]	11	1
672	2022-02-26 22:28:41.543429+05:30	62	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	2	[{"changed": {"fields": ["Api"]}}]	4	1
673	2022-02-26 22:29:09.76428+05:30	61	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	2	[{"changed": {"fields": ["Api"]}}]	4	1
674	2022-02-26 22:31:29.832771+05:30	30	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳	2	[{"changed": {"fields": ["Api"]}}]	4	1
675	2022-02-26 22:31:40.070999+05:30	60	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️	2	[{"changed": {"fields": ["Api"]}}]	4	1
676	2022-02-26 22:31:50.107586+05:30	59	Instagram Reel Views [Non Drop]  💜💜🥰💥	2	[{"changed": {"fields": ["Api"]}}]	4	1
677	2022-02-26 22:32:03.486416+05:30	58	💲Instagram + Video views + Igtv + Reel [working] - (SUPER FAST⚡)	2	[{"changed": {"fields": ["Api"]}}]	4	1
678	2022-02-26 22:32:14.622147+05:30	57	Instagram Reel Views [Non Drop] 💧 ✪[working]	2	[{"changed": {"fields": ["Api"]}}]	4	1
679	2022-02-26 22:33:09.737808+05:30	49	Instagram Followers | Fastest | MAX 10K ⚡️	2	[{"changed": {"fields": ["Api"]}}]	4	1
680	2022-02-26 22:33:21.532134+05:30	48	◼ Instagram Followers [Mix] [Nice Quality] [1-2K/D] [0-1/H]	2	[{"changed": {"fields": ["Api"]}}]	4	1
681	2022-02-26 22:33:39.223528+05:30	47	◼ Instagram Followers [Real Look] [Nice Quality] [5-10K/D] [Instant]	2	[{"changed": {"fields": ["Api"]}}]	4	1
682	2022-02-26 22:33:57.356582+05:30	46	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]	2	[{"changed": {"fields": ["Api"]}}]	4	1
683	2022-02-26 22:34:09.17527+05:30	45	Instagram Followers | Indian Mix | Good Quality | Low Drop | R100♻️ | 1M | 20-40K Per Day(Recommended)	2	[{"changed": {"fields": ["Api"]}}]	4	1
684	2022-02-26 22:34:21.623444+05:30	43	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	2	[{"changed": {"fields": ["Api"]}}]	4	1
685	2022-02-26 22:34:33.690198+05:30	42	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	2	[{"changed": {"fields": ["Api"]}}]	4	1
686	2022-02-26 22:34:44.889875+05:30	41	Instagram Followers - 2 year REFILL ♻️[ HQ ] [ 💎Drop - 5% Only ] [ Never drop ] Start: 0-3hr] Stable Lifetime	2	[{"changed": {"fields": ["Api"]}}]	4	1
687	2022-02-26 22:34:56.988248+05:30	40	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	2	[{"changed": {"fields": ["Api"]}}]	4	1
688	2022-02-26 22:38:55.902461+05:30	258	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
689	2022-02-26 22:39:38.400215+05:30	259	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
690	2022-02-26 22:40:14.854321+05:30	260	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
691	2022-02-26 22:40:32.173494+05:30	261	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
692	2022-02-26 22:40:56.70824+05:30	262	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
693	2022-02-26 22:41:15.486741+05:30	263	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
694	2022-02-26 22:41:30.58139+05:30	264	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
695	2022-02-26 22:43:33.127773+05:30	258	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
696	2022-02-26 22:43:45.49118+05:30	259	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
697	2022-02-26 22:43:58.996747+05:30	260	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
698	2022-02-26 22:44:19.285868+05:30	261	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
699	2022-02-26 22:44:30.867572+05:30	262	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
700	2022-02-26 22:44:39.788167+05:30	263	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
701	2022-02-27 22:29:24.129417+05:30	267	INSTAGRAM REAL FOLLOWERS NON REFIL-Pending	3		10	1
702	2022-02-27 22:38:59.38367+05:30	265	INSTAGRAM REAL FOLLOWERS NON REFIL-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	1
703	2022-02-27 22:39:01.234721+05:30	265	INSTAGRAM REAL FOLLOWERS NON REFIL-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
704	2022-02-27 22:45:45.017903+05:30	265	INSTAGRAM REAL FOLLOWERS NON REFIL-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	1
705	2022-02-27 22:45:54.809924+05:30	266	INSTAGRAM REAL FOLLOWERS NON REFIL-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	1
706	2022-02-27 22:52:14.740265+05:30	268	◾ ❤️𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Likes | Mix Users | High Quality | No Drop | 15K | 3K-5K Per Day-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	1
707	2022-02-27 22:53:49.385269+05:30	269	◾ ❤️𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Likes | Mix Users | High Quality | No Drop | 15K | 3K-5K Per Day-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	1
708	2022-02-27 23:23:36.244232+05:30	271	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Pending	1	[{"added": {}}]	10	1
709	2022-02-27 23:23:52.468771+05:30	271	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Pending	3		10	1
710	2022-02-27 23:28:09.722577+05:30	272	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Pending	3		10	1
711	2022-02-27 23:42:15.79162+05:30	268	◾ ❤️𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Likes | Mix Users | High Quality | No Drop | 15K | 3K-5K Per Day-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
712	2022-02-27 23:42:25.685744+05:30	269	◾ ❤️𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Likes | Mix Users | High Quality | No Drop | 15K | 3K-5K Per Day-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
713	2022-02-28 01:21:33.187418+05:30	3	Offers object (3)	1	[{"added": {}}]	18	1
714	2022-02-28 01:33:33.478986+05:30	143	TransanctionsModel object (143)	2	[{"changed": {"fields": ["Status"]}}]	11	1
715	2022-02-28 01:44:17.059918+05:30	101	Devil- 40.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
716	2022-02-28 11:20:06.844002+05:30	4	Offers object (4)	1	[{"added": {}}]	18	1
717	2022-02-28 11:20:18.56027+05:30	2	Admin- 500.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
718	2022-02-28 17:08:35.10765+05:30	146	TransanctionsModel object (146)	2	[{"changed": {"fields": ["Status"]}}]	11	1
719	2022-02-28 17:35:29.017194+05:30	273	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	1
720	2022-02-28 18:01:09.387054+05:30	113	aiyyu- 10.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
721	2022-02-28 18:08:19.426181+05:30	2	Admin- 1000.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
722	2022-02-28 18:34:38.749604+05:30	1	None	2	[{"changed": {"fields": ["Pyament qr"]}}]	16	1
723	2022-02-28 18:35:39.630172+05:30	1	None	2	[{"changed": {"fields": ["Logo"]}}]	16	1
724	2022-02-28 23:51:32.15825+05:30	68	💫 Telegram » Group Member | 🔥 Real & Very Fast | 💧 100% Non Drop | ⏩ 100k+ Per Day | ▶️ Start: Instant	1	[{"added": {}}]	4	1
725	2022-02-28 23:54:20.644638+05:30	69	💫 Telegram » Channel/Group Member | 🔥 Real | 💧 100% Non Drop | ⏩ 20k+ Per Day | ▶️ Start: Instant	1	[{"added": {}}]	4	1
726	2022-02-28 23:55:25.416775+05:30	70	💫 Telegram » Channel/Group Member | 🔥 Real & Active | 💧 100% Non Drop | ⏩ 60k+ Per Day | ▶️ Start: Instant	1	[{"added": {}}]	4	1
727	2022-03-01 00:01:09.662527+05:30	278	Youtube Views [Non Drop]-Pending	3		10	1
728	2022-03-01 00:01:09.664768+05:30	277	Youtube Views [Non Drop]-Pending	3		10	1
729	2022-03-01 00:01:09.666216+05:30	276	Youtube Views [Non Drop]-Pending	3		10	1
730	2022-03-01 00:01:09.667805+05:30	275	Youtube Views [Non Drop]-Pending	3		10	1
731	2022-03-01 00:01:09.669423+05:30	274	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day-Pending	3		10	1
732	2022-03-01 00:06:16.141943+05:30	24	▶ YT VIEWS |【 SHORT'S】	1	[{"added": {}}]	3	1
733	2022-03-01 00:07:30.708746+05:30	71	♦️  𝗬𝗢𝗨𝗧𝗨𝗕𝗘 Short ~ Video Views [ Lifetime Guratanteed ]	1	[{"added": {}}]	4	1
734	2022-03-01 00:08:21.248149+05:30	72	YT Short ~ Likes ❤️ [ Lifetime Guratanteed ]	1	[{"added": {}}]	4	1
735	2022-03-01 00:08:31.421462+05:30	72	YT Short ~ Likes ❤️ [ Lifetime Guratanteed ]	2	[{"changed": {"fields": ["Api"]}}]	4	1
736	2022-03-01 00:09:52.087716+05:30	5	Offers object (5)	1	[{"added": {}}]	18	1
737	2022-03-01 00:15:43.568583+05:30	73	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧	1	[{"added": {}}]	4	1
738	2022-03-01 00:16:37.530766+05:30	73	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧	2	[{"changed": {"fields": ["Service id", "Api"]}}]	4	1
739	2022-03-01 00:17:37.327669+05:30	74	16321\t➤ IG 🇮🇳Indian Followers【 Upto +100K/Day\t🇮🇳【 Pure 100% 🇮🇳Indian【 0-15/min【 Lifetime Guarantee【 365Manual Refill💧	1	[{"added": {}}]	4	1
740	2022-03-01 00:18:36.751884+05:30	6	Offers object (6)	1	[{"added": {}}]	18	1
741	2022-03-01 00:18:50.114503+05:30	7	Offers object (7)	1	[{"added": {}}]	18	1
742	2022-03-01 00:20:27.65092+05:30	8	Offers object (8)	1	[{"added": {}}]	18	1
743	2022-03-01 00:20:44.586733+05:30	8	Offers object (8)	2	[{"changed": {"fields": ["Price"]}}]	18	1
744	2022-03-01 00:21:16.167123+05:30	9	Offers object (9)	1	[{"added": {}}]	18	1
745	2022-03-01 10:12:24.685429+05:30	147	TransanctionsModel object (147)	3		11	1
746	2022-03-01 10:14:08.069595+05:30	149	TransanctionsModel object (149)	2	[{"changed": {"fields": ["Status"]}}]	11	1
747	2022-03-01 23:08:02.716242+05:30	10	Offers object (10)	1	[{"added": {}}]	18	1
748	2022-03-01 23:11:53.6262+05:30	11	Offers object (11)	1	[{"added": {}}]	18	1
749	2022-03-01 23:17:49.170479+05:30	12	Offers object (12)	1	[{"added": {}}]	18	1
750	2022-03-01 23:28:05.466929+05:30	136	Sanam 	3		1	1
751	2022-03-01 23:28:05.468962+05:30	135	Sanam	3		1	1
752	2022-03-01 23:28:05.470504+05:30	96	Sanam	3		1	1
753	2022-03-01 23:28:05.471993+05:30	92	Pa	3		1	1
754	2022-03-02 13:35:10.096315+05:30	150	TransanctionsModel object (150)	2	[{"changed": {"fields": ["Status"]}}]	11	1
755	2022-03-02 13:45:18.616945+05:30	27	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day	2	[{"changed": {"fields": ["Min order"]}}]	4	1
756	2022-03-02 13:55:34.21477+05:30	281	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	1
757	2022-03-02 16:12:48.394657+05:30	1	Promotion maro	2	[{"changed": {"fields": ["Site title", "Site name", "Whatsapp message"]}}]	16	1
758	2022-03-02 19:52:03.501413+05:30	143	Sanam- 299.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
759	2022-03-02 19:53:38.562513+05:30	13	Offers object (13)	1	[{"added": {}}]	18	3
760	2022-03-02 21:49:13.499435+05:30	25	Best Of【MAHASHIVRATRI	1	[{"added": {}}]	3	3
761	2022-03-02 21:50:35.551978+05:30	75	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧	1	[{"added": {}}]	4	3
762	2022-03-02 21:51:10.040449+05:30	14	Offers object (14)	1	[{"added": {}}]	18	3
763	2022-03-02 22:40:20.647741+05:30	152	TransanctionsModel object (152)	2	[{"changed": {"fields": ["Status"]}}]	11	3
764	2022-03-02 22:51:16.761053+05:30	15	Offers object (15)	1	[{"added": {}}]	18	1
765	2022-03-02 22:57:04.386854+05:30	284	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
766	2022-03-02 22:59:00.797111+05:30	101	Devil- 230.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	1
767	2022-03-03 15:05:21.475417+05:30	288	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
768	2022-03-03 15:14:26.019449+05:30	289	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Processing	3		10	1
769	2022-03-03 15:31:14.098966+05:30	101	Devil- 55.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
770	2022-03-04 00:39:28.402456+05:30	154	TransanctionsModel object (154)	2	[{"changed": {"fields": ["Status"]}}]	11	3
771	2022-03-04 00:41:25.01067+05:30	16	Offers object (16)	1	[{"added": {}}]	18	3
772	2022-03-04 00:43:42.102568+05:30	101	Devil- 622.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
773	2022-03-04 00:50:59.111092+05:30	290	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
774	2022-03-04 13:11:24.467677+05:30	161	TransanctionsModel object (161)	2	[{"changed": {"fields": ["Status"]}}]	11	3
775	2022-03-04 20:18:31.393548+05:30	291	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
776	2022-03-05 00:16:44.811988+05:30	162	TransanctionsModel object (162)	2	[{"changed": {"fields": ["Status"]}}]	11	3
777	2022-03-05 00:27:25.981499+05:30	294	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
778	2022-03-05 00:29:43.460211+05:30	291	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day-In progress	2	[]	10	3
779	2022-03-05 13:00:39.426926+05:30	164	TransanctionsModel object (164)	2	[{"changed": {"fields": ["Status"]}}]	11	3
780	2022-03-05 13:53:22.494099+05:30	108	Gourav- 257.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
781	2022-03-05 20:05:42.570743+05:30	15	Offers object (15)	2	[{"changed": {"fields": ["Price"]}}]	18	1
782	2022-03-05 21:56:47.393546+05:30	108	Gourav- 237.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
784	2022-03-05 22:57:00.078491+05:30	296	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
785	2022-03-05 22:57:50.662165+05:30	296	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day-Pending	2	[{"changed": {"fields": ["Status"]}}]	10	3
786	2022-03-06 09:55:48.020518+05:30	144	Sanam	2	[{"changed": {"fields": ["Api key"]}}]	1	1
787	2022-03-06 09:57:27.480007+05:30	306	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]-Pending	3		10	1
788	2022-03-06 09:57:27.482007+05:30	305	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]-Pending	3		10	1
789	2022-03-06 10:02:11.630954+05:30	308	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]-Pending	3		10	1
790	2022-03-06 10:02:35.766945+05:30	307	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]-Pending	3		10	1
791	2022-03-06 10:04:27.86724+05:30	309	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	1
792	2022-03-06 10:05:33.07846+05:30	309	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	1
793	2022-03-06 12:47:00.366958+05:30	167	TransanctionsModel object (167)	2	[{"changed": {"fields": ["Status"]}}]	11	3
794	2022-03-06 12:47:20.942135+05:30	13	Sasi- 13.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
795	2022-03-06 19:11:44.17914+05:30	168	TransanctionsModel object (168)	2	[{"changed": {"fields": ["Status"]}}]	11	3
796	2022-03-07 19:23:37.301977+05:30	26	Description 🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 INSTAGRAM 】	1	[{"added": {}}]	3	3
797	2022-03-07 19:27:25.885756+05:30	27	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 INSTAGRAM 】	1	[{"added": {}}]	3	3
798	2022-03-08 13:07:23.795985+05:30	314	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
799	2022-03-08 13:08:05.822705+05:30	313	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
800	2022-03-08 14:44:46.773662+05:30	169	TransanctionsModel object (169)	2	[{"changed": {"fields": ["Status"]}}]	11	3
801	2022-03-08 15:19:00.292536+05:30	316	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
802	2022-03-08 15:19:13.620883+05:30	315	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
803	2022-03-08 20:20:58.187891+05:30	170	TransanctionsModel object (170)	2	[{"changed": {"fields": ["Status"]}}]	11	3
804	2022-03-08 20:39:11.901341+05:30	76	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑	1	[{"added": {}}]	4	3
805	2022-03-08 20:40:41.525319+05:30	77	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧	1	[{"added": {}}]	4	3
806	2022-03-08 20:43:10.85088+05:30	78	IG 🇮🇳Indian Followers【 Upto +50K/Day 🇮🇳【 Pure 100% 🇮🇳Indian【 0-15/min【 Lifetime Guarantee【 R356 Days with Button💧	1	[{"added": {}}]	4	3
807	2022-03-08 20:44:44.616123+05:30	171	TransanctionsModel object (171)	2	[{"changed": {"fields": ["Status"]}}]	11	3
808	2022-03-08 20:47:44.369177+05:30	79	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸	1	[{"added": {}}]	4	3
809	2022-03-08 20:50:30.442188+05:30	80	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑	1	[{"added": {}}]	4	3
810	2022-03-08 20:52:10.55262+05:30	81	🇮🇳 ❤️ Instagram POST+REEL+IGTV Likes ~ Indian 𝗥𝗘𝗔𝗟 Users | High Quality || 10K-50k/Day || SuperFast🔥[Recommended]	1	[{"added": {}}]	4	3
811	2022-03-08 20:52:27.286535+05:30	81	🇮🇳 ❤️ Instagram POST+REEL+IGTV Likes ~ Indian 𝗥𝗘𝗔𝗟 Users | High Quality || 10K-50k/Day || SuperFast🔥[Recommended]	2	[]	4	3
812	2022-03-08 20:55:16.354549+05:30	82	14246\t🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]	1	[{"added": {}}]	4	3
813	2022-03-08 20:55:42.332278+05:30	82	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]🥵🔥👀	2	[{"changed": {"fields": ["Name"]}}]	4	3
814	2022-03-08 21:00:13.701102+05:30	26	Description 🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 INSTAGRAM 】	3		3	3
815	2022-03-08 21:00:45.778002+05:30	27	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 INSTAGRAM 】	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
816	2022-03-08 21:01:22.285433+05:30	38	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]	2	[{"changed": {"fields": ["Description"]}}]	4	3
817	2022-03-08 21:10:16.694116+05:30	80	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑	2	[{"changed": {"fields": ["Rate"]}}]	4	3
818	2022-03-08 21:10:29.393108+05:30	81	🇮🇳 ❤️ Instagram POST+REEL+IGTV Likes ~ Indian 𝗥𝗘𝗔𝗟 Users | High Quality || 10K-50k/Day || SuperFast🔥[Recommended]	2	[{"changed": {"fields": ["Rate"]}}]	4	3
819	2022-03-08 21:11:08.507722+05:30	79	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸	2	[{"changed": {"fields": ["Rate"]}}]	4	3
820	2022-03-08 21:20:58.069332+05:30	172	TransanctionsModel object (172)	2	[{"changed": {"fields": ["Status"]}}]	11	3
821	2022-03-08 22:03:53.390967+05:30	326	16321\t➤ IG 🇮🇳Indian Followers【 Upto +100K/Day\t🇮🇳【 Pure 100% 🇮🇳Indian【 0-15/min【 Lifetime Guarantee【 365Manual Refill💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
822	2022-03-08 22:10:20.96524+05:30	325	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
823	2022-03-08 22:10:31.567183+05:30	324	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
824	2022-03-08 22:10:46.785361+05:30	324	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[]	10	3
825	2022-03-08 22:11:04.144104+05:30	323	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
826	2022-03-08 22:11:22.130057+05:30	322	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
827	2022-03-08 22:11:42.654008+05:30	321	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
828	2022-03-08 22:12:06.203605+05:30	320	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
829	2022-03-08 22:12:28.948438+05:30	319	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
922	2022-05-17 16:58:49.926682+05:30	28	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 YOUTUBE 】	1	[{"added": {}}]	3	3
830	2022-03-08 22:12:43.832123+05:30	317	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
831	2022-03-08 22:13:15.280021+05:30	318	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
832	2022-03-09 08:27:40.061452+05:30	327	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
833	2022-03-09 11:49:02.201092+05:30	173	TransanctionsModel object (173)	2	[{"changed": {"fields": ["Status"]}}]	11	3
834	2022-03-09 11:50:59.067802+05:30	331	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
835	2022-03-09 11:52:42.343174+05:30	330	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
836	2022-03-09 15:15:46.09354+05:30	329	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
837	2022-03-09 21:03:46.056996+05:30	113	aiyyu- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
838	2022-03-11 21:54:19.865797+05:30	174	TransanctionsModel object (174)	2	[{"changed": {"fields": ["Status"]}}]	11	3
839	2022-03-11 21:54:57.980126+05:30	332	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
840	2022-03-11 22:01:03.121668+05:30	79	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸	2	[]	4	3
841	2022-03-11 22:01:34.020554+05:30	336	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
842	2022-03-11 22:42:29.896852+05:30	337	🇮🇳✨1 Year Refill || Instagram Followers || Stable-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
843	2022-03-12 17:31:19.515173+05:30	1	The Royal SMM	2	[{"changed": {"fields": ["Api key"]}}]	17	1
844	2022-03-12 17:32:16.622995+05:30	338	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Pending	3		10	1
845	2022-03-13 09:52:49.217034+05:30	337	🇮🇳✨1 Year Refill || Instagram Followers || Stable-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
846	2022-03-13 09:52:58.154125+05:30	336	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
847	2022-03-13 09:53:50.92456+05:30	335	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
848	2022-03-13 09:54:06.797509+05:30	333	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
849	2022-03-13 09:54:47.885717+05:30	334	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
850	2022-03-13 14:54:20.963908+05:30	175	TransanctionsModel object (175)	2	[{"changed": {"fields": ["Status"]}}]	11	3
851	2022-03-13 15:07:27.976495+05:30	341	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
852	2022-03-14 12:43:23.562765+05:30	344	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
853	2022-03-14 12:43:53.964575+05:30	345	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
854	2022-03-14 13:37:38.580086+05:30	51	👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]	2	[{"changed": {"fields": ["Service id", "Api"]}}]	4	3
855	2022-03-14 13:41:48.96902+05:30	30	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳	2	[{"changed": {"fields": ["Service id"]}}]	4	3
856	2022-03-14 15:11:49.717204+05:30	346	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
857	2022-03-14 15:15:25.013328+05:30	60	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️	2	[{"changed": {"fields": ["Service id"]}}]	4	3
858	2022-03-14 15:15:40.606918+05:30	59	Instagram Reel Views [Non Drop]  💜💜🥰💥	2	[{"changed": {"fields": ["Service id"]}}]	4	3
859	2022-03-14 15:16:22.689054+05:30	4	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also	2	[{"changed": {"fields": ["Service id", "Api"]}}]	4	3
860	2022-03-14 18:03:13.586807+05:30	346	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-In progress	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
861	2022-03-14 18:03:31.918195+05:30	345	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳-In progress	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
862	2022-03-14 18:03:48.416159+05:30	344	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-In progress	2	[{"changed": {"fields": ["Third party id"]}}]	10	1
863	2022-03-16 22:40:06.948449+05:30	176	TransanctionsModel object (176)	2	[{"changed": {"fields": ["Status"]}}]	11	3
864	2022-03-18 22:13:32.953032+05:30	177	TransanctionsModel object (177)	2	[{"changed": {"fields": ["Status"]}}]	11	3
865	2022-03-20 10:52:43.029422+05:30	352	🇮🇳✨1 Year Refill || Instagram Followers || Stable-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
866	2022-03-20 15:25:59.1244+05:30	17	Offers object (17)	1	[{"added": {}}]	18	3
867	2022-03-20 15:30:12.337677+05:30	146	Nikhil	2	[{"changed": {"fields": ["Username"]}}]	1	3
868	2022-03-20 15:34:21.944013+05:30	18	Offers object (18)	1	[{"added": {}}]	18	3
869	2022-03-20 15:58:47.325041+05:30	19	Offers object (19)	1	[{"added": {}}]	18	3
870	2022-03-20 16:00:18.883276+05:30	20	Offers object (20)	1	[{"added": {}}]	18	3
871	2022-03-20 16:03:55.596038+05:30	21	Offers object (21)	1	[{"added": {}}]	18	3
872	2022-03-20 16:05:21.952756+05:30	76	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑	2	[{"changed": {"fields": ["Rate"]}}]	4	3
873	2022-03-20 16:20:34.334701+05:30	179	TransanctionsModel object (179)	2	[{"changed": {"fields": ["Status"]}}]	11	3
874	2022-03-20 16:21:02.393067+05:30	76	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑	2	[{"changed": {"fields": ["Service id", "Api"]}}]	4	3
875	2022-03-20 16:21:17.79352+05:30	156	Tyagi- 250.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
876	2022-03-20 16:24:14.506056+05:30	353	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
877	2022-03-20 16:56:08.856604+05:30	180	TransanctionsModel object (180)	2	[{"changed": {"fields": ["Status"]}}]	11	3
878	2022-03-20 16:59:00.08409+05:30	79	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
879	2022-03-20 17:33:09.764307+05:30	354	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
880	2022-03-22 13:47:28.456659+05:30	355	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
881	2022-03-24 15:24:44.009524+05:30	181	TransanctionsModel object (181)	2	[{"changed": {"fields": ["Status"]}}]	11	3
882	2022-03-24 22:41:02.899171+05:30	356	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
883	2022-04-04 20:24:36.677341+05:30	359	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
884	2022-04-06 09:20:17.181763+05:30	182	TransanctionsModel object (182)	2	[{"changed": {"fields": ["Status"]}}]	11	3
885	2022-04-08 22:15:15.606672+05:30	185	TransanctionsModel object (185)	2	[{"changed": {"fields": ["Status"]}}]	11	3
886	2022-04-08 22:36:05.318641+05:30	362	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
887	2022-04-09 10:58:41.051716+05:30	186	TransanctionsModel object (186)	2	[{"changed": {"fields": ["Status"]}}]	11	3
888	2022-04-09 11:00:32.899008+05:30	187	TransanctionsModel object (187)	2	[{"changed": {"fields": ["Status"]}}]	11	3
889	2022-04-09 22:03:57.023505+05:30	363	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
890	2022-04-16 10:57:46.945962+05:30	366	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
891	2022-04-16 12:38:02.019672+05:30	367	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
892	2022-04-19 19:36:40.77874+05:30	188	TransanctionsModel object (188)	2	[{"changed": {"fields": ["Status"]}}]	11	3
893	2022-04-19 21:09:55.050532+05:30	369	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
894	2022-04-19 21:11:27.606129+05:30	368	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
895	2022-04-23 13:09:35.008697+05:30	189	TransanctionsModel object (189)	2	[{"changed": {"fields": ["Status"]}}]	11	3
896	2022-04-23 13:49:47.839844+05:30	146	Munnu- 80.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
897	2022-04-23 14:57:49.22379+05:30	146	Munnu- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
898	2022-04-23 14:58:18.857806+05:30	370	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
899	2022-04-23 14:58:54.455397+05:30	371	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
900	2022-04-26 11:12:47.001571+05:30	193	TransanctionsModel object (193)	2	[{"changed": {"fields": ["Status"]}}]	11	3
901	2022-04-27 21:24:53.395485+05:30	372	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
902	2022-05-17 14:49:37.579004+05:30	1	Instagram Followers With Refill Guarantee 🙋🙋🔥	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
903	2022-05-17 14:49:44.716929+05:30	27	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 INSTAGRAM 】	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
904	2022-05-17 14:54:13.139524+05:30	83	🏆 IG ➠ Followers【 High Quality【 Average Speed【 60Days Refill with Button 💧	1	[{"added": {}}]	4	3
905	2022-05-17 14:56:57.779949+05:30	84	➤ IG » 🇮🇳Indian Followers【 30K-100K/Day 🇮🇳【 Pure 100% 🇮🇳Indian【 Instant【 Lifetime Guarantee【 365Refill with Button 💧]	1	[{"added": {}}]	4	3
906	2022-05-17 14:57:35.77836+05:30	84	➤ IG » 🇮🇳Indian Followers【 30K-100K/Day 🇮🇳【 Pure 100% 🇮🇳Indian【 Instant【 Lifetime Guarantee【 365Refill with Button 💧]	2	[{"changed": {"fields": ["Service id", "Api"]}}]	4	3
907	2022-05-17 15:02:20.892918+05:30	85	🏆 IG ➠ Followers【 High Quality【 Average Speed【 60Days Refill with Button 💧]	1	[{"added": {}}]	4	3
908	2022-05-17 15:03:23.2828+05:30	79	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸	2	[{"changed": {"fields": ["Rate"]}}]	4	3
909	2022-05-17 15:07:23.207239+05:30	81	🇮🇳 ❤️ Instagram POST+REEL+IGTV Likes ~ Indian 𝗥𝗘𝗔𝗟 Users | High Quality || 10K-50k/Day || SuperFast🔥[Recommended]	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
910	2022-05-17 15:09:16.359185+05:30	86	Instagram Comments 📝📝🏆 IG ➠ Random Comments【 100% NonDrop【 High Quality【 Average Speed【 Lifetime Guaranteed 💧	1	[{"added": {}}]	4	3
911	2022-05-17 15:09:58.534562+05:30	87	Instagram Comments  CUSTOM📝📝🏆 IG ➠ CUSTOM Comments【 100% NonDrop【 High Quality【 Average Speed【 Lifetime Guaranteed 💧	1	[{"added": {}}]	4	3
912	2022-05-17 15:11:05.634609+05:30	79	15179\t➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸	2	[{"changed": {"fields": ["Service id"]}}]	4	3
913	2022-05-17 15:11:30.156146+05:30	79	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸	2	[{"changed": {"fields": ["Name"]}}]	4	3
914	2022-05-17 15:12:40.527345+05:30	79	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸	2	[{"changed": {"fields": ["Service id"]}}]	4	3
915	2022-05-17 16:48:00.494386+05:30	88	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 SuperFast【 R30 🩸	1	[{"added": {}}]	4	3
916	2022-05-17 16:49:18.198255+05:30	87	Instagram Comments  CUSTOM📝📝🏆 IG ➠ CUSTOM Comments【 100% NonDrop【 High Quality【 Average Speed【 Lifetime Guaranteed 💧	2	[{"changed": {"fields": ["Service id", "Api"]}}]	4	3
917	2022-05-17 16:49:30.669075+05:30	86	Instagram Comments 📝📝🏆 IG ➠ Random Comments【 100% NonDrop【 High Quality【 Average Speed【 Lifetime Guaranteed 💧	2	[]	4	3
918	2022-05-17 16:53:46.897984+05:30	82	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]🥵🔥👀	2	[{"changed": {"fields": ["Rate"]}}]	4	3
919	2022-05-17 16:54:43.855152+05:30	89	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]🥵🔥👀	1	[{"added": {}}]	4	3
920	2022-05-17 16:55:42.164899+05:30	89	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]	2	[{"changed": {"fields": ["Name"]}}]	4	3
921	2022-05-17 16:58:36.333822+05:30	21	👨Instagram Followers [ No Refill ] not garrented	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
923	2022-05-17 17:02:42.136898+05:30	90	YOUTUBE SUBSCRIBERS 💜💙💜🔥{ NON DROP }	1	[{"added": {}}]	4	3
924	2022-05-17 17:05:24.991973+05:30	90	YOUTUBE SUBSCRIBERS 💜💙💜🔥{ NON DROP }	3		4	3
925	2022-05-17 17:07:27.678817+05:30	91	🏆 YT Views【 High Quality【 Upto +10K/Day【 Non Drop【 30Days Refill🩸]	1	[{"added": {}}]	4	3
926	2022-05-17 17:08:30.068316+05:30	92	15988\t🏆 YT Views【 High Quality【 Upto +20K/Day【 Non Drop【 Lifetime Refill🩸	1	[{"added": {}}]	4	3
927	2022-05-17 17:08:44.99828+05:30	92	🏆 YT Views【 High Quality【 Upto +20K/Day【 Non Drop【 Lifetime Refill🩸	2	[{"changed": {"fields": ["Name"]}}]	4	3
928	2022-05-17 17:09:47.131743+05:30	93	🏆 YT Views【 High Quality【 Upto +25K/Day【 Non Drop【 Lifetime Guaranteed🩸	1	[{"added": {}}]	4	3
929	2022-05-17 17:11:28.80192+05:30	94	15991\t🏆 YT Views【 High Quality【 Upto +100K/Day【 Non Drop【 Lifetime Guaranteed【 Clients Favorite🩸	1	[{"added": {}}]	4	3
930	2022-05-17 17:11:40.370548+05:30	94	🏆 YT Views【 High Quality【 Upto +100K/Day【 Non Drop【 Lifetime Guaranteed【 Clients Favorite🩸	2	[{"changed": {"fields": ["Name"]}}]	4	3
931	2022-05-17 17:11:54.826809+05:30	93	🏆 YT Views【 High Quality【 Upto +25K/Day【 Non Drop【 Lifetime Guaranteed🩸	2	[{"changed": {"fields": ["Min order"]}}]	4	3
932	2022-05-17 17:17:42.489158+05:30	95	🏆 YT Views【 High Quality【 Upto +200K/Day【 Non Drop【 Lifetime Guaranteed【 Clients Favorite🩸	1	[{"added": {}}]	4	3
933	2022-05-17 17:19:18.942031+05:30	96	🏆 YT Likes【 High Quality【 Upto +30K/Day【 NonDrop【 Average Speed【 Lifetime Guarantee 🩸	1	[{"added": {}}]	4	3
934	2022-05-17 17:19:57.862978+05:30	97	🏆 YT Likes【 High Quality【 Upto +50K/Day【 NonDrop【 Average Speed【 Lifetime Guarantee 🩸	1	[{"added": {}}]	4	3
935	2022-05-17 17:20:30.443109+05:30	98	🏆 YT Likes【 High Quality【 Upto +100K/Day【 NonDrop【 Average Speed【 Lifetime Guarantee 🩸	1	[{"added": {}}]	4	3
936	2022-05-17 23:49:57.50781+05:30	80	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
937	2022-05-18 15:03:36.321111+05:30	3	💖 Instagram Likes { 𝙃𝙄𝙂𝙃 𝙌𝙐𝘼𝙇𝙄𝙏𝙔 }💖	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
938	2022-05-18 15:03:44.045589+05:30	29	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 TELEGRAM 】	1	[{"added": {}}]	3	3
939	2022-05-18 15:10:27.372153+05:30	29	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 TELEGRAM 】	3		3	3
940	2022-05-18 15:10:59.462849+05:30	30	👑TELEGRAM MEMBERS |《 NONDROP 》👑👑	1	[{"added": {}}]	3	3
941	2022-05-18 15:16:10.023441+05:30	99	💫 Telegram » Channel/Group Member | 🔥 Cheapest | 💧 No Drop | ⏩ 15-20k+ Per Day | ▶️ Strat: Instant	1	[{"added": {}}]	4	3
942	2022-05-18 15:17:07.948401+05:30	100	💫 Telegram » Channel/Group Member | 🔥 Cheapest | 💧 No Drop | ⏩ 100k+ Per Day | ▶️ Strat: Instant	1	[{"added": {}}]	4	3
943	2022-05-18 15:18:01.8532+05:30	101	💫 Telegram » Channel/Group Member | 🔥 Real | 💧 100% Non Drop | ⏩ 40k+ Per Day | ▶️ Start: Instant	1	[{"added": {}}]	4	3
944	2022-05-18 15:19:09.901905+05:30	102	💫 Telegram » Channel/Group Member | 🔥 Real | 💧 100% Non Drop | ⏩ 50-100k+ Per Day | ▶️ Start: Instant	1	[{"added": {}}]	4	3
945	2022-05-18 15:20:12.857643+05:30	103	💫 Telegram » Channel/Group Member | 🔥 Real & Active | 💧 100% Non Drop | ⏩ 60k+ Per Day | ▶️ Start: Instant	1	[{"added": {}}]	4	3
946	2022-05-18 15:21:39.8597+05:30	104	💫 Telegram » Channel/Group Member |🔥 Real Russia |💧 100% No Drop | ⏩ 50-100k Per Day | ▶️ Start: Instant	1	[{"added": {}}]	4	3
947	2022-05-18 15:22:45.806153+05:30	105	💫 Telegram » Channel Member | 🔥 Real | 💧 100% Non Drop | ♻️ 30 Day Refill | ⏩ 100k+ Per Day | ▶️ Start: Instant	1	[{"added": {}}]	4	3
948	2022-05-18 15:23:31.704619+05:30	106	💫 Telegram » Member [🔥 Real Mix -💧 No Drop ] - [⏩ 20-30k+ Per Day - ▶️ Strat: Instant ]	1	[{"added": {}}]	4	3
949	2022-05-18 15:29:57.861638+05:30	31	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 TELEGRAM 】	1	[{"added": {}}]	3	3
950	2022-05-18 15:33:22.680808+05:30	107	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 1 POST | | NON DROP |	1	[{"added": {}}]	4	3
951	2022-05-18 15:33:58.025997+05:30	107	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 1 POST |  NON DROP |	2	[{"changed": {"fields": ["Name", "Rate"]}}]	4	3
952	2022-05-18 15:34:29.220084+05:30	107	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 1 POST |  NON DROP |	2	[]	4	3
953	2022-05-18 15:35:14.57333+05:30	108	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 5 POST |  NON DROP |	1	[{"added": {}}]	4	3
954	2022-05-18 15:35:45.623858+05:30	109	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 1 POST |  NON DROP |	1	[{"added": {}}]	4	3
955	2022-05-18 15:36:30.282406+05:30	110	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 10 POST |  NON DROP |	1	[{"added": {}}]	4	3
956	2022-05-18 15:37:36.462169+05:30	111	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 10 POST |  NON DROP |	1	[{"added": {}}]	4	3
957	2022-05-18 15:40:39.898702+05:30	112	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 100 POST |  NON DROP |	1	[{"added": {}}]	4	3
958	2022-05-18 15:41:53.301551+05:30	113	🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 20 POST | | NON DROP |	1	[{"added": {}}]	4	3
959	2022-05-18 15:43:15.117202+05:30	114	| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 50 POST | | NON DROP |	1	[{"added": {}}]	4	3
960	2022-05-18 15:43:42.270039+05:30	112	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 100 POST |  NON DROP |	2	[]	4	3
961	2022-05-18 15:43:55.452297+05:30	113	TELEGRAM BULK POST VIEW |《 LAST 》🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 20 POST | | NON DROP |	2	[{"changed": {"fields": ["Name"]}}]	4	3
962	2022-05-18 15:44:06.225755+05:30	114	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 50 POST | | NON DROP |	2	[{"changed": {"fields": ["Name"]}}]	4	3
963	2022-05-18 15:44:54.375453+05:30	115	TELEGRAM BULK POST VIEW |《 LAST 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 100 POST | | NON DROP |	1	[{"added": {}}]	4	3
964	2022-05-18 15:45:25.767566+05:30	109	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 5 POST |  NON DROP |	2	[{"changed": {"fields": ["Name"]}}]	4	3
965	2022-05-18 16:32:48.070954+05:30	31	💥💥TELEGRAM BULK POST VIEW |《 LAST 》👑	2	[{"changed": {"fields": ["Name"]}}]	3	3
966	2022-05-18 16:33:05.317367+05:30	31	TELEGRAM BULK POST VIEW |《 LAST 》👑👑	2	[{"changed": {"fields": ["Name"]}}]	3	3
967	2022-05-18 16:33:28.834333+05:30	32	TELEGRAM BULK POST VIEW |《 FUTURE 》👑👑	1	[{"added": {}}]	3	3
1069	2022-06-14 17:02:56.365289+05:30	156	TransanctionsModel object (156)	3		11	172
968	2022-05-18 16:34:29.271047+05:30	116	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 5 Future Posts	1	[{"added": {}}]	4	3
969	2022-05-18 16:35:36.199045+05:30	117	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 10 Future Posts	1	[{"added": {}}]	4	3
970	2022-05-18 16:36:03.369839+05:30	118	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 20 Future Posts	1	[{"added": {}}]	4	3
971	2022-05-18 16:37:26.368341+05:30	119	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 30 Future Posts	1	[{"added": {}}]	4	3
972	2022-05-18 16:38:14.747574+05:30	120	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 50 Future Posts	1	[{"added": {}}]	4	3
973	2022-05-18 16:40:52.098017+05:30	121	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 100 Future Posts	1	[{"added": {}}]	4	3
974	2022-05-18 16:41:36.233673+05:30	122	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 500 Future Posts	1	[{"added": {}}]	4	3
975	2022-05-18 16:45:16.853116+05:30	38	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]	2	[{"changed": {"fields": ["Rate"]}}]	4	3
976	2022-05-18 16:47:46.164989+05:30	38	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]	2	[]	4	3
977	2022-05-18 16:49:39.020157+05:30	30	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳	2	[{"changed": {"fields": ["Rate"]}}]	4	3
978	2022-05-18 16:50:55.759143+05:30	38	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]	2	[{"changed": {"fields": ["Active", "Refill", "Service id", "Api"]}}]	4	3
979	2022-05-18 16:54:34.065541+05:30	30	👑TELEGRAM MEMBERS |《 NONDROP 》👑👑	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
980	2022-05-18 16:54:43.017638+05:30	1	Instagram Followers With Refill Guarantee 🙋🙋🔥	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
981	2022-05-18 16:55:17.429013+05:30	22	💲💝Cheapest Instagram Likes💝💲 [ Not Guaranteed ]	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
982	2022-05-18 16:55:24.353527+05:30	23	👸👸 Instagram female followers👸👸	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
983	2022-05-18 16:55:41.09239+05:30	2	INSTAGRAM REELS VIEWS 💥💥✨	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
984	2022-05-18 16:55:48.920936+05:30	21	👨Instagram Followers [ No Refill ] not garrented	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
985	2022-06-05 12:57:17.181516+05:30	195	TransanctionsModel object (195)	2	[{"changed": {"fields": ["Status"]}}]	11	3
986	2022-06-05 12:57:27.646893+05:30	201	TransanctionsModel object (201)	2	[{"changed": {"fields": ["Status"]}}]	11	3
987	2022-06-05 13:24:01.978854+05:30	373	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
988	2022-06-05 13:26:40.65972+05:30	374	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
989	2022-06-10 15:33:49.404801+05:30	202	TransanctionsModel object (202)	2	[{"changed": {"fields": ["Status"]}}]	11	3
990	2022-06-10 15:34:09.394765+05:30	373	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
991	2022-06-10 15:34:23.613091+05:30	374	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
992	2022-06-10 17:37:55.897876+05:30	375	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
993	2022-06-10 23:52:56.363977+05:30	171	- 0.0 Rs 	1	[{"added": {}}]	2	172
994	2022-06-10 23:57:59.2998+05:30	203	TransanctionsModel object (203)	2	[{"changed": {"fields": ["Status", "Transaction id"]}}]	11	172
995	2022-06-10 23:58:21.486087+05:30	203	TransanctionsModel object (203)	2	[]	11	172
996	2022-06-10 23:58:40.608413+05:30	205	TransanctionsModel object (205)	3		11	172
997	2022-06-10 23:58:40.610693+05:30	204	TransanctionsModel object (204)	3		11	172
998	2022-06-11 00:13:40.792947+05:30	1	Promotion maro	2	[{"changed": {"fields": ["Paytm merchant id", "Paytmqr active"]}}]	16	172
999	2022-06-11 00:14:18.967146+05:30	206	TransanctionsModel object (206)	3		11	172
1000	2022-06-11 00:28:04.616361+05:30	207	TransanctionsModel object (207)	2	[]	11	3
1001	2022-06-11 00:29:07.988125+05:30	203	TransanctionsModel object (203)	2	[]	11	3
1002	2022-06-11 00:32:43.0218+05:30	207	TransanctionsModel object (207)	3		11	172
1003	2022-06-11 00:35:12.912729+05:30	171	- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	172
1004	2022-06-11 00:35:39.364513+05:30	172		2	[{"changed": {"fields": ["Name", "Phone", "Email address"]}}]	1	172
1005	2022-06-11 00:39:34.754583+05:30	375	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1006	2022-06-11 00:46:25.835048+05:30	376	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1007	2022-06-11 00:46:35.847239+05:30	378	🇮🇳✨1 Year Refill || Instagram Followers || Stable-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1008	2022-06-11 00:46:45.708499+05:30	377	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1009	2022-06-11 00:47:01.303182+05:30	170	Sonu- 155.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
1010	2022-06-11 00:57:47.896153+05:30	379	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
1011	2022-06-11 11:29:46.004654+05:30	379	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1012	2022-06-11 11:29:59.240621+05:30	380	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1013	2022-06-11 22:54:47.271966+05:30	381	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1014	2022-06-11 22:55:44.16427+05:30	382	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1015	2022-06-12 01:37:49.932061+05:30	381	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1016	2022-06-12 01:38:00.796182+05:30	382	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1017	2022-06-12 13:32:44.950578+05:30	385	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1018	2022-06-12 13:46:59.070784+05:30	383	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 SuperFast【 R30 🩸-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1019	2022-06-12 13:47:38.274538+05:30	384	Instagram Comments 📝📝🏆 IG ➠ Random Comments【 100% NonDrop【 High Quality【 Average Speed【 Lifetime Guaranteed 💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1020	2022-06-12 15:42:12.134303+05:30	383	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 SuperFast【 R30 🩸-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1021	2022-06-12 15:42:22.048903+05:30	385	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1022	2022-06-12 15:42:32.285086+05:30	384	Instagram Comments 📝📝🏆 IG ➠ Random Comments【 100% NonDrop【 High Quality【 Average Speed【 Lifetime Guaranteed 💧-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1023	2022-06-12 15:42:44.776861+05:30	386	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1024	2022-06-12 16:01:13.055929+05:30	387	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1025	2022-06-12 16:24:05.228155+05:30	388	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1026	2022-06-12 16:24:48.591577+05:30	389	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1027	2022-06-12 16:55:04.942053+05:30	76	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑	2	[{"changed": {"fields": ["Rate", "Service id", "Api"]}}]	4	3
1028	2022-06-12 16:56:41.845495+05:30	63	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	2	[{"changed": {"fields": ["Refill", "Service id", "Api"]}}]	4	3
1029	2022-06-12 16:58:54.877405+05:30	80	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑	2	[{"changed": {"fields": ["Service id"]}}]	4	3
1030	2022-06-12 16:59:52.591479+05:30	84	➤ IG » 🇮🇳Indian Followers【 30K-100K/Day 🇮🇳【 Pure 100% 🇮🇳Indian【 Instant【 Lifetime Guarantee【 365Refill with Button 💧]	2	[{"changed": {"fields": ["Service id"]}}]	4	3
1031	2022-06-12 17:00:15.977407+05:30	85	🏆 IG ➠ Followers【 High Quality【 Average Speed【 60Days Refill with Button 💧]	2	[]	4	3
1032	2022-06-12 17:01:36.420414+05:30	78	IG 🇮🇳Indian Followers【 Upto +50K/Day 🇮🇳【 Pure 100% 🇮🇳Indian【 0-15/min【 Lifetime Guarantee【 R356 Days with Button💧	2	[]	4	3
1033	2022-06-12 17:03:28.484744+05:30	32	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]	2	[{"changed": {"fields": ["Api"]}}]	4	3
1034	2022-06-12 17:03:45.849177+05:30	1	The Royal SMM	2	[]	17	3
1035	2022-06-12 18:42:02.100366+05:30	1	The Royal SMM	2	[{"changed": {"fields": ["Api key"]}}]	17	172
1036	2022-06-12 18:43:41.104688+05:30	396	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Pending	3		10	3
1037	2022-06-12 18:43:41.106953+05:30	395	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Pending	3		10	3
1038	2022-06-12 18:43:41.10851+05:30	394	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 SuperFast【 R30 🩸-Pending	3		10	3
1039	2022-06-12 18:43:41.110173+05:30	393	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Pending	3		10	3
1040	2022-06-12 18:43:41.111552+05:30	392	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Pending	3		10	3
1041	2022-06-12 18:43:41.11308+05:30	391	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Pending	3		10	3
1042	2022-06-12 18:43:41.114554+05:30	390	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Pending	3		10	3
1043	2022-06-12 18:43:52.74989+05:30	1	The Royal SMM	2	[]	17	172
1044	2022-06-13 13:22:30.653789+05:30	410	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Completed	3		10	172
1045	2022-06-13 13:22:30.659455+05:30	409	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Pending	3		10	172
1046	2022-06-13 13:22:30.660971+05:30	408	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Pending	3		10	172
1047	2022-06-13 13:22:30.662376+05:30	407	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Pending	3		10	172
1048	2022-06-13 13:22:30.663748+05:30	406	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Pending	3		10	172
1049	2022-06-14 12:44:30.616684+05:30	414	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 SuperFast【 R30 🩸-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1050	2022-06-14 13:01:30.369584+05:30	413	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]-Processing	2	[]	10	3
1051	2022-06-14 17:02:56.338311+05:30	200	TransanctionsModel object (200)	3		11	172
1052	2022-06-14 17:02:56.341473+05:30	199	TransanctionsModel object (199)	3		11	172
1053	2022-06-14 17:02:56.342997+05:30	198	TransanctionsModel object (198)	3		11	172
1054	2022-06-14 17:02:56.344489+05:30	197	TransanctionsModel object (197)	3		11	172
1055	2022-06-14 17:02:56.345789+05:30	196	TransanctionsModel object (196)	3		11	172
1056	2022-06-14 17:02:56.347331+05:30	194	TransanctionsModel object (194)	3		11	172
1057	2022-06-14 17:02:56.348727+05:30	192	TransanctionsModel object (192)	3		11	172
1058	2022-06-14 17:02:56.350171+05:30	191	TransanctionsModel object (191)	3		11	172
1059	2022-06-14 17:02:56.351474+05:30	190	TransanctionsModel object (190)	3		11	172
1060	2022-06-14 17:02:56.352844+05:30	184	TransanctionsModel object (184)	3		11	172
1061	2022-06-14 17:02:56.354288+05:30	183	TransanctionsModel object (183)	3		11	172
1062	2022-06-14 17:02:56.355591+05:30	178	TransanctionsModel object (178)	3		11	172
1063	2022-06-14 17:02:56.357083+05:30	165	TransanctionsModel object (165)	3		11	172
1064	2022-06-14 17:02:56.358452+05:30	163	TransanctionsModel object (163)	3		11	172
1065	2022-06-14 17:02:56.359768+05:30	160	TransanctionsModel object (160)	3		11	172
1066	2022-06-14 17:02:56.361071+05:30	159	TransanctionsModel object (159)	3		11	172
1067	2022-06-14 17:02:56.362587+05:30	158	TransanctionsModel object (158)	3		11	172
1068	2022-06-14 17:02:56.363913+05:30	157	TransanctionsModel object (157)	3		11	172
1070	2022-06-14 17:02:56.367667+05:30	155	TransanctionsModel object (155)	3		11	172
1071	2022-06-14 17:02:56.369169+05:30	153	TransanctionsModel object (153)	3		11	172
1072	2022-06-14 17:02:56.370526+05:30	151	TransanctionsModel object (151)	3		11	172
1073	2022-06-14 17:02:56.371978+05:30	148	TransanctionsModel object (148)	3		11	172
1074	2022-06-14 17:02:56.373348+05:30	145	TransanctionsModel object (145)	3		11	172
1075	2022-06-14 17:02:56.374639+05:30	144	TransanctionsModel object (144)	3		11	172
1076	2022-06-14 17:02:56.376163+05:30	142	TransanctionsModel object (142)	3		11	172
1077	2022-06-14 17:02:56.37759+05:30	138	TransanctionsModel object (138)	3		11	172
1078	2022-06-14 17:02:56.378889+05:30	137	TransanctionsModel object (137)	3		11	172
1079	2022-06-14 17:02:56.380392+05:30	136	TransanctionsModel object (136)	3		11	172
1080	2022-06-14 17:02:56.381896+05:30	126	TransanctionsModel object (126)	3		11	172
1081	2022-06-14 17:02:56.383343+05:30	124	TransanctionsModel object (124)	3		11	172
1082	2022-06-14 17:02:56.384642+05:30	122	TransanctionsModel object (122)	3		11	172
1083	2022-06-14 17:02:56.385994+05:30	121	TransanctionsModel object (121)	3		11	172
1084	2022-07-03 14:21:23.507714+05:30	430	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1085	2022-07-03 14:23:44.653081+05:30	431	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
1086	2022-07-03 15:23:55.296741+05:30	430	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1087	2022-07-03 15:24:02.153265+05:30	431	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1088	2022-07-03 16:41:29.285008+05:30	432	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1089	2022-07-04 13:32:57.953902+05:30	432	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1090	2022-07-04 13:33:15.654147+05:30	433	16321\t➤ IG 🇮🇳Indian Followers【 Upto +100K/Day\t🇮🇳【 Pure 100% 🇮🇳Indian【 0-15/min【 Lifetime Guarantee【 365Manual Refill💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1091	2022-07-04 13:40:26.958785+05:30	433	16321\t➤ IG 🇮🇳Indian Followers【 Upto +100K/Day\t🇮🇳【 Pure 100% 🇮🇳Indian【 0-15/min【 Lifetime Guarantee【 365Manual Refill💧-Processing	2	[]	10	3
1092	2022-07-06 19:30:27.690153+05:30	436	🏆 IG ➠ Followers【 High Quality【 Average Speed【 60Days Refill with Button 💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1093	2022-07-06 19:30:39.142618+05:30	435	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1094	2022-07-10 14:56:58.561315+05:30	438	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1095	2022-07-10 15:11:17.129727+05:30	438	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Processing	2	[{"changed": {"fields": ["Third party id"]}}]	10	183
1096	2022-07-14 15:36:56.65422+05:30	439	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1097	2022-07-14 15:39:38.601855+05:30	439	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Processing	2	[]	10	3
1098	2022-07-16 08:41:59.78657+05:30	439	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1099	2022-07-16 16:40:08.877181+05:30	440	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1100	2022-07-16 16:52:50.348804+05:30	440	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧-Processing	2	[]	10	3
1101	2022-07-18 17:39:56.521611+05:30	157	Tyagi	3		1	3
1102	2022-07-18 19:47:53.34662+05:30	183	Nikhil- 56.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
1103	2022-07-18 21:05:05.014544+05:30	22	Offers object (22)	1	[{"added": {}}]	18	3
1104	2022-07-18 21:05:48.138066+05:30	23	Offers object (23)	1	[{"added": {}}]	18	3
1105	2022-07-18 21:06:16.612423+05:30	24	Offers object (24)	1	[{"added": {}}]	18	3
1106	2022-07-18 21:15:28.467335+05:30	183	Nikhil- 21.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
1107	2022-07-18 21:47:08.168947+05:30	75	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧	2	[{"changed": {"fields": ["Rate"]}}]	4	3
1108	2022-07-18 21:48:46.21166+05:30	123	INSTAGRAM REELS VIEWS 💥💥✨	1	[{"added": {}}]	4	3
1109	2022-07-18 21:50:47.998068+05:30	124	INSTAGRAM LIKES 👍👍	1	[{"added": {}}]	4	3
1110	2022-07-18 21:51:18.194523+05:30	75	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧	2	[]	4	3
1111	2022-07-19 17:32:00.697905+05:30	444	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1112	2022-07-19 17:32:09.527556+05:30	445	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1113	2022-07-19 17:32:48.280869+05:30	443	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1114	2022-07-19 17:33:13.471288+05:30	444	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Processing	2	[]	10	3
1115	2022-07-19 17:34:51.774543+05:30	445	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1116	2022-07-19 17:35:01.152874+05:30	444	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1117	2022-07-19 17:36:39.167318+05:30	446	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]-Processing	2	[]	10	3
1118	2022-07-19 17:45:06.850425+05:30	75	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧	2	[{"changed": {"fields": ["Rate"]}}]	4	3
1119	2022-07-19 18:18:50.519382+05:30	450	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1120	2022-07-19 18:22:51.101967+05:30	450	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Processing	2	[]	10	3
1121	2022-07-23 12:04:25.002923+05:30	455	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1122	2022-08-01 22:02:28.47861+05:30	462	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1123	2022-08-01 22:29:57.460287+05:30	462	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]-Completed	2	[{"changed": {"fields": ["Third party id"]}}]	10	3
1124	2022-08-02 16:51:55.878739+05:30	82	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]🥵🔥👀	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
1125	2022-08-07 20:47:45.921406+05:30	192	- 0.0 Rs 	1	[{"added": {}}]	2	183
1126	2022-08-08 13:29:56.887487+05:30	2	INSTAGRAM REELS VIEWS 💥💥✨	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
1127	2022-08-08 13:30:11.777842+05:30	2	INSTAGRAM REELS VIEWS 💙💙💥💥	2	[{"changed": {"fields": ["Name"]}}]	3	3
1128	2022-08-08 13:31:44.983641+05:30	125	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙	1	[{"added": {}}]	4	3
1129	2022-08-09 12:04:53.380015+05:30	58	💲Instagram + Video views + Igtv + Reel [working] - (SUPER FAST⚡)	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
1130	2022-08-09 12:05:16.8664+05:30	59	Instagram Reel Views [Non Drop]  💜💜🥰💥	2	[{"changed": {"fields": ["Service id"]}}]	4	3
1131	2022-08-09 12:05:42.767934+05:30	34	💲Instagram + Video views + Igtv + Reel	2	[{"changed": {"fields": ["Service id", "Api"]}}]	4	3
1132	2022-08-09 12:06:14.106939+05:30	59	Instagram Reel Views [Non Drop]  💜💜🥰💥	2	[]	4	3
1133	2022-08-10 11:36:33.102686+05:30	470	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Pending	2	[]	10	3
1134	2022-08-10 11:36:51.677236+05:30	471	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1135	2022-08-10 20:39:51.212484+05:30	34	💲Instagram + Video views + Igtv + Reel	2	[{"changed": {"fields": ["Rate"]}}]	4	3
1136	2022-08-13 15:54:26.072427+05:30	474	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1137	2022-08-13 15:55:35.714653+05:30	476	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1138	2022-08-13 15:56:01.218218+05:30	473	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1139	2022-08-14 16:06:14.820664+05:30	486	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Processing	2	[]	10	3
1140	2022-08-14 16:06:27.906717+05:30	487	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1141	2022-08-15 13:40:25.862406+05:30	217	Harshit 	2	[{"changed": {"fields": ["Name"]}}]	1	183
1142	2022-08-15 13:40:39.019821+05:30	216	Harshit - 60.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	183
1143	2022-08-15 13:47:40.461735+05:30	83	🏆 IG ➠ Followers【 High Quality【 Average Speed【 60Days Refill with Button 💧	2	[{"changed": {"fields": ["Active"]}}]	4	183
1144	2022-08-15 13:48:14.83728+05:30	491	🏆 IG ➠ Followers【 High Quality【 Average Speed【 60Days Refill with Button 💧-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	183
1145	2022-08-18 11:34:45.135547+05:30	48	balram- 500.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	183
1146	2022-08-18 15:54:59.052432+05:30	504	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1147	2022-08-18 15:55:40.493821+05:30	48	balram- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
1148	2022-08-18 16:35:14.62113+05:30	207	Samrat- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
1149	2022-08-20 12:24:18.888038+05:30	125	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙	2	[]	4	3
1150	2022-08-20 12:25:20.13607+05:30	125	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙	2	[{"changed": {"fields": ["Description"]}}]	4	3
1151	2022-08-20 12:29:31.537652+05:30	126	🌍365 Days Refill -- Instagram Followers - {NON DROP} [ Max: 100K | Speed: 40000/D ] [ Superfast ][Recommended]	1	[{"added": {}}]	4	3
1152	2022-08-20 12:32:12.638227+05:30	126	🌍365 Days Refill -- Instagram Followers - {NON DROP} [ Max: 100K | Speed: 40000/D ] [ Superfast ][Recommended]	2	[{"changed": {"fields": ["Description"]}}]	4	3
1153	2022-08-20 14:57:07.895871+05:30	33	TOP SELLING SERVICES 🤩🤩☑️ { NON DROP }	1	[{"added": {}}]	3	3
1154	2022-08-20 15:02:15.902298+05:30	127	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀	1	[{"added": {}}]	4	3
1155	2022-08-20 15:02:43.997853+05:30	127	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
1156	2022-08-20 15:08:10.848695+05:30	128	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️	1	[{"added": {}}]	4	3
1157	2022-08-20 15:13:33.824825+05:30	129	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	1	[{"added": {}}]	4	3
1158	2022-08-20 15:20:40.484408+05:30	130	IG Organic 🇮🇳IND Followers【 Real & Active Profiles【 5K-50K/Day【 0-1Hrs	1	[{"added": {}}]	4	3
1159	2022-08-20 21:08:49.562272+05:30	506	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1160	2022-08-20 21:25:27.905743+05:30	131	IG 🇮🇳Indian Followers【 +40K/Day 🇮🇳【 90% 🇮🇳Indian【 Lifetime Guarantee【 R356 Days 💧	1	[{"added": {}}]	4	3
1161	2022-08-20 21:26:50.386068+05:30	131	IG 🇮🇳Indian Followers【 +40K/Day 🇮🇳【 90% 🇮🇳Indian【 Lifetime Guarantee【 R356 Days 💧	2	[{"changed": {"fields": ["Description"]}}]	4	3
1162	2022-08-20 21:33:05.10435+05:30	132	💎 IG » 𝗥𝗘𝗘𝗟 VIEWS || ALWAYS WORKING || SUPERFAST || Lifetime Guratantee ⚠️	1	[{"added": {}}]	4	3
1163	2022-08-20 21:34:16.652734+05:30	132	💎 IG » 𝗥𝗘𝗘𝗟 VIEWS || ALWAYS WORKING || SUPERFAST || Lifetime Guratantee ⚠️	2	[{"changed": {"fields": ["Description"]}}]	4	3
1164	2022-08-20 21:40:30.587641+05:30	133	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 Average Speed【 R30 🩸	1	[{"added": {}}]	4	3
1165	2022-08-20 21:45:40.219634+05:30	1	Instagram Followers With Refill Guarantee 🙋🙋🔥	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
1166	2022-08-20 21:45:51.661899+05:30	33	TOP SELLING SERVICES 🤩🤩☑️ { NON DROP }	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
1167	2022-08-20 21:46:08.958951+05:30	23	👸👸 Instagram female followers👸👸	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
1168	2022-08-20 21:46:24.720931+05:30	1	Instagram Followers With Refill Guarantee 🙋🙋🔥	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
1169	2022-08-21 11:56:19.847074+05:30	507	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 Average Speed【 R30 🩸-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1170	2022-08-21 11:56:32.669621+05:30	508	💎 IG » 𝗥𝗘𝗘𝗟 VIEWS || ALWAYS WORKING || SUPERFAST || Lifetime Guratantee ⚠️-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1171	2022-08-21 11:57:02.756721+05:30	41	Simmi- 0.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
1172	2022-08-21 18:36:51.817862+05:30	518	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1173	2022-08-21 18:38:43.175686+05:30	519	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Pending	2	[]	10	3
1174	2022-08-21 23:31:42.857146+05:30	265	TransanctionsModel object (265)	2	[]	11	3
1175	2022-08-22 20:03:15.986695+05:30	541	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧-Partial	2	[]	10	3
1176	2022-08-22 20:03:36.646296+05:30	539	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧-Completed	2	[]	10	3
1177	2022-08-22 20:09:31.033547+05:30	541	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1178	2022-08-23 16:03:46.478202+05:30	25	Offers object (25)	1	[{"added": {}}]	18	183
1179	2022-08-24 20:45:33.432223+05:30	575	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1180	2022-08-24 21:27:36.221374+05:30	579	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Processing	2	[]	10	3
1181	2022-08-24 21:30:10.94124+05:30	576	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1182	2022-08-24 21:30:39.226733+05:30	572	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1183	2022-08-24 21:39:40.319261+05:30	571	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1184	2022-08-24 21:40:09.197376+05:30	569	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1185	2022-08-24 21:40:39.346468+05:30	568	🇮🇳 ❤️ Instagram POST+REEL+IGTV Likes ~ Indian 𝗥𝗘𝗔𝗟 Users | High Quality || 10K-50k/Day || SuperFast🔥[Recommended]-Pending	2	[{"changed": {"fields": ["Third party id"]}}]	10	3
1186	2022-08-24 21:40:56.601377+05:30	567	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1187	2022-08-24 21:45:21.275496+05:30	554	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1188	2022-08-24 21:46:51.034106+05:30	560	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1189	2022-08-24 21:53:32.324927+05:30	132	💎 IG » 𝗥𝗘𝗘𝗟 VIEWS || ALWAYS WORKING || SUPERFAST || Lifetime Guratantee ⚠️	2	[{"changed": {"fields": ["Rate", "Service id"]}}]	4	3
1190	2022-08-24 21:56:33.826056+05:30	133	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 Average Speed【 R30 🩸	2	[{"changed": {"fields": ["Service id"]}}]	4	3
1191	2022-08-24 21:57:36.229838+05:30	500	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1192	2022-08-24 21:59:48.144404+05:30	133	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 Average Speed【 R30 🩸	2	[{"changed": {"fields": ["Rate"]}}]	4	3
1193	2022-08-24 22:00:26.612172+05:30	133	🏆 💥💥IG ➠ Likes【 100% NonDrop【 High Quality【 Average Speed【 R30 🩸🔥🔥	2	[{"changed": {"fields": ["Name"]}}]	4	3
1194	2022-08-24 22:02:01.265757+05:30	75	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧	2	[{"changed": {"fields": ["Average time minutes", "Service id"]}}]	4	3
1195	2022-08-24 23:53:03.103321+05:30	27	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 INSTAGRAM 】	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
1196	2022-08-24 23:53:11.912558+05:30	33	TOP SELLING SERVICES 🤩🤩☑️ { NON DROP }	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
1197	2022-08-24 23:53:18.75569+05:30	28	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 YOUTUBE 】	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
1198	2022-08-24 23:53:28.201324+05:30	27	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 INSTAGRAM 】	2	[{"changed": {"fields": ["Ranking"]}}]	3	3
1199	2022-08-25 09:47:45.439878+05:30	128	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️	2	[]	4	3
1200	2022-08-25 21:18:00.76652+05:30	133	🏆 💥💥IG ➠ Likes【 100% NonDrop【 High Quality【 Average Speed【 R30 🩸🔥🔥	2	[{"changed": {"fields": ["Description"]}}]	4	3
1201	2022-08-25 22:06:25.857207+05:30	595	🏆 💥💥IG ➠ Likes【 100% NonDrop【 High Quality【 Average Speed【 R30 🩸🔥🔥-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1202	2022-08-25 22:18:50.046892+05:30	556	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1203	2022-08-25 22:24:24.148977+05:30	588	Telegram Indian 🇮🇳🇮🇳 member  100%-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1204	2022-08-26 20:47:03.834883+05:30	606	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1205	2022-08-26 20:47:35.441725+05:30	605	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1206	2022-08-26 20:48:24.017237+05:30	603	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1207	2022-08-27 13:14:22.549263+05:30	618	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1208	2022-08-27 13:14:59.221517+05:30	616	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1209	2022-08-27 13:15:22.417605+05:30	612	YouTube Subscribers - [ Max - 10K | Speed: 3K/Day ] [ No Refill ] Start: 0-2hr 🔥-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1210	2022-08-27 13:17:23.201825+05:30	607	◾ 💎 Instagram Likes | Indian Real Users | High Quality 100% Indian | 10K | Fast ⚡Best In Market[recommended]-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1211	2022-08-27 13:17:41.650077+05:30	610	YouTube Subscribers - [ Max - 10K | Speed: 3K/Day ] [ No Refill ] Start: 0-2hr 🔥-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1212	2022-08-27 13:19:10.065336+05:30	598	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1213	2022-08-27 13:21:09.002285+05:30	609	IG 🇮🇳Indian Followers【 +40K/Day 🇮🇳【 90% 🇮🇳Indian【 Lifetime Guarantee【 R356 Days 💧-Processing	2	[]	10	3
1214	2022-08-27 14:22:36.581407+05:30	77	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧	2	[{"changed": {"fields": ["Rate"]}}]	4	3
1215	2022-08-27 16:51:53.952314+05:30	629	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀-Partial	2	[]	10	3
1216	2022-08-27 16:52:17.752321+05:30	629	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀-Partial	2	[]	10	3
1217	2022-08-27 16:52:30.630987+05:30	630	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀-Partial	2	[]	10	3
1218	2022-08-27 17:07:50.382583+05:30	629	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1219	2022-08-27 17:07:58.532108+05:30	630	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1220	2022-08-27 19:37:01.47629+05:30	624	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1221	2022-08-27 19:38:15.342038+05:30	627	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Pending	2	[]	10	3
1222	2022-08-27 19:38:30.230679+05:30	626	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1223	2022-08-27 19:38:38.660806+05:30	627	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1224	2022-08-27 19:39:17.300944+05:30	625	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1225	2022-08-27 20:17:53.886709+05:30	127	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀	2	[]	4	3
1226	2022-08-27 20:19:35.301205+05:30	629	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀-Completed	2	[{"changed": {"fields": ["Third party id"]}}]	10	3
1227	2022-08-27 20:19:57.174259+05:30	634	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Pending	2	[{"changed": {"fields": ["Third party id"]}}]	10	3
1228	2022-08-27 20:20:25.01914+05:30	633	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Pending	2	[{"changed": {"fields": ["Third party id"]}}]	10	3
1229	2022-08-27 20:20:48.236133+05:30	633	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Pending	2	[]	10	3
1230	2022-08-27 20:21:00.606185+05:30	634	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Pending	2	[]	10	3
1231	2022-08-27 20:21:31.228902+05:30	634	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Processing	2	[{"changed": {"fields": ["Status", "Third party id"]}}]	10	3
1232	2022-08-27 20:24:41.956577+05:30	632	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Processing	2	[]	10	3
1233	2022-08-27 20:25:01.887487+05:30	633	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
1234	2022-08-27 22:35:20.535326+05:30	628	Real Likes [Non drop] [Speed 10k/day] [Max-100k] R30 Instant Starte Video Likes [Non Drop]-Pending	2	[]	10	3
1235	2022-08-27 23:02:30.877373+05:30	628	Real Likes [Non drop] [Speed 10k/day] [Max-100k] R30 Instant Starte Video Likes [Non Drop]-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1236	2022-08-27 23:08:59.192829+05:30	623	YouTube Subscribers - [ Max - 10K | Speed: 3K/Day ] [ No Refill ] Start: 0-2hr 🔥-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1237	2022-08-27 23:10:39.860044+05:30	48	balram- 150.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	3
1238	2022-08-28 11:54:12.171579+05:30	643	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1239	2022-08-28 15:57:38.613981+05:30	642	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1240	2022-08-28 15:59:58.491253+05:30	506	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]-Processing	2	[]	10	3
1241	2022-08-28 18:19:44.196911+05:30	646	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️-Processing	2	[]	10	3
1242	2022-08-28 18:23:32.469562+05:30	640	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️-Processing	2	[{"changed": {"fields": ["Status", "Start count"]}}]	10	3
1243	2022-08-28 18:25:28.010657+05:30	640	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1244	2022-08-28 18:53:54.652233+05:30	650	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
1245	2022-08-28 21:01:47.329661+05:30	652	Instagram Comments-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1246	2022-08-28 21:57:10.43463+05:30	653	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️-In progress	2	[{"changed": {"fields": ["Status"]}}]	10	3
1247	2022-08-28 21:57:44.50257+05:30	653	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️-In progress	2	[]	10	3
1248	2022-08-28 23:16:02.109241+05:30	647	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1249	2022-08-29 01:09:27.047546+05:30	128	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️	2	[]	4	3
1250	2022-08-29 01:09:40.05572+05:30	129	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	2	[]	4	3
1251	2022-08-29 15:53:30.429031+05:30	654	✔Facebook - Post Likes || 30 Days Refill ||-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1252	2022-08-29 15:53:48.08636+05:30	652	Instagram Comments-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1253	2022-08-31 18:22:47.438526+05:30	672	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Pending	2	[]	10	183
1254	2022-08-31 18:26:03.895997+05:30	192	- 100.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	183
1255	2022-08-31 18:26:51.950423+05:30	192	- 1000.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	183
1256	2022-08-31 18:27:21.264068+05:30	672	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Processing	2	[{"changed": {"fields": ["Status", "Third party id"]}}]	10	183
1257	2022-08-31 19:24:13.451622+05:30	670	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Processing	2	[{"changed": {"fields": ["Status", "Third party id"]}}]	10	183
1258	2022-08-31 21:47:52.982959+05:30	676	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1259	2022-09-01 19:22:34.288914+05:30	303	Salman	3		1	183
1260	2022-09-01 19:52:33.19874+05:30	326	TransanctionsModel object (326)	3		11	183
1261	2022-09-02 00:00:08.57103+05:30	561	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 SuperFast【 R30 🩸-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1262	2022-09-02 00:01:28.838244+05:30	561	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 SuperFast【 R30 🩸-Cancelled	2	[{"changed": {"fields": ["Status"]}}]	10	3
1263	2022-09-02 00:03:57.58547+05:30	588	Telegram Indian 🇮🇳🇮🇳 member  100%-Completed	2	[{"changed": {"fields": ["Status"]}}]	10	3
1264	2022-09-02 16:38:09.711904+05:30	681	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1265	2022-09-02 21:28:22.725315+05:30	684	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1266	2022-09-03 13:12:44.864854+05:30	687	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1267	2022-09-03 18:16:48.850268+05:30	128	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️	2	[]	4	3
1268	2022-09-03 21:49:52.75734+05:30	692	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️-Processing	2	[{"changed": {"fields": ["Status"]}}]	10	3
1269	2022-09-04 14:45:01.2733+05:30	698	💎 IG » 𝗥𝗘𝗘𝗟 VIEWS || ALWAYS WORKING || SUPERFAST || Lifetime Guratantee ⚠️-Processing	2	[]	10	3
1270	2022-09-04 14:47:04.117296+05:30	35	TicketsModel object (35)	2	[{"changed": {"fields": ["Subject", "Status"]}}]	14	3
1271	2022-09-04 14:47:33.119003+05:30	35	TicketsModel object (35)	2	[{"added": {"name": "Message", "object": "message#42"}}]	14	3
1272	2022-09-05 18:21:20.738945+05:30	48	balram- 50.0 Rs 	2	[{"changed": {"fields": ["Money"]}}]	2	183
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	authapp	user
2	authapp	accountbalance
3	services	categorymodel
4	services	servicesmodel
5	admin	logentry
6	auth	permission
7	auth	group
8	contenttypes	contenttype
9	sessions	session
10	orders	ordersmodel
11	orders	transanctionsmodel
12	orders	ordertransanctionmodel
13	services	messagemodel
14	services	ticketsmodel
15	dashboard	counterorder
16	dashboard	settings
17	dashboard	api
18	services	offers
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-01-03 20:13:42.497607+05:30
2	contenttypes	0002_remove_content_type_name	2022-01-03 20:13:42.505721+05:30
3	auth	0001_initial	2022-01-03 20:13:42.553645+05:30
4	auth	0002_alter_permission_name_max_length	2022-01-03 20:13:42.559409+05:30
5	auth	0003_alter_user_email_max_length	2022-01-03 20:13:42.565478+05:30
6	auth	0004_alter_user_username_opts	2022-01-03 20:13:42.571626+05:30
7	auth	0005_alter_user_last_login_null	2022-01-03 20:13:42.577783+05:30
8	auth	0006_require_contenttypes_0002	2022-01-03 20:13:42.580048+05:30
9	auth	0007_alter_validators_add_error_messages	2022-01-03 20:13:42.586257+05:30
10	auth	0008_alter_user_username_max_length	2022-01-03 20:13:42.592415+05:30
11	auth	0009_alter_user_last_name_max_length	2022-01-03 20:13:42.598816+05:30
12	auth	0010_alter_group_name_max_length	2022-01-03 20:13:42.605678+05:30
13	auth	0011_update_proxy_permissions	2022-01-03 20:13:42.613051+05:30
14	auth	0012_alter_user_first_name_max_length	2022-01-03 20:13:42.619127+05:30
15	authapp	0001_initial	2022-01-03 20:13:42.669721+05:30
16	admin	0001_initial	2022-01-03 20:13:42.695261+05:30
17	admin	0002_logentry_remove_auto_add	2022-01-03 20:13:42.703426+05:30
18	admin	0003_logentry_add_action_flag_choices	2022-01-03 20:13:42.712041+05:30
19	authapp	0002_money	2022-01-03 20:13:42.732309+05:30
20	authapp	0003_rename_money_accountbalance	2022-01-03 20:13:42.751822+05:30
21	services	0001_initial	2022-01-03 20:13:42.773417+05:30
22	services	0002_auto_20211231_0317	2022-01-03 20:13:42.779102+05:30
23	services	0003_alter_servicesmodel_service_id	2022-01-03 20:13:42.783697+05:30
24	sessions	0001_initial	2022-01-03 20:13:42.802233+05:30
25	authapp	0004_alter_accountbalance_money	2022-01-08 20:30:07.363887+05:30
26	services	0004_alter_servicesmodel_rate	2022-01-08 20:30:07.384983+05:30
27	orders	0001_initial	2022-01-08 20:30:07.415696+05:30
28	orders	0002_auto_20220108_1115	2022-01-08 20:30:07.439277+05:30
29	orders	0003_transanctionsmodel	2022-01-08 20:30:07.460532+05:30
30	orders	0004_auto_20220108_1509	2022-01-08 20:30:07.50064+05:30
31	orders	0005_alter_ordertransanctionmodel_options	2022-01-08 20:30:07.514303+05:30
32	orders	0006_auto_20220108_2056	2022-01-08 21:18:49.072466+05:30
33	orders	0007_transanctionsmodel_transaction_id	2022-01-08 21:18:49.084586+05:30
34	orders	0008_alter_transanctionsmodel_amount	2022-01-08 21:18:49.104479+05:30
35	services	0005_messagemodel_ticketsmodel	2022-01-14 17:18:03.563227+05:30
36	dashboard	0001_initial	2022-01-14 17:37:58.841859+05:30
37	services	0006_auto_20220114_1727	2022-01-14 17:37:58.864832+05:30
38	services	0007_categorymodel_ranking	2022-01-22 19:46:01.6777+05:30
39	services	0008_auto_20220122_1942	2022-01-22 19:46:01.702868+05:30
40	authapp	0005_alter_accountbalance_updated	2022-01-24 12:41:54.348079+05:30
41	dashboard	0002_settings	2022-01-24 12:41:54.360242+05:30
42	dashboard	0003_auto_20220123_2147	2022-01-24 12:41:54.375793+05:30
43	dashboard	0004_alter_settings_options	2022-01-24 12:41:54.379698+05:30
44	orders	0009_auto_20220123_2237	2022-01-24 12:41:54.405631+05:30
45	orders	0010_auto_20220123_2239	2022-01-24 12:41:54.432612+05:30
46	services	0009_remove_servicesmodel_service_id	2022-01-24 12:41:54.441957+05:30
47	services	0010_auto_20220124_1246	2022-01-24 12:52:21.425946+05:30
48	orders	0011_ordersmodel_start_count	2022-01-24 20:55:32.432531+05:30
49	dashboard	0005_auto_20220203_1932	2022-02-03 20:01:59.795752+05:30
50	services	0011_auto_20220203_1932	2022-02-03 20:01:59.805986+05:30
51	dashboard	0006_settings_whatsapp_no	2022-02-10 16:59:55.936738+05:30
52	services	0012_alter_categorymodel_options	2022-02-10 16:59:55.943573+05:30
53	authapp	0006_user_api_key	2022-02-22 19:36:50.018092+05:30
54	authapp	0007_alter_user_api_key	2022-02-22 19:36:50.057445+05:30
55	dashboard	0007_api	2022-02-22 19:36:50.073396+05:30
56	dashboard	0008_auto_20220222_1625	2022-02-22 19:36:50.083199+05:30
57	orders	0012_ordersmodel_remaining	2022-02-22 19:36:50.097541+05:30
58	orders	0013_auto_20220222_0352	2022-02-22 19:36:50.124095+05:30
59	orders	0014_auto_20220222_0353	2022-02-22 19:36:50.151143+05:30
60	orders	0015_rename_remaining_ordersmodel_remains	2022-02-22 19:36:50.165511+05:30
61	services	0013_auto_20220220_1706	2022-02-22 19:36:50.202031+05:30
62	services	0014_servicesmodel_service_id	2022-02-22 19:36:50.208716+05:30
63	services	0015_offers	2022-02-22 19:36:50.238488+05:30
64	services	0016_rename_is_refill_servicesmodel_refill	2022-02-22 19:36:50.245665+05:30
65	dashboard	0009_auto_20220228_1548	2022-02-28 18:33:06.105595+05:30
66	dashboard	0010_alter_settings_favicon	2022-02-28 18:33:06.160998+05:30
67	dashboard	0011_rename_decription_settings_description	2022-02-28 18:33:06.169551+05:30
68	dashboard	0012_settings_site_title	2022-02-28 18:33:06.176578+05:30
69	dashboard	0013_settings_whatsapp_message	2022-02-28 18:33:06.182089+05:30
70	dashboard	0014_remove_settings_favicon	2022-02-28 18:33:06.187698+05:30
71	services	0017_offers_offer_type	2022-03-03 14:45:28.817047+05:30
72	services	0018_alter_offers_service	2022-03-22 00:18:15.417565+05:30
73	dashboard	0015_auto_20220610_2254	2022-06-10 23:45:35.243536+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2ael2svth6wsufj3q0mffaerhuvx7gqw	.eJxVjEEOwiAQRe_C2pABhiAu3XsGMsAgVQNJaVeNd9cmXej2v_f-JgKtSw3r4DlMWVyEMuL0O0ZKT247yQ9q9y5Tb8s8Rbkr8qBD3nrm1_Vw_w4qjfqtkaPHYjEZZRxoh5Csh7MjbwozKKWRCgDo7JONrGx2no0ugJEKEYn3B-hPN-k:1n98tA:I9nQpkz9cF6K87VKeYzzx5WKHvJsoxrKFUjQP4hOsus	2022-01-30 22:30:20.104445+05:30
yp33vx9737jk6v0k3tl0hqvyc3jstcsh	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1n4kI4:EaOTwAbO5aKq83_hkz6bR4PQgP2wgxiMv2hg199wRzQ	2022-01-18 19:25:52.872601+05:30
3p3own4asxgiz2y3khmagfckykrcvn37	.eJxVjDsOwyAQBe9CHSGzxsCmTO8zID5LcBKBZOwqyt2DJRdJOzPvvZl1-5bt3mi1S2RXJiS7_ELvwpPKYeLDlXvloZZtXTw_En7axuca6XU727-D7Fru69EZoYkSGfIYFICngAnUmNBoSCiD152RFDh1DmDSiIrCgA6HOEX2-QIliDiQ:1n98u6:L5Zb2NSUhktWnnb6msACAibAIogJc7s5N_XWQHdWyj8	2022-01-30 22:31:18.280149+05:30
vpbor7aag0hjplilrrhxk95vonz76ylv	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nDpOJ:Q1Z3I_D5HWuTCy5JS18JxFV7X3uJeaqYR2b_-41x894	2022-02-12 20:41:51.574658+05:30
wb1jhpxus8y520r4jegstlr0gjekfld8	.eJxVjEEOwiAQRe_C2hCgUIpL956BDMyMVA0kpV0Z765NutDtf-_9l4iwrSVunZY4ozgL7cTpd0yQH1R3gneotyZzq-syJ7kr8qBdXhvS83K4fwcFevnWoJRm7UMK6JMjBsejJo92oikhkDeDtcgENgQKZsyBeQBmZGOst0q8PyupORA:1n9LcZ:_-ZKECubcYGZn7EMGtziSmEKAn6HaucTR5W5HWDjl4c	2022-01-31 12:06:03.335676+05:30
gsq32e1lflxl5rjj4baj4n95mgcau3r2	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1n6QzJ:jU1HNnw8Y_Mai5OXDMHQ8D6KrM51AuRT-UUjLQ7_SFk	2022-01-23 11:13:29.788025+05:30
jpghhzehriatgw60lky0oawkovv4i8xw	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1n9NK4:0SJygTLUesBM3bEloGnHdSaTBZN9fY9uPT_oJAUCrlc	2022-01-31 13:55:04.184495+05:30
iuekzpnsml55v1ok1sffxlbj3q3cmb7t	.eJxVjDEOwjAMRe-SGUUkctKWkZ0zRHZskwJKpaadEHdHkTrA-t97_20S7ltJe5M1zWwuxkVz-h0J81NqJ_zAel9sXuq2zmS7Yg_a7G1heV0P9--gYCu9RvCMKB5UAoUpYj6LC6PiQOwAWIFGzx4zqI85DqwKihBIpqCBzecLQ9A5tw:1n9NlS:wWCy3jHRzGJkpyw_OshM7ZffMXL9DxoJDkGVUtBmaxo	2022-01-31 14:23:22.712996+05:30
pxy8t63eba8la7cfoe6bnnpyvjbadx9m	.eJxVjDkOwjAQRe_iGlne8EJJnzNYM_YMDqBYylIh7g6RUkD733v_JTJsa8vbQnMeq7gIHcTpd0QoD5p2Uu8w3bosfVrnEeWuyIMucuiVntfD_TtosLRvrYJnZONKIiADClNy5NnGmIjRBg4lgnFcVVGMOgDaREqrdHaeovbi_QEpUzh4:1n9OIz:jBZXPq9kUD-n0jGN9z5UVYAWzKVs2ueB5w8ehiGhmT8	2022-01-31 14:58:01.224082+05:30
2nqeede74dmh63ipzh4bd6gsf2dz4chs	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1n9Rh0:czcrNjCjDtJPqQK8YuG_riMRfjDPBOaI2Lc_-msTc1g	2022-01-31 18:35:02.491103+05:30
8xfw3m3uqgyq2z9i2vd4trw8c3civ1rs	.eJxVjEEOwiAQRe_C2hBgGKgu3fcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXERWonT7xgpPbjtJN-p3WaZ5rYuU5S7Ig_a5Thnfl4P9--gUq_f2vLZl-RBgcGkUWdWzmWjgNFGYIUweDeQt6SzInSFPHKJgGjAgLbi_QHmVDcC:1n9RhF:dMlXgPIu3gLFz6QFrQ5MZohih_mWiqkerSEnXmmd-Vc	2022-01-31 18:35:17.786528+05:30
4g8bvv8wq3bpuq0spjygtz5o5l8p9nwj	.eJxVjDsOwjAQBe_iGlkQxz9K-pzB2l2_4ABKpDipEHeHoBRQPenNaJ4q0bqUtFbMacjqrE5BHX5PJrlj3Ei-0XidtEzjMg-sN0XvtOpuynhcdvcvUKiWb9fBB--DWDYWDZxIzxRJGhdajoi2bxCBaIS9O4phtET0mSwIRr3eJBc5cw:1n9V11:OtrhekCnZe9wctRUlr2nd2DD7DSYkCw5VNmNHxI-LMA	2022-01-31 22:07:55.87526+05:30
jk9v8w72f3dbtn58q84t0vto6knjj60m	.eJxVjDsOwjAQBe_iGln-yjYlPWewdr1rHECOFCcV4u4QKQW0b2beS2TY1pa3wUueSJyFTuL0OyKUB_ed0B36bZZl7usyodwVedAhrzPx83K4fwcNRvvWBbQtjFUHSwkBfIyKqHpldWJlIwcHHIwy6NBYdM5VY7AoU2vxPoB4fwAkQTh9:1n9iaX:tAIMfVPuLgJBwRrAa5080OGcfsyiogTrENbTS7uVuCQ	2022-02-01 12:37:29.650956+05:30
c34n186fu7dqmmhlxxog0sasqm9uv98y	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1n8Ijx:B00ePBm-3y4WDH3LxOMIh2DQipcM-HeV-XXG9FA4I4A	2022-01-28 14:49:21.813462+05:30
gs2qyok730pbam7bxlwlznp8hekpy5o2	.eJxVjEEOwiAQRe_C2pAOOAVcuu8ZmikzSNVAUtqV8e7apAvd_vfef6mRtjWPW5NlnFldlOnU6XecKD6k7ITvVG5Vx1rWZZ70ruiDNj1Uluf1cP8OMrX8rQOQS-gTBIEEZFzqGYBsJ-IsRuQgbPHssQfDyQaDoQeMyfpoO3Ks3h__Dzex:1n9jnK:Oa9U3cljeBL3Sopree0dEV54chUHwqwxQ8VZBOEVolA	2022-02-01 13:54:46.898765+05:30
t1y97ol2zy1uap2yjk1lp9d8uujy15ig	.eJxVjEsOwjAMBe-SNYpsU8UNS_acIbIThxZQK_Wzqrg7VOoCtm9m3uaSrEuX1tmm1Bd3cYTu9Duq5KcNOykPGe6jz-OwTL36XfEHnf1tLPa6Hu7fQSdz961FoQ1cORshIHI0YamVCgYEi9ZWJsBA2khLrBorcAQokK3Bsxb3_gAD9Tfx:1n9qE0:hCcXGcqg8i-pPh2PhyEZqYUFv0zHQ1QbJWDveqOpHV8	2022-02-01 20:46:44.547738+05:30
h4pm0xy7kut89yhjkqbhjfpswv4enkn3	.eJxVjDsOwjAQBe_iGln-xFqHkp4zWOvdNQ4gR4qTCnF3iJQC2jcz76USbmtNW5clTazOyjl1-h0z0kPaTviO7TZrmtu6TFnvij5o19eZ5Xk53L-Dir1-a3CZDBNBCBxQIAB4scYHdANaocGXHAvHAmLHglyyK0a8D4J2zJHV-wMiGDki:1nA53I:_u-AhBY-kZgEz7YvvBdBbNcSRofctAbrQNf2nTwEvdM	2022-02-02 12:36:40.69848+05:30
92597owcegzt5nwsl3hwp7nre6x26z16	.eJxVjMEOwiAQRP-FsyFsl1Dw6N1vILtApWogKe2p8d-lSQ96nHlvZheetjX7raXFz1FchRGX344pvFI5QHxSeVQZalmXmeWhyJM2ea8xvW-n-3eQqeW-1mSNc2gRNQfVg2IzAIwRrEZFaELPadI2jIAAmhM6pw1CmgYDkcXnC7EYNq0:1n8YUQ:lK9jfbPQ88nPflrWZ4AiiuaGrnZixQThPyrsVneB5wo	2022-01-29 07:38:22.908962+05:30
a7nz7zl4uewxkqcj1i12o2wckadu5032	.eJxVjDsOwjAQBe_iGllefxNK-pzBWu8aHEC2FCcV4u4QKQW0b2beS0Tc1hK3npc4sziLIE6_W0J65LoDvmO9NUmtrsuc5K7Ig3Y5Nc7Py-H-HRTs5Vsja4OWTNbeoxuUYs-gR1LeWOuQiBwko0dOADg4ZTUAmKCtvzoIaMX7A9EDNrk:1n8dte:XhyhsYAztNvBhAvXz5jj0QpBq-FeGU_yg4AGIr49QUs	2022-01-29 13:24:46.2887+05:30
d8ghddpjci4qj6djghl6hzmj5ajg8qfp	.eJxVjDsOwyAQBe9CHaHlDynT-wyIhXVwEmHJ2FWUu0dILpL2zcx7s5iOvcaj0xaXwq7Ms8vvhik_qQ1QHqndV57Xtm8L8qHwk3Y-rYVet9P9O6ip11EbLCYkJ0mmIAVZ51Fo0kIFMuQB5JwdOgUEarZIrpDP2oGH4IsCyz5f4783gg:1n8n8U:-yxwbGALyp4RYRjGISjUZkFHVMYW7xMdI8rjNrYa9hE	2022-01-29 23:16:42.106337+05:30
43ubkpw8attehy2qzsa2jkw6tkwkhvah	.eJxVjDsOwjAQBe_iGllZ28RZSnrOYO3H4ABypDipEHeHSCmgfTPzXibRupS0tjynUc3JoDn8bkzyyHUDeqd6m6xMdZlHtptid9rsZdL8PO_u30GhVr516EIk8Zp7QIVeBlH05BwgCgKTx8jeDUodE2OIwDGywJWPPjNlZ94f5r84Ww:1n8wkL:cP33e9Pwwi9ir--GrG8b8R0k_YhxYV7nzIG9tyEm7Ek	2022-01-30 09:32:25.548373+05:30
u5ezl42pq9y9y390uu9rk5jcxrav1t0x	.eJxVjDsOwjAQBe_iGlmx4x-U9JzBWq93cQDZUpxUiLuTSCmgfTPz3iLCupS4dprjlMVFaCNOv2MCfFLdSX5AvTeJrS7zlOSuyIN2eWuZXtfD_Tso0MtWIw3IbgxnZI-sQGtmUiOlzFlbYwJq55isJxyIAwen0HpGyqODrRWfL0V5Ocg:1nAB4Y:JEAR9J0pKMVIpbf3fO5TFMA8cug_NEbjFBayzXPgpRo	2022-02-02 19:02:22.318214+05:30
uyilczt1k6s0lt5qivu8m8tqkx7acre4	.eJxVjDsOwjAQRO_iGln-bPCakp4zWOsfDiBbipMKcXccKQVMOe_NvJmjbS1u62lxc2QXJhU7_ZaewjPVncQH1XvjodV1mT3fFX7Qzm8tptf1cP8OCvUy1jqAATllzJMh1CMBBHlBKMgIhdHKlCEPhAas9SiDkhajR8j6LDX7fAHn1zcf:1n98UH:PD6mhLoAdAZSBuS6Hn5vpEFDmsGypmalEG95Qr3jps4	2022-01-30 22:04:37.097876+05:30
ehs6ucmkp6435tvopefqrp4p66i0eai6	.eJxVjMEOwiAQRP-FsyHdFSh49O43kKW72KqBpLQn47_bJj1oMqd5b-atIq3LGNcmc5xYXRRadfotEw1PKTvhB5V71UMtyzwlvSv6oE3fKsvrerh_ByO1cVs7Tg6zYOqdEWbuwGYAzDCYwN1ZyIMNgYJ3xnQoHjz0xvSwBbOjpD5fBiQ3SQ:1nAUET:gGgo6aBcLREhRfs_5CxDGMSvpRnefxWQw-MeLEasF9M	2022-02-03 15:29:53.337291+05:30
bzrhccga1ix19r0musjsyafouq32217p	.eJxVjDsOwjAQRO_iGlnOGv8o6XMGa9drcADZUpxUiLuTSCmgmWLem3mLiOtS4trzHCcWFwFWnH5LwvTMdSf8wHpvMrW6zBPJXZEH7XJsnF_Xw_07KNjLtr4ZcsoS-qw8WmTnQBsyFCBoywEzedxSKWcH8KDAwuD1OSQm8gxafL4HSTem:1nAqgR:MObyORlqXAY76gShvZpji4XhUIcEgoxdnxY7DUH6KSg	2022-02-04 15:28:15.794966+05:30
yumj2o7n78dakx09ef7vxdf2u1p2vvcc	.eJxVjMsOwiAQRf-FtSHAUMa6dN9vIDM8pGogKe3K-O_apAvd3nPOfQlP21r81tPi5yguAp04_Y5M4ZHqTuKd6q3J0Oq6zCx3RR60y6nF9Lwe7t9BoV6-9RA1ZMVGJVCkRgJrzpYjWRMIwA2ZAS3mERlS1kYhakNgnLKgKSKI9wf2rDck:1nIQKy:mZx7QzzKo4wJO5YThM630Uo75WJzf0sFuxARgFPLLyc	2022-02-25 12:57:24.81385+05:30
6804itf0kjj4lufaiwmyiig6zdjmf97k	.eJxVjMsOwiAQRf-FtSGMyKMu3fcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxJXoZU4_Y6E8cl1J-mB9d5kbHWZJ5K7Ig_a5dgSv26H-3dQsJetdj4imKgNGg-ozkYpG5XiCybn7ZAT-5wAALUnPVjHFMkQAedN8Yji8wX_Ujiv:1nBEPx:1fdSg6ZYWcM2WndSMbkVUDRQJmQhH8nIlbNZCO53lNQ	2022-02-05 16:48:49.044042+05:30
gw4ro9lhrldp6ggw5239wilmjuuns3e9	.eJxVjDEOwjAMRe-SGUU4MUnLyM4ZIsd2SQGlUtNOiLtDpQ6w_vfef5lE61LS2nROo5iz8WgOv2MmfmjdiNyp3ibLU13mMdtNsTtt9jqJPi-7-3dQqJVvjeHokD24HFhc1xMMTn0YkAgZMjgnCiQnHyPHPngWwRA8AGqM2qF5fwD6CTea:1nBbea:gdMQer4IPzL3rm-9Et1tdlPq1olMsoQ2ghWYWty-nv0	2022-02-06 17:37:28.467366+05:30
3alobfocyu2agzeib2t02z54hcd5h7e9	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nFbt2:llzh3Tvv836b1neRmr7KPMR1vXJ3AiR1XwlZ1JPCjJo	2022-02-17 18:40:56.747359+05:30
erykdtpmnno2pyiy6frekhm9y7ljssgw	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nFgyc:BOrNj3S6sPuyZXXyC_fASb1CEN4MQqSu8Qu5b3GVri0	2022-02-18 00:07:02.574678+05:30
xn8q1lswtpmbr1whcf0z633oejj5c05f	.eJxVjDsOwjAQBe_iGlle_0NJzxmstXeDA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOwRpx-x4zlwW0ndMd2m2WZ27pMWe6KPGiX15n4eTncv4OKvX5rVoWUNzRoDJ59KAqcj9rAGNHZAKpkx6RdyRCCdhDjqE1E63AAzUji_QHxwjdu:1nD4LJ:FcISDexf07RF04aAh8mojhEz4W8eGCkVDhugygkWwuU	2022-02-10 18:27:37.926685+05:30
pis8sd171b6rldtt3cyuw9q7sags5prn	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGOis:qY8o8ni83gnXKlhLDmwdCgTQ_I1Uwh0ct8ng9FmVX5M	2022-02-19 22:49:42.247623+05:30
ttrto8zn31rqd0srjybsq6rb31s5ez1e	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nD7TJ:i7SehuqVoMZfaiCysqgoOffZzJlw2frLvMsid69AqAY	2022-02-10 21:48:05.59019+05:30
9ftvvd50uozl2rvsbu53y5907dltqro4	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGhIB:-9yVX9Cvf-jcgJN0LqZJCoz1OkY8aQfkW_cPy7qP2h0	2022-02-20 18:39:23.891983+05:30
k6wml49bva935xwqxcuibwe0tbkleabf	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nDpPj:plt9PDkigwlzHto9iQnacFNeRE1oDW-69xbqXTNPY3k	2022-02-12 20:43:19.917507+05:30
vqr64bapgemz8gbn3a047ig68jwuibwz	.eJxVjDsOwjAQBe_iGln-7campOcM1sZr4wBypDipEHeHSCmgfTPzXiLStta49bzEicVZgBan33Gk9MhtJ3yndptlmtu6TKPcFXnQLq8z5-flcP8OKvX6rYtCxuDZGi7BWTSMoLHkIVjnQQGR8XlAJC6OwKFOFIxH751VBlIR7w_vLzc2:1nHgcO:fxKWNQ15XzJf3BfUK_gLXCZSrsf9jaDNWLJ0rFVeh9Y	2022-02-23 12:08:20.41271+05:30
z41au8e1z52d7vpt8ehnbkqcf6b2lt6m	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nHrF9:qzSphljvKKHB_xOItdpf9VU6_GLN8vhhxU7xkCpVrmc	2022-02-23 23:29:03.611869+05:30
e6142comwecwqom8b745f92kgu8cj2s3	.eJxVjDsOwyAQRO9CHSEwLAsp0_sMaM0nOIlAMnYV5e6xJRdJN5r3Zt7M07YWv_W0-DmyKwPLLr_lROGZ6kHig-q98dDquswTPxR-0s7HFtPrdrp_B4V62dcoyVoIlK0cjEgh2qwh7gEzOmcsaDMo57QhDdkQKFBZhChBYEJtkH2-_c03Qw:1nI6Vi:H1j_Cz1nEEUzKtJEyRAjHWyUtlTkYX0c6_8bIpvmChI	2022-02-24 15:47:10.572865+05:30
tvbz84n4o38k0tq6gffjkr1e86ze2dew	.eJxVjEEOwiAQRe_C2hCgMFCX7j0DGZipVA0kpV0Z765NutDtf-_9l4i4rSVunZc4kzgLsOL0OybMD647oTvWW5O51XWZk9wVedAur434eTncv4OCvXxr6wMp54i8CSErwtH5oDVwVhOQ8d5ZDXmCoHhAhDR6VmzBDeA4JDTi_QHyXzeP:1nI7Gj:Kt6tGeRMUrsCyLMqCi_thZ7E_MZ9x520nAzXFYDldD0	2022-02-24 16:35:45.07216+05:30
y9m6s6dr2swsajw8o49x8a8n9ecqbeed	.eJxVjMEOwiAQRP-FsyHAlgU9evcbCCyLVA1NSnsy_rtt0oNmbvPezFuEuC41rJ3nMGZxEejF6bdMkZ7cdpIfsd0nSVNb5jHJXZEH7fI2ZX5dD_fvoMZet7XRLqktSF4XA9FbQmXorIBBszMDF2uMVgWZNIEbMAGl7ACTjYAgPl_2pzeN:1nIBSS:6peVQ0HzLkunMYn7cxCBa0WB48VFoeko_jWdwNz9geQ	2022-02-24 21:04:08.338947+05:30
14k24a8jvgmf3w8lr635k151huvldojo	.eJxVjMsOwiAQRf-FtSEDFBhcuvcbCI9BqgaS0q6M_65NutDtPefcF_NhW6vfBi1-zuzMhLDs9LvGkB7UdpTvod06T72tyxz5rvCDDn7tmZ6Xw_07qGHUbw0uYopaJCWLRGOFkBCsycXYiTIpSigAFTiDxhlNJRabVEGdlVQAE3t_ABi-N4Y:1nMlEm:z0npOLW_s7ZTjou3B0vX4jdChDzYXN5DM_9wsSUhYIo	2022-03-09 12:04:56.520969+05:30
5ydcaxtr39n8lukueslx5ouqiyqmfgc9	.eJxVjEEOgjAQRe_StWk6ZVqoS_ecoZmZjoIaSCisjHdXEha6_e-9_zKZtnXIW9Ulj8WcDaA5_Y5M8tBpJ-VO0222Mk_rMrLdFXvQavu56PNyuH8HA9XhWyNybEIqErqWk_McEnderggEMVEUjKqhKHUiPqYGAZxHT-wAoSmteX8A-Gs3aQ:1nITf0:sJDDQXCJRQNzCzZLV1PpJi1nI4TuvyaovHoVwv3g2To	2022-02-25 16:30:18.568812+05:30
swlpdcsnrnokius8cvit8a03w5lbmafo	.eJxVjDkOwjAUBe_iGlnfS2Kbkp4zWP5LcAAlUpxUiLtDpBTQvpl5L5XLtta8NVnyyOqsolOn3xELPWTaCd_LdJs1zdO6jKh3RR-06evM8rwc7t9BLa1-awFwRga0SfokCIOPyQb0gbyRXqQrVCxz5wwbHsQCkscUQk8AFMmp9wch_jjA:1nIZYy:KdAWZfgJ_EKZAyScEG_ppRjv2FhQwQAQqQTuyyR0Jo4	2022-02-25 22:48:28.638572+05:30
v36qbr9p2aa7lfk3g1ek5adkrefsncay	.eJxVjDsOwjAQRO_iGln4v6Gk5wyWd73GAeRIcVIh7k4ipYBuNO_NvEVM61Lj2nmOYxYXAYM4_ZaY6MltJ_mR2n2SNLVlHlHuijxol7cp8-t6uH8HNfW6rQmt96gtOywUAECjU4HOZgtssKBm51gjUEisrDGkQJElT-AHKFl8vhyZOHk:1nJ4tB:QCf3Bj1x3Nt2PKZCu6pbAXD4LAzFWUw7g9fG-YegbLk	2022-02-27 08:15:25.448936+05:30
o4bz5xxsnyv52hcokaeec0gdb6om0zo2	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nJr8i:FQNR9DLpqxxkjs6sg5vA9OHe347IH3Cx9zC_3DcXJlc	2022-03-01 11:46:40.614191+05:30
g4b0bchutpn6ocpuh770xnxh7x82zq1o	.eJxVjDsOwjAQBe_iGln24i8lfc5g7a5tHECJFCcV4u4QKQW0b2beSyTc1pa2XpY0ZnERMYrT70jIjzLtJN9xus2S52ldRpK7Ig_a5TDn8rwe7t9Bw96-NQCVGnQkx6B95FrIK3ZoIoEBLNaB8lgRnNM2sGNjz6YCUVAhqOrF-wMUUzfi:1nKalN:b3K13kUQIbDJLH4krMCf68TdVFhzEtH2ZG8qsTsOi-M	2022-03-03 12:29:37.662144+05:30
4zbrcqzufmjm2k4jnhglaf6d9fv9m3nf	.eJxVjEEOwiAQRe_C2hCmDiAu3XsGMgODrRpISrsy3l2bdKHb_977LxVpXca4dpnjlNVZgQF1-F2Z0kPqhvKd6q3p1OoyT6w3Re-062vL8rzs7t_BSH381mxtEhvCAAhMpQg69gGQwAtmhuySJ7Q0ZA_HYuyJS0JH4g0NxXhU7w83HziI:1nL4Ds:s9WLWAT58KcqLwIE_OvtiE-SObrHQPpyuWyk22bsLys	2022-03-04 19:57:00.701559+05:30
7aopxovrj90vj5oupo619ad0hlwtmt5o	.eJxVjDkOwjAUBe_iGll4U2xKes5gff8FB5AjxUkVcXeIlALaNzNvUxnWpea185xHUhdlzkGdftcC-OS2I3pAu08ap7bMY9G7og_a9W0ifl0P9--gQq_fGo1JDGI4QnRJghXjEVMKNAh4cVYiBQJmYl9i8kUsBpcGCxF9dKzeH1NqOUY:1nLQ1N:k_B1XuoD_TZAY91uB8wNi8uavQWKKm27URQf76yJ9xA	2022-03-05 19:13:33.664639+05:30
cfpyypwjzzcee2xvvji5nmqau9ee01rq	.eJxVjDsOwyAQRO9CHSEwLHhTpvcZrIWF4CQCyZ8qyt1jSy6SaqR5b-YtRtrWMm5LmseJxVVoheLy2waKz1QPxA-q9yZjq-s8BXko8qSLHBqn1-10_w4KLWVfQ4fKWsPco88EbIg9KIceqAM0Dm3gqJ0POTsFxu2BOidFWTFB6MXnCxU4OCI:1nLmUo:5p1kzMgT_myi2fJPqqgaPj6_0co--mtvbTLrNtucbWo	2022-03-06 19:13:26.412642+05:30
sdyi7ixdxcba50obj6mbcif6snf1ljjg	.eJxVjEEOwiAQRe_C2hBgSiku3fcMZIAZqRqalHZlvLtt0oVu_3vvv0XAbS1ha7SEKYur0NqIy-8aMT2pHig_sN5nmea6LlOUhyJP2uQ4Z3rdTvfvoGArew1InhOoOCBb5ogELjpLhK7XTAps53borfMAyoDqASF1ZHU2gzIsPl9Kpzgv:1nM7vI:BCSsIMG3m70DH9ks0dfL4JhUDfBlLRji2X0CY4lYhGs	2022-03-07 18:06:12.329226+05:30
yhjg7qz190rzyxdwwt4nuhesn3ftyuev	.eJxVjDsOwyAQRO9CHSEwLHhTpvcZrIWF4CQCyZ8qyt1jSy6SaqR5b-YtRtrWMm5LmseJxVVoheLy2waKz1QPxA-q9yZjq-s8BXko8qSLHBqn1-10_w4KLWVfQ4fKWsPco88EbIg9KIceqAM0Dm3gqJ0POTsFxu2BOidFWTFB6MXnCxU4OCI:1nMRXH:-VIHuhy5OemnuvzFn9SLSrBHS9uabfzMHAR15PBQktw	2022-03-08 15:02:43.937477+05:30
zrtlww9ck8hjgb1do4w1jrhhtpj9k0za	.eJxVjEEOwiAQRe_C2hBgkIJL956BzDBUqgaS0q6Md7dNutDtf-_9t4i4LiWuPc9xYnER2hpx-l0J0zPXHfED673J1OoyTyR3RR60y1vj_Loe7t9BwV622iggfQatnWUDZEHRGLIBxQR-VBuwIeHgwYdkBzAKKbig0bPTHtGIzxf1kjb7:1neBGa:_-Dag_VpDF_ByfLTAmLr-yaZMxgN1vZa7x2igiiGCUg	2022-04-26 13:18:48.013737+05:30
fl4p4ii1huzfyuaah2sv49n5f6xp6it9	.eJxVjTkOwjAURO_iGlneF0r6nMH63wsOIFuKkwpxdxIpBbTz3sy8SYBtrWEbeQlzIlciPLn8hgjxmdtB0gPavdPY27rMSA-FnnTQqaf8up3u30CFUfc2z1i4M4DCJCWULZi5K0bq4iTYWDwXABqVTDIy6xCZ0wIZer5_IHLy-QIdXDix:1nBCt7:oFFwijb9ThqEXtAWz4RZ_roNhDSY6Kf29wXtlC6LbYQ	2022-02-05 15:10:49.337494+05:30
c04jmcwwetk5fc7aau425vwm5bpbtdhs	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nEnnK:LTNNzHDbt2lZnuAsz-XFFaZYf_nc5EbVbPrbUH8n-Mo	2022-02-15 13:11:42.028267+05:30
1zr5xo4gmy88362yi3u4g0y69hgmirja	.eJxVjDkOwjAURO_iGlmJd1PS5wzW34IDKJGyVIi7k0gpYMp5b-atCmxrLdsicxlYXZVt1eW3RKCnjAfhB4z3SdM0rvOA-lD0SRfdTSyv2-n-HVRY6r521raRBPrUeJ8ByTQRxEjvUyBGDlYchTZEh-xsSgEzxmh83mOgZ_X5Ag5hOCE:1nBEzW:NZjVASryX5CT-4vmVOv_0ADp1ZxxIHUgCn8areGKaG8	2022-02-05 17:25:34.601221+05:30
2vx7uloav9io3eyzue0kzho2yqszwdn5	.eJxVjM0KwyAQhN_FcxE3iT_psfc8g7ir1rRFISan0nevQg4tDAzMNzNvZt2xJ3vUsNnVsyvTml1-Q3T0DLkT_3D5XjiVvG8r8l7hJ618KT68bmf37yC5mtraKMLJeRP0OEg5NYVIEaNqDl51jDFqwFlIQWKMAAMZIYEAnDEz-3wBJFs4QA:1nIRPf:VdRxGaSAuh64GQrgVNGL2OlUvbH93_jGuNP0dFjEFWU	2022-02-25 14:06:19.992498+05:30
opalxl2ccz2y5cih0dwkytf8iwnuojon	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nFbuE:4oc0Qrm3uGyTwqveL1EpnlJnD_ISoR2-e4AW8e_ocv0	2022-02-17 18:42:10.734101+05:30
95v79l4i0f05e8lgyao70y2zfi8s6mvn	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nFykO:ddeneEaZjlUfnXx0wrc-e_0WxQeHRqIRkewzVZ_oPik	2022-02-18 19:05:32.074841+05:30
tfiu5sqdo3h77xq9ouyn8wrbg6ls90co	.eJxVjEEOwiAQRe_C2hAYoIBL956BDMxgq4YmpV0Z765NutDtf-_9l0i4rWPaOi9pInEWJorT75ixPLjthO7YbrMsc1uXKctdkQft8joTPy-H-3cwYh-_dVR2UAyGIESPrnog5QM5FXxEjAAaLZihFm2sy5rtgJS5GkJm7y2I9wfk3zes:1nCHFa:Zija5lxIuDBQUKfZqfvhb1YryFM46qbft9JZx77-K4I	2022-02-08 14:02:26.121206+05:30
bvm6fwnwqh9n9bioozziyonr4mr0i227	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nD4OA:caqQVZPz-ZtM6dvQ9AcKhBkwyR11yQC_Jfel259tDNY	2022-02-10 18:30:34.840055+05:30
dxwdftd58b88klyyv00wqm36r77u62ou	.eJxVjDEOwjAMRe-SGUWKnNY1IztniOzYoQXUSE07Ie4OlTrA-t97_-USb-uYtmZLmtSdXSR3-h2F88Pmneid51v1uc7rMonfFX_Q5q9V7Xk53L-Dkdv4rQXEFIfYlxyUsMvCaIwoHUUoA0QBJgRUCIUMchkKm1ofIsWOydz7Ay5AOPM:1nGc48:RFNgtskMe4e3HSvGlFqXGhKojE6ZNHJX5m6g5X91rp4	2022-02-20 13:04:32.251816+05:30
4ze7n892zi8eozbbuirtst99bujug8tb	.eJxVjEEOgjAQRe_StWmmtJXBpXvOQGY6HUENTSisjHdXEha6_e-9_zIDbes4bDUvwyTmYlwwp9-RKT3yvBO503wrNpV5XSa2u2IPWm1fJD-vh_t3MFIdv3VwyAwcYlZBBVSNwABJXdeIbwIStd6dO9EoATi2BOyyx86pIsZk3h8RxTgy:1nD7Tp:fYrw05WRTWMzqyVYDyubvMD1xqhD36ggOXXcKgGmVgE	2022-02-10 21:48:37.718111+05:30
xj3men63iw3sjlvp767s00zi2jv2ne3j	.eJxVjDkOwjAUBe_iGlm24y2U9JzB-v4LDqBEylIh7g6RUkD7Zua9VIFtbWVbeC4DqbOyXVCn37UCPnjcEd1hvE0ap3Gdh6p3RR900deJ-Hk53L-DBkv71s5Bn9FXDozZA-fOO9vHJDlyigkDC8UuOQGyJJ6MRxNE0KARYSfq_QE79Tk7:1nNGoe:TaVM7g5Cwg0evdQcLl-IgWjCVsZAUhpVqcp7yNcW7mM	2022-03-10 21:48:04.260313+05:30
b9ymsn5jojwl44evc53xwtt66e1z7zhy	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nE58a:DpjOC0KCMYkp3egV57EXyp3IombERWxW6zBesmg2qlA	2022-02-13 13:30:40.688189+05:30
z7pod44ord63l0vpj9605mflukylhe68	.eJxVjEEOwiAUBe_C2hBaQKhL956BfHi_UjWQlHZlvLtt0oVu38y8twi0LjmsjecwQVyEVeL0O0ZKTy47wYPKvcpUyzJPUe6KPGiTtwp-XQ_37yBTy1vdWe2AhGHUMFGZTitSnffO0-g1JctMPXNPbhjgHZiNBlyM2PBZJfH5AhlIOPw:1nGiK8:d0cqHdZCdDDTMnW_1LSXSA3c3S2sieJ_-AUm18Gbzok	2022-02-20 19:45:28.228976+05:30
ygqhlocxrrg1ews2n08cqdbkul2nlqfo	.eJxVjEEOgjAQRe_StWk6ZVqoS_ecoZmZjoIaSCisjHdXEha6_e-9_zKZtnXIW9Ulj8WcDaA5_Y5M8tBpJ-VO0222Mk_rMrLdFXvQavu56PNyuH8HA9XhWyNybEIqErqWk_McEnderggEMVEUjKqhKHUiPqYGAZxHT-wAoSmteX8A-Gs3aQ:1nITin:cerC9rKPglE2mFGOUP1fL60dzFIYwpsoKTvFE44Wnzs	2022-02-25 16:34:13.676045+05:30
pz48e2ow79gokxg7gp8ugf2pu8ow872v	.eJxVjDsOwjAQBe_iGln-rH-U9JzBWq9tHECOFCcV4u4QKQW0b2bei0Xc1ha3UZY4ZXZmHtjpd0xIj9J3ku_YbzOnua_LlPiu8IMOfp1zeV4O9--g4WjfGrTXBqXEmoWqHsEWgEwukFVQATyQsyQEgNVKF0KRQpCmYnFGa0_s_QH1gjd6:1nJ07T:mC0KnvxYSMRMKtBu7Qm8OFCbC1Fg3AmwttlZ2RY1sU8	2022-02-27 03:09:51.313907+05:30
yot206pymc29uh7ooscq060hueoozcwc	.eJxVjMEOwiAQRP-FsyGsSBc8eu83kAUWqRqalPZk_Hdp0oNmbjPvzVt42tbit8aLn5K4CqPF6bcMFJ9c9yU9qN5nGee6LlOQOyKPtclxTvy6HezfQaFWug1soMcNLtsI2SAqBMKQ-OzgkuKQs9UamUzULgdLFsHZrLrgrFEgPl_yXjdI:1nI690:YoqoNkh0D0siNaZA7pBBbpTcuzcH7furpdh4tWDauLQ	2022-02-24 15:23:42.177705+05:30
6b06qcbvi4h94vkygrs13m5r1rjnf2gd	.eJxVjDsOwjAQRO_iGlkWu0lsSnrOYHk_xgHkSHFSIe5OIqWAZop5b-ZtYlqXEtemcxzFXEwXzOm3pMRPrTuRR6r3yfJUl3kkuyv2oM3eJtHX9XD_DkpqZVujH7wL50HBE4uTfktQzB4IyHNH2pPP4oBCcsAOCTCwZEVRgoDm8wUgazkE:1nI6WI:-tSAMkSH-Oh3xxNqQJkyYej4qJFLq2EYe1fy-fMxVwo	2022-02-24 15:47:46.970043+05:30
zbwkli0x81korhi4sv7rsneeumxoyo1f	.eJxVjMEOwiAQRP-FsyG4CwU8evcbCOxSqRpISnsy_rtt0oPeJvPezFuEuC4lrD3PYWJxEYMXp98yRXrmuhN-xHpvklpd5inJXZEH7fLWOL-uh_t3UGIv25oMgbLoHGn2SAk0EHufz0wqGz0aRECrwBOMLjmP1jikaDTHYYtKfL7-tzde:1nICRB:zrCPzrgMofxpC9Tg3PL3T-nkbJrLKyJzDtm-d_gRVc4	2022-02-24 22:06:53.705608+05:30
4tz26nvt1y8t1ttsw6rsaqbrrzcwb6oj	.eJxVjEEOwiAQRe_C2pBCBwdcuvcMZGBAqgaS0q6Md7dNutDtf-_9t_C0LsWvPc1-YnERDsTpdwwUn6nuhB9U703GVpd5CnJX5EG7vDVOr-vh_h0U6mWrLY-MyqAaAHVArWzkxCECayRAx4ZsziOBQSA3KLRx8zLB2UIKGsTnCwHWN-U:1nJrux:WwxEo--XZ0mQMBTV9MGBbCJxgQKndIe0p0UGiKlPfvM	2022-03-01 12:36:31.490967+05:30
qst9fphexxopz63gpt71lk38fyaa5vy8	.eJxVjMEOwiAQRP-FsyEIC2w9evcbyAKLVA1NSnsy_rtt0oPeJvPezFsEWpca1s5zGLO4CG_F6beMlJ7cdpIf1O6TTFNb5jHKXZEH7fI2ZX5dD_fvoFKv2_rMjIU0g1IasxkUgyblk0EGRwVhQI4RbCno0JOxtqgtUwajHVglPl8Ofjfr:1nIQE7:_mU69Y9HKFUtBxYJaBAPf0Kyw5yYxzsT7UL7fIBZyL0	2022-02-25 12:50:19.808754+05:30
ig7zn530ghu0ys4uql8c1wp22gg5koax	.eJxVjDkOwjAUBe_iGllx7O-Fkp4zWH-xSQAlUpxUiLtDpBTQvpl5L5VxW4e8tbLkUdRZJa9OvyMhP8q0E7njdJs1z9O6jKR3RR-06ess5Xk53L-DAdvwrU2gWHouPcToE0BNAYkLUeWUKmMwBkScs9hR8FwJwPamsxLYWSGn3h8l-zik:1nKd6g:La5pZc94LOf2UW3eXDDkd_H6tOcB8lus7Hdugb-cAIc	2022-03-03 14:59:46.514603+05:30
dun3fqt7ldmnldsr00gnotve5cj8gqct	.eJxVjDsOwyAQRO9CHaHlYz4p0_sMaGEhOImwZOwqyt1jSy6SbjTvzbxZwG2tYet5CROxKxMg2eW3jZieuR2IHtjuM09zW5cp8kPhJ-18nCm_bqf7d1Cx133tC3kwKAsJnbXyXhSZQcnkhNmzcUNCq5JTOno0ogBaR0oOSODIgmWfLxviN68:1nL9Uo:VlIr6AIt8WtjdKKGDSmkQz0RYA91DmxBOxv_0kN0JKk	2022-03-05 01:34:50.459811+05:30
d0u56bpa1khklkqn3b8aj48wdorfbvut	.eJxVjDkOwjAUBe_iGllx7O-Fkp4zWH-xSQAlUpxUiLtDpBTQvpl5L5VxW4e8tbLkUdRZJa9OvyMhP8q0E7njdJs1z9O6jKR3RR-06ess5Xk53L-DAdvwrU2gWHouPcToE0BNAYkLUeWUKmMwBkScs9hR8FwJwPamsxLYWSGn3h8l-zik:1nLgx2:lDyInMyROCpWW60uMJhkGlq764gBqH3v28WW7zst-IA	2022-03-06 13:18:12.822226+05:30
op53mo1x3lciqcbsurigw3bge0am5ruu	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nLmX8:1IV6cndhXyfDFWDIGNRAnDYXWwKK0jMQ6SZgpL1OYgk	2022-03-06 19:15:50.980945+05:30
yraqz8yksqmkbjyycp7a3w0b5bznpv1g	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nM7w5:YPmhjtDIRuIPK8gcyNyZlQVHYUwqHtcEm1GyXbxFSOk	2022-03-07 18:07:01.534232+05:30
kxrq6svwmtd29ekbth0v2gnedule5p22	.eJxVjMsOwiAQRf-FtSGF4enSvd9ABgakaiAp7cr479qkC93ec859sYDbWsM28hJmYmcmhGOn3zVieuS2I7pju3WeeluXOfJd4Qcd_NopPy-H-3dQcdRvnbwGmz2gKAlLAedJSCu1QimLNE6XCbRKBuTkXcIMHjJqimRsoaiIvT8n9jh2:1nMlHU:KHLrVwTGm8uALzih_6w77-VvJjhvPbahq1BVntIjEEY	2022-03-09 12:07:44.005147+05:30
z7s0z4qt31dqb7ks6reg8v7b92znl6ww	.eJxVjDsOwjAQRO_iGlnG-LeU9DmDtV6vcQA5UpxUiLuTSClgynlv5i0irkuNa-c5jllchXHi9FsmpCe3neQHtvskaWrLPCa5K_KgXQ5T5tftcP8OKva6rbmAdiZBAjL2TORMsYlLUWGL1hcHGRUlsJgpeAuEqjCz0yaD98GLzxchVziZ:1nFBD1:aZW05T0Umm6s7Z9OGHu2TVgHvsz8krNePmcPrSU6SNM	2022-02-16 14:11:47.546049+05:30
f6bbpxndm30qlcj2jzfzfgaicwllfnfj	.eJxVjDsOwjAQBe_iGln2bpz1UtLnDNb6RwIokfKpEHcnkVJA-2bmvVWQbe3DtpQ5DFldFXl1-R2jpGcZD5IfMt4nnaZxnYeoD0WfdNHdlMvrdrp_B70s_V47kjZZSj7FKgzRI3BDhWxxDZBjMW1Gi2SYfW4BASpnKYgVeXeN-nwB9w03BA:1nIT0i:EpfsdDmeMbVw3UVzxuahIQ3gjV2nJ3G2m0u1Dbbm3hc	2022-02-25 15:48:40.951643+05:30
19h9kutmtkzn19wdzk0qjo6e7g7w9nhu	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nFc0U:luRytGMK7ZL692xnPLzMadIxaRsdfe_E62sSRdmVNXY	2022-02-17 18:48:38.156844+05:30
tzwwu3cj2dr4x6w4ah11fzsd43mnfq0s	.eJxVjDsOwjAQBe_iGlmxN3YSSnrOYL1db0gAOVI-FeLuECkFtG9m3sskbOuQtkXnNGZzNhTM6XdkyEPLTvId5TZZmco6j2x3xR50sdcp6_NyuH8HA5bhW1cdagTuIUGgwXErQi4ShZaCr_qWpFPJtXeiEDTsvQeiNsyMWLN5fwAoTjky:1nBfAu:cKpZa1q3dh_tcr8a7T0wJUfthQKtUpwsWWAuGpq1GuQ	2022-02-06 21:23:04.841386+05:30
mxwnah9eegqpagyvscedbya3fg1frter	.eJxVjDsOwjAQBe_iGln-xFqHkp4zWOvdNQ4gR4qTCnF3iJQC2jcz76USbmtNW5clTazOyjl1-h0z0kPaTviO7TZrmtu6TFnvij5o19eZ5Xk53L-Dir1-a3CZDBNBCBxQIAB4scYHdANaocGXHAvHAmLHglyyK0a8D4J2zJHV-wMiGDki:1nG0p6:wltuLQT7SpctjZXYvR4YbHH3lHza0niQZDq60XO8-k4	2022-02-18 21:18:32.6542+05:30
bugs8j3cdaa8teosf59r2czapasby98s	.eJxVjDsOwyAQRO9CHSFgDWtSpvcZ0PILTiKQjF1FuXtsyUXSjea9mTdztK3FbT0tbo7sygDZ5bf0FJ6pHiQ-qN4bD62uy-z5ofCTdj61mF630_07KNTLvtaZvEE0PkMSyqJOZK3YMyUxRiUkiqzBY7A0DnrIENBIA9ooL5AksM8XAeI3SA:1nCCYa:Snypw-qHGPcyZKLLFdKtn8x7jojjMdCFrna1fCu8oAI	2022-02-08 09:01:44.619882+05:30
jcjra5wxn6jgbyb033j65v5smrabrd0q	.eJxVjEsOwjAMBe-SNYrcNrgJS_Y9Q2U7DimgROpnhbg7VOoCtm9m3suMtK153Badxymai3FgTr8jkzy07CTeqdyqlVrWeWK7K_agix1q1Of1cP8OMi35W5-JmxSBCX2jLLFHEY8kgYMXIPYAiQFa13akqF3jxPeYlAQhKKN5fwA2dzkR:1nCJOw:uRLNkRab23UzDe8OAyrPeTFe-buhTktm42PBZ1D6MB4	2022-02-08 16:20:14.918677+05:30
4j01dje90compbzqd1dspiy7z1zsl48d	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGdsr:Pz_9HYew4kjhRONwAmK-NRyBXh-d4AFF5sa5Na1Gk-w	2022-02-20 15:01:01.126406+05:30
6qhxvdrl919aise9s5sf1hha2gxpg2hl	.eJxVjEsOAiEQBe_C2hDoaRh06d4zkG7okVEDyXxWxrsbklno9lXVe6tI-1bivsoS56wuClGdfkem9JTaSX5QvTedWt2WmXVX9EFXfWtZXtfD_TsotJZeE9ssaJzhjDQFD-wH8iMNDHlKk3Pk4MwhoIwW7GCCjAEtWzYCCEZ9viGpN-o:1nD4yF:zu_wiIzdcNe_xsAVOR3yjhfnrV0WnOadwFqdNMpspDM	2022-02-10 19:07:51.944746+05:30
re5fkmdqdq5kbte7wl9w1kpqlh9kf4ig	.eJxVjEEOgjAQRe_StWmmtJXBpXvOQGY6HUENTSisjHdXEha6_e-9_zIDbes4bDUvwyTmYlwwp9-RKT3yvBO503wrNpV5XSa2u2IPWm1fJD-vh_t3MFIdv3VwyAwcYlZBBVSNwABJXdeIbwIStd6dO9EoATi2BOyyx86pIsZk3h8RxTgy:1nD7VD:_WYFRZlsCIixLiF5EK8Vjyw1t5iXoB7x0k2kCU3sFn0	2022-02-10 21:50:03.46871+05:30
3eul56armi0q93xa63bnzthqofe9oks1	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGlEp:-a_kifnkY2hvks1SG_OVoSCDr1qQ8oeePNvmkvQEZ8o	2022-02-20 22:52:11.958135+05:30
3c10um7fnosl0sgimgsct9eccbvxijqn	.eJxVjMsOwiAUBf-FtSEgj3JduvcbyAFupGpoUtqV8d9tky50e2bmvEXEutS4dp7jWMRFBCVOv2NCfnLbSXmg3SeZp7bMY5K7Ig_a5W0q_Loe7t9BRa9brZ3NhmAU6WDJMYp3ih3IaBhKimnj2nqdfEigxANjAKwN58CeID5f6xs3rQ:1nITtg:HwQnDcWBK4VMvprTll4Imxjc4YcMRjV3Lky897F0CXw	2022-02-25 16:45:28.926826+05:30
lpvwh470b7bnmeq1tauydwbjh3y0d5e7	.eJxVjDsOwjAQBe_iGlmxE_8o6TmDtbve4ACypTipEHcHSymgnZn3XiLCvuW4N17jksRZGC1OvxCBHly6SXcotyqplm1dUPZEHrbJa038vBzt30GGlr9rb2ftYErknAegkawC61zybHHkMHg_h45IA4RRK2tQmYATMQ6QLIv3BxG_OHI:1nHjkd:tJGX7qWI0JjuFGJdwr-dHE4TA5Kl3kbgN-tzvh-HmGo	2022-02-23 15:29:03.006985+05:30
a5a6edmeg6noqbskxw0zcfcvn65m0oem	.eJxVjMEOwiAQRP-FsyEg3dJ69O43kF3YlaqBpLQn47_bJj3ocea9mbcKuC45rI3nMCV1UQOo029JGJ9cdpIeWO5Vx1qWeSK9K_qgTd9q4tf1cP8OMra8rQ0IggNm7wXGvnPirFhiK4R97ACASezgtiiMjpM5RzHeg9gEfjTq8wUkcjjR:1nJ0Nd:yNgtZuHWKstiOzHGwEETCbd67oF5Db9awjGynDgK78w	2022-02-27 03:26:33.231862+05:30
c4zn9gxxicaiq08bcvpz8826tao35zai	.eJxVjDsOwjAUBO_iGlmxE39CSc8ZLHvfCw4gW4qTCnF3iJQC2p2ZfYkQtzWHrfESZhJnYTtx-h1TxIPLTugey61K1LIuc5K7Ig_a5LUSPy-H-3eQY8vf2nkFBg_GsWfd-5EiYB0lr61THSxgQFDErCcD6HHyvSVFBgNbpcX7AyyYOQU:1nI6gY:BrGIA4UyGQ1tcjGUFAGTpT-6SVwUe8fno1OnReVe9l8	2022-02-24 15:58:22.569905+05:30
jn2z0l6c3vwk2s0si0tvqrc0gm5fg0ua	.eJxVjDsOwjAQBe_iGln2ev0JJT1nsHbjNQ6gRMqnQtwdIqWA9s3Me6lM29rytsich6LOqjPq9Dsy9Q8Zd1LuNN4m3U_jOg-sd0UfdNHXqcjzcrh_B42W9q3ZJoSSUnFowDvxglQDVx-NxYgMIChAphoGdNFG60NHwcXalwSJ1fsD6-g3QQ:1nJcW1:SMMHqFJX7hgAieGor0WxnPDFgsN2Zvv-mPKE7K-2nuk	2022-02-28 20:09:45.139128+05:30
lsva3x7yqkci6tjxvc2ooa2qyggid8i7	.eJxVjEEOwiAQRe_C2hCQDp26dN8zkGGGStWUpLQr492VpAvd_vfef6lA-5bDXtMaZlEX5UGdfsdI_EhLI3Kn5VY0l2Vb56ibog9a9VgkPa-H-3eQqeZWs0VrIgALsYnSDQY8MorjXsjBgMkCI3vb0dlO0OE38AhEDvsJWb0_FOE4Eg:1nI7Rq:gq6Bifnb9A0Ag6nCC7-wJNrOzd8XvkGs5HDeQxaa6VA	2022-02-24 16:47:14.020724+05:30
9k62oxkhjqk7o068q37js2zq6dnuwphw	.eJxVjDsOwyAQBe9CHSF-K7Qp0-cMaIElOIlAMnZl5e4RkoukfTPzDhFo32rYB69hyeIqvBKX3zFSenGbJD-pPbpMvW3rEuVU5EmHvPfM79vp_h1UGnXWBYFAayJM4NkZVtagLcqjV7okR9kpBFuMNQkQomMu2RMZZJ-sEZ8vAuk4CA:1nICTF:tkUnFxH-v5mTHFb69ytpmullJbfcQyJVQ2upta3M75g	2022-02-24 22:09:01.550324+05:30
f05s555mvwtdclwb8dqtsntckgswsrpy	.eJxVjEEOwiAQRe_C2pDiSGdw6d4zkIEBqRqalHZlvLuSdKG7n_9e3kt53tbit5YWP4k6K2fV4fcMHB-pdiJ3rrdZx7muyxR0V_ROm77Okp6X3f0LFG6ldyUBWiTMxjE5O9qALCSIhmEYIBMxUgzgUiYDaTTgTiYfBfA7slHvD_d8N0s:1nJrw5:6bKqUNdn7WsiyF0A_Si9ZlUkLTEXZbEz27-EQs0t5H0	2022-03-01 12:37:41.751773+05:30
o22xz43nf3p8e6ihxar3h6aj37uk8imf	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nKkj1:hkI-s_mzV8885ii3w4JjTXZRzvJy5lAvt0XXyx5jPOc	2022-03-03 23:07:51.364263+05:30
l22cl2xkelerr9rdaj3slcnxs4p3ljxy	.eJxVjEEOwiAQRe_C2pApEAGX7j0DmWFAqgaS0q4a764kXej2v_f-LgJuawlbT0uYWVzEBFqcflfC-Ex1IH5gvTcZW12XmeRQ5EG7vDVOr-vh_h0U7OVbK29j9orQoiKDhnW2OmeHREgmMWhgYutoUhGICcj4oRvQCl0-i_cHXCY5ZQ:1nLMWj:ocHmeVvBqH5C9cgyet6zPPE0LCBPqkl9h0J904btD2Y	2022-03-05 15:29:41.095862+05:30
dyh1bbfjhxbipgzvc8dtl6jag2s96mtr	.eJxVjDsOwjAQRO_iGlm28S-U9JzB2l2vcQA5UpxUiLuTSClA0817M2-RYF1qWjvPacziIrTy4vTbItCT247yA9p9kjS1ZR5R7oo8aJe3KfPrerh_BxV63dagCbZkEylEW5C4YCTnHBay7DUO6AajrLKEHhDyGUuIBVVm1tYE8fkCeiA6Bw:1nLiko:0V4z5ezSvmuU7KJPu8i8vpYKl5CHhobz9pOHiecSLrM	2022-03-06 15:13:42.077481+05:30
7r62jfky6olb9e75zydnxe559d6atszf	.eJxVjMsOwiAQRf-FtSEMjwou3fcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mLAFDi9LsmzA9uO6I7ttss89zWZUpyV-RBuxxn4uf1cP8OKvb6rUuyGskXtj6QdqxVAlM8GMVIGpINvgxeK1tc5nB2LmUAF4zJ3riBULw_MRw4Bw:1nLn8Z:xN3p3n04CU9FvSFnQyCG-ww6XqGflu7kHvHJ-guCymc	2022-03-06 19:54:31.888219+05:30
v7eb4q1gzvu26o121jdr4lfy1e0hp95b	.eJxVjEEOgjAQRe_StWk6A4XWpXvPQKYzU4saSCisjHdXEha6_e-9_zIDbWsZtqrLMIo5G4DGnH7XRPzQaUdyp-k2W56ndRmT3RV70Gqvs-jzcrh_B4Vq-dapFwIXfOgajR6jB8ieGbxQRs6SMHeBWLR3GoEcuhaxRaU-cWyzM-8PMfU4hQ:1nM8Oq:if-FR7QXV2rqwfOVmYEKBXkRqx90Lb2ftUlSyZBGlso	2022-03-07 18:36:44.556837+05:30
5fqd5ecut21q576rupm3lqljfk2esede	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nMU6T:O43yHI3sU_-m3acUjKzZJh4titHcGiwKZp4VkuoTc6E	2022-03-08 17:47:13.239085+05:30
wabo6vdjlypc923d1gawp2noy7s4vdlm	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nFTmg:s9cI1tmLALbqGa5PtlDtAVes93oRIPi7GPCVnTY9Fkw	2022-02-17 10:01:50.633018+05:30
r735vf48z6ibtx9rq1ejdjncg8zorrc9	.eJxVjEEOwiAQRe_C2hBGChSX7nsGMswMtmpoUtqV8e7apAvd_vfef6mE2zqmrcmSJlYXFaI6_Y4Z6SF1J3zHeps1zXVdpqx3RR-06WFmeV4P9-9gxDZ-a8FcjMg5m4hdth56dtmzt2CIi8VOugIUgAyhiwQRTe8ZeigRgnVevT80Hjhd:1nIT4M:qi--lW8hg66bVxP84R7eSUvDJho4Z_dKWQ_HFvYghSQ	2022-02-25 15:52:26.85378+05:30
rr68u56ygfm34y9unl36pjkkmgwlocnw	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nFcb9:WR0ugf7DfYEesqMgOv65rxB8YmGZUSkk7Xh-nEL1eNA	2022-02-17 19:26:31.342739+05:30
m6hfrhm5xwna60i9ndup39f0od9p055e	.eJxVjUsOwjAMRO-SNYrsfpKaJfueoXJihxRQI_WzQtydVuoCtvPezLzNwNuah23ReRjFXA0imctvGjg-dTqQPHi6FxvLtM5jsIdiT7rYvoi-bqf7N5B5yXvbeSVOAWtQl1CrqiHGOux_lYh0ngi7Fhxro-DJg2cEJhcpCSBCaz5fIAU3eA:1nMlKi:eb4toBex_cIN1Bl46jMYaiXTnaDCjFuTrvJYht87-K8	2022-03-09 12:11:04.892788+05:30
e9409hfkpqpyblcfmk4eqis5mk0m0bqo	.eJxVjM0OwiAQhN-FsyGypfx49O4zkIVdpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUwkLkI7cfotI6Yn153QA-u9ydTqMk9R7oo8aJe3Rvy6Hu7fQcFetrWF7JHOmjwR02Adj6CcVzQaQMc4ECcHo7fap-R8jhBzNltGUDmBEZ8vItk47w:1nGOAs:cgliGe5--8pr2lDMUoAVMcxdbVpdfU8G0Y9e3UrKPCQ	2022-02-19 22:14:34.632134+05:30
as69jh6e7e1078dqvcwbelntgx2g2lk8	.eJxVjDsOwjAQBe_iGlnrX-xQ0nMGa71e4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVZKK3F6XdNSA9uO8p3bLdZ0tzWZUpyV-RBu7zOmZ-Xw_07qNjrt7aQ2BYkHwbgkVRG4whKoNEg-2QRICA6HbyxRelSyLDPDjwimEyDeH8ARP444g:1nMlmZ:7anJOVrUHmLbPQxMjN5Hidc1OP6T8g5Vw6tQsxfU03c	2022-03-09 12:39:51.446857+05:30
w5ranpeqo3c3fvy1878feoiagqtsgoqj	.eJxVjDsOwjAQBe_iGlmO_0tJzxmsXe-GBFAixUmFuDtESgHtm5n3UgW3dShbk6WMrM7Kd-r0OxLWh0w74TtOt1nXeVqXkfSu6IM2fZ1ZnpfD_TsYsA3fuu8zJfAOkjUCEChb0_no0HKsPgeXiVIFNLE3ETuQxGSFyDGkYFHU-wPwgDfo:1nCzC0:Wg1MHjWNFEeRKPT4ZIhs4KW1y6iDoYYSycGNAY5QJ04	2022-02-10 12:57:40.481107+05:30
squlcxqcbqaninfd2291bp9pbwaywb7c	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGdts:FFt-cgAHGsoTXYlsw2sG81ByoYy5HfNlkIPHm-Shee0	2022-02-20 15:02:04.532986+05:30
z8547murau6uaypqcglth35xwnf0bydy	.eJxVjMEOwiAQRP-FsyFAWAGP3v0GwrKLVA0kpT0Z_9026UGTOc17M28R07rUuA6e40TiIpwVp98SU35y2wk9Urt3mXtb5gnlrsiDDnnrxK_r4f4d1DTqtj6b4pzLihhQMRAhIajCYYuGgGiy855tIgKtXA4UgFUx2mYI1nvx-QI0ETi3:1nIU5M:-HmpKX_MVzcEF8hZNIkCw5xPn_p2e3QkvaKgrKpB9L8	2022-02-25 16:57:32.524777+05:30
hiiyslx94iu2c6ieav6qwqtfjp4mknwf	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGlQb:LNJutPoT1_Xz6mc2QH2KFeaaQGuof2a9SHwHCtCZho8	2022-02-20 23:04:21.714996+05:30
u9p9m1x0lh9odyh2yexp9dagr3bvw995	.eJxVjMEOgjAQRP-lZ9OUskupR-98A9ltF4uaNqFwMv67kHDQ48x7M2810ramcauyjHNUVwWoLr8lU3hKPkh8UL4XHUpel5n1oeiTVj2UKK_b6f4dJKppXwd0QL31fTt1nTXSSoPGEdjJI--RBKVj6z17wEBkYM_YWA52YnBOfb7zGTes:1nDJHX:iseaa2FQ5x75HvHI7CjwKCIxFHR98Z1V8BIRSLev_Sg	2022-02-11 10:24:43.912417+05:30
l33ixzzgyq2ahndj1pc7gllh4wgjkvcg	.eJxVjEEOwiAQRe_C2hAGOsi4dO8ZCAyjVA1NSrsy3l2bdKHb_977LxXTutS4dpnjWNRJgR3U4XfNiR_SNlTuqd0mzVNb5jHrTdE77foyFXmed_fvoKZevzWSL84YbzKgZefIBvRIVzRHFJ8CkwBYokzBmUCSebAGXMoexAOjen8A6gE2vg:1nMmBi:QjeAqAhAntBH3AcK5747WGoBfn1P1VMKYmKogdFMQzs	2022-03-09 13:05:50.296789+05:30
a6av5l7hq1ovm6bwf2n8g1xysb93afyh	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nHr8f:TGdtK0KJvcNeyhJerRbixH20V8iO_fE0DtYCLw9kXzo	2022-02-23 23:22:21.552726+05:30
xjs0dq00e26m8hzwuvni3p6nnhd2mv9u	.eJxVjEEOwiAQRe_C2hAnFAou3XsGMsMMUjWQlHbVeHdt0oVu_3vvbyriupS4dpnjxOqivFOn35EwPaXuhB9Y702nVpd5Ir0r-qBd3xrL63q4fwcFe_nWSBYGJHIoQgE8gRCCsWxYRvLIZx8Cgh3YDSFhNkZktJSR2ILJot4fRZY5sA:1nJ0UL:aCG3yXAI_sDoEw2jc_3y53D50JCHzuG9qXuGVbp3Uws	2022-02-27 03:33:29.944287+05:30
848240t141w3kqgpt1ic12mu8uog3pv0	.eJxVjDsOwjAQBe_iGln-4B8lfc5g7XptHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swY9jpd0RIj9x2Qndot85Tb-syI98VftDBp075eT3cv4MKo35rna3yyQcpUCiVUEEphDYoK0N2tvizVjYgYCFnQEjyAYwXpLV0IXvB3h8ECDe0:1nI6CR:6UJ4ji8oNnhISQKDoP7ZZlb9KlrkQp0V1amdzDrQcCo	2022-02-24 15:27:15.985898+05:30
9q2dzgngfezrfeabvk3a54b1cfuwfbl4	.eJxVjEEOwiAQRe_C2pAB7AAu3XsGwsAgVUOT0q6Md7dNutDtf-_9twhxXWpYO89hzOIilEZx-l0ppie3HeVHbPdJpqkt80hyV-RBu7xNmV_Xw_07qLHXrUYqSpGnpNkNmVyxYBEIOCd9dqZ4tA6KNwXQWQ3IrGgzLA3AxqASny8xPDez:1nMmLU:pAMea6M0qu_CMY7oNf7tGf4Ac-ayT8Ku_AhwNIT5luA	2022-03-09 13:15:56.567924+05:30
z6hf1tqk4z5w5qhymflixj91apyqax43	.eJxVjEEOwiAQAP_C2RCgLIhH731Ds7uAVA0kpT0Z_25qetDrzGReYsJtLdPW0zLNUVyE0-L0Cwn5kepu4h3rrUludV1mknsiD9vl2GJ6Xo_2b1Cwl-83ktVMiu1ZeQQVyWnynLwyYaAM2VkGIMpBQbbsYjAWORhjKCAM4v0BD9o4KA:1nI6j5:XjpCpYHAe2iGwOuLW7mBGDYf1BpVcrjN6Q4JJm9BUpA	2022-02-24 16:00:59.318767+05:30
62uqstozws2b8yygg8m9xhyedtuln4k2	.eJxVjMsOwiAQRf-FtSHTIbxcuvcbyMCAVA0kpV0Z_12bdKHbe865LxFoW2vYRl7CzOIsJrTi9LtGSo_cdsR3arcuU2_rMke5K_KgQ1475-flcP8OKo36ra3mAoUzoUWOThF7bQw4ozGCciUZ8MbqYnOegJRKpH3R5D1giopRvD80eDhC:1nMmR7:Xs_-kuIUs75xBpkzxVe0of_Rt4XT5v4CYA9xcCt2fOA	2022-03-09 13:21:45.396017+05:30
9cm9xw086uewcdfvzi4d3uuu7h0m3xfv	.eJxVjMsOwiAQRf-FtSE87MC4dN9vIJQZpGogKe3K-O_apAvd3nPOfYkQt7WErfMSZhIXASBOv-MU04PrTuge663J1Oq6zJPcFXnQLsdG_Lwe7t9Bib18a-1tZDIqG3AQlTfkjHcIaFERAU1JDRbAo0lDBsOUGa3OwE5rjXwW7w_vcDdo:1nI7Tu:ObCwuCuuxpC1FpOw7s1n4UIzKCNnZU04uPeSoHUaebw	2022-02-24 16:49:22.016585+05:30
upo0wnkmx4s7o74f1ah6rje4wd0cgc6t	.eJxVjDkOwjAUBe_iGllx7O-Fkp4zWH-xSQAlUpxUiLtDpBTQvpl5L5VxW4e8tbLkUdRZJa9OvyMhP8q0E7njdJs1z9O6jKR3RR-06ess5Xk53L-DAdvwrU2gWHouPcToE0BNAYkLUeWUKmMwBkScs9hR8FwJwPamsxLYWSGn3h8l-zik:1nJzYY:TEDClZpp47mwziLWrD5ZswQsrmbzLT9sxQScMBB4ogE	2022-03-01 20:45:54.862879+05:30
09rs9ozj1ytcwdbyjw0v92dgo51jqyjm	.eJxVjDsOwjAQBe_iGlmxN3YSSnrOYL1db0gAOVI-FeLuECkFtG9m3sskbOuQtkXnNGZzNhTM6XdkyEPLTvId5TZZmco6j2x3xR50sdcp6_NyuH8HA5bhW1cdagTuIUGgwXErQi4ShZaCr_qWpFPJtXeiEDTsvQeiNsyMWLN5fwAoTjky:1nKsIp:UyoBkCdZsuS9PKUAlfhY6NS6dvh4_RS9SedKD2t9WX0	2022-03-04 07:13:19.495834+05:30
kckr6t9lgieh5pi92fp7askqbqxy60ox	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nLOf9:1uxE2CWLoCzXcrUMlOpVh6gPyBuvEi3kVAIi9ilJk-o	2022-03-05 17:46:31.706816+05:30
7js9ip8hoow1dhmc2ng6auvrgimuim4s	.eJxVjDsOwjAQBe_iGlnrT7wOJT1niNa7Ng6gWMqnQtwdIqWA9s3Me6mBtrUO25LnYRR1VgZQnX7XRPzI047kTtOtaW7TOo9J74o-6KKvTfLzcrh_B5WW-q3RRyTJFkrPMaKAiy5ETn1vIVsrFANSVxA8c0EKYAmcB2O7YLJnUe8PGwU3qQ:1nLjY7:2C5WiVim8JaAPLQdlKU0EmGWs-3SuEQWjrqSbJnN2NE	2022-03-06 16:04:39.565051+05:30
d4w6lnqk85ay56294r1wo72n81rw6tcu	.eJxVjMsOwiAQRf-FtSEMjwou3fcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mLAFDi9LsmzA9uO6I7ttss89zWZUpyV-RBuxxn4uf1cP8OKvb6rUuyGskXtj6QdqxVAlM8GMVIGpINvgxeK1tc5nB2LmUAF4zJ3riBULw_MRw4Bw:1nLxlp:u4WoWdDgL_Knx_fVOHJ8tlNNmkZ9KCZV8nWPAbqgy34	2022-03-07 07:15:45.640282+05:30
tlyel3rrvtv3puinqa3d1rado014v7or	.eJxVjDsOwjAQBe_iGlne-BtKes5grXdtHEC2lE-FuDtESgHtm5n3EhG3tcZtyXOcWJwFgBGn3zUhPXLbEd-x3bqk3tZ5SnJX5EEXee2cn5fD_TuouNRvTcaTBZ-URjaFSiEewFtIaDCQAe2UDtaOQaNVo2UX2AxKleDymDN48f4ALUQ32A:1nMASs:P3Btuy-R84JDns01hlaAo94qqQ31foBrRDLMSLQoXJU	2022-03-07 20:49:02.571232+05:30
g9txbjmarnhzz3ndv48tokgunkobht6d	.eJxVjEEOwiAQRe_C2hAoAwWX7j0DYWZAqoYmpV0Z765NutDtf-_9l4hpW2vcel7ixOIstHbi9LtiokduO-J7ardZ0tzWZUK5K_KgXV5nzs_L4f4d1NTrtx5pINSFkwENPpdg1aBtQeBSrOacyCkkZAXeh2zCaC078GAUIRn04v0BSXI4xw:1nMXMj:j4yovkCJLh8kQnruFZwU-8DAsM8Fh_UC4t2Za1CDBhc	2022-03-08 21:16:13.379779+05:30
fah0h6qc0ohori8f6r4bvu9ukpk3omeb	.eJxVjMsOwiAQRf-FtSE8Soe6dO83kJkBpGogKe3K-O_apAvd3nPOfYmA21rC1tMS5ijOwkxanH5XQn6kuqN4x3prkltdl5nkrsiDdnltMT0vh_t3ULCXb-2nrMiCdwqYnWGPgAkTgBl0zOCInAHNSauoCewA1oxqZHCOfLY5i_cHKWY4Eg:1oSkEh:r1l_uuMsQDkaDhSlTW3edCAptHimbcHVVsKchGwbn3I	2022-09-13 00:45:51.51823+05:30
imnbeoifnka1k2dif0wtgobftc8iblvf	.eJxVjMsOwiAUBf-FtSE8CohL9_0Gch8gVUOT0q6M_65NutDtmZnzEgm2taat5yVNLC5iCOL0OyLQI7ed8B3abZY0t3WZUO6KPGiX48z5eT3cv4MKvX7rkAm9ipHAk0brLESwuZBxikx0ETFo50rRBlj5glEzE8JAqCybchbvDyehORo:1nFTn5:d5BVBGDciOYvqQSFidV3lmCdG2_wg6lCteuRmbYFTzY	2022-02-17 10:02:15.351668+05:30
ukf1elpdc3869cslkf3k4h61oxyga2pj	.eJxVjMsOwiAQRf-FtSFAkYdL9_0GMswMUjU0Ke3K-O_apAvd3nPOfYkE21rT1nlJE4mL0EaJ0--aAR_cdkR3aLdZ4tzWZcpyV-RBuxxn4uf1cP8OKvT6rTMSWMykvI1gkPPgmG3xEHNxjgoDnQlj8DZEBK-c9jqoEo1XgAUH8f4AcZA5kA:1nMlfE:h7iGyf7y9cxiFWeNG1u9SdWA1wfgTS2hmiEmOtSQmNw	2022-03-09 12:32:16.317162+05:30
c6dwwn0pxt2c77ou64pde8l1bo47rnkw	.eJxVjMsOwiAQRf-FtSEMb1269xvIAINUDSSlXRn_3TbpQrfnnHvfLOC61LAOmsOU2YUpyU6_MGJ6UttNfmC7d556W-Yp8j3hhx381jO9rkf7d1Bx1G2ttZYI3iVhjBIZi0JvwUoLzhJqAn8upGIWBE4XAw6TUMllMijkBtjnC-dZN5Q:1nBHoE:qBKeeSPOMcIivBNYMsvp9u4OM4C9l1d49NomTAJnu_Q	2022-02-05 20:26:06.241946+05:30
m5ptq60bpgk32jdhgzwepf4lt0jk31wk	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nFeUt:a3B4CNBCT3lFhYRbu93bEknOofBTlffWClZkbPfPsfc	2022-02-17 21:28:11.084726+05:30
p4uq893kik5v2t1v7sq333cp7k87r9az	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGOHq:kbnnujnHBCvLzglgRopq0nGckyM3dxhoyKe6jOF6xk4	2022-02-19 22:21:46.216848+05:30
yisicdji0w5lpu8v8ig2bg0wxg1luk8z	.eJxVjEEOgjAQRe_StWmgLePUpXvO0Mx0poIaSCisjHdXEha6_e-9_zKJtnVIW9UljWIuxqM5_Y5M-aHTTuRO0222eZ7WZWS7K_ag1faz6PN6uH8HA9XhWwfscgbJDUWFrgHfFG05OkYClKDgAyqFNjoCbhGji2dfxBdWYF-ceX8AClk4HQ:1nCDtx:JA4VtTEV6anP4IlfwquKbr_GfmMlC1lp2mEKdYOQJIY	2022-02-08 10:27:53.346814+05:30
3px4pwotoxf5qhdgcegkbfed2l8iagr7	.eJxVjMsOwiAUBf-FtSGURwGX7v0Gch8gVUOT0q6M_65NutDtmZnzEgm2taat5yVNLM5i0EacflcEeuS2I75Du82S5rYuE8pdkQft8jpzfl4O9--gQq_fWmEwY7FkIHsHNkdSxhWrSxnjQISWFDinQXvH2quIwBFjCAzeKS5evD828zib:1nMm1A:f91ijOtYn7G8dF8uN_qSTAhBV8fZyJEzlDQmEd8SCK0	2022-03-09 12:54:56.638137+05:30
ok5paihcn95evws4j9qn9ve38fnijwsf	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nD1Ew:sthwX6ZIa9uZNl5NmXju96eBqKe2FrzPIDWPwjJ7Nvc	2022-02-10 15:08:50.18438+05:30
sry2k4ouh0wv6cg1vyn578g70glcrmqb	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGe1n:0SaehNUNmpC92AuYWy-hVs3FnOZLLxpKb6Bonqe6wMU	2022-02-20 15:10:15.019332+05:30
bcske3r390bxo607r6k0wx1cj2vqwylz	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGlZ0:EYb5Ama30qza1n59eS88k83M9G4-hdPrg92FzmH9izE	2022-02-20 23:13:02.298505+05:30
8jlkmgki21bexq2hhzsg45l8ddns0ojr	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nDmpL:ddKz2kMFdF-o5v4RaBib8ysPZHKDGIJrlK2cYtIn3vY	2022-02-12 17:57:35.175925+05:30
8qbrz3sjhll73g60fqsq3e6hpce0wddf	.eJxVjDsOwjAQBe_iGllex5-Fkj5nsHa9Dg6gRIqTCnF3iJQC2jcz76USbWtNWytLGkVdFII6_Y5M-VGmncidptus8zyty8h6V_RBm-5nKc_r4f4dVGr1Wzsy2Hnxkr2N7KyhgQemCCAM1iNYMNEiRhc4FC4SzhgAODjq0EVU7w_62DdB:1nIUKt:0iGZkN0tNV9_0kbSmnovlLcGKyQDS3VAPM81DGRa_6U	2022-02-25 17:13:35.874294+05:30
mnbkkc1aajd5c57zzc0t1ey2n0m42lg2	.eJxVjEEOwiAQRe_C2hCYAkNcuvcMZIBBqgaS0q6Md9cmXej2v_f-SwTa1hq2wUuYszgLDVacftdI6cFtR_lO7dZl6m1d5ih3RR50yGvP_Lwc7t9BpVG_dQHFkyebweeIwFNyqCKjsVojemANlAw6DZDReYyWiimkpkSIkFC8Px6bN9Q:1nMmGx:ngIGTT03l36mFeTTUyQ6eqCzDg1RluHcbw3PTRK1EMk	2022-03-09 13:11:15.581968+05:30
jwt21ky2kve2sbrswyu4v1jxy0oxmcov	.eJxVjMsOwiAQRf-FtSGllGFw6d5vIDM8pGogKe3K-O_apAvd3nPOfQlP21r81tPi5yjOAq04_Y5M4ZHqTuKd6q3J0Oq6zCx3RR60y2uL6Xk53L-DQr186-DQBMzBOGQ1gE5jsMgmZq0cwITEBnlQU7IIGjkDa0saoiYYMyoj3h8D0Ted:1nJ2Xt:vBKJpYWvLI-wJOBw8ccj1tuM4A1MtUVHFibOA_MODpk	2022-02-27 05:45:17.52815+05:30
fstlwoyf34mkpdzzv6v79zh5f5j6plao	.eJxVjMsOwiAQRf-FtSEwFIa6dO83kBmGStXQpI-V8d-1SRe6veec-1KJtrWmbSlzGkWdVQ_q9Dsy5UdpO5E7tduk89TWeWS9K_qgi75OUp6Xw_07qLTUb80oAwjlgF5cYMHCtvMCMRiMmLl3QEN01oFFNthjx51IyBEMeE9evT8WOTeu:1nJqpu:ZOkqcakyopUHi72OxRqWZtQWXu9T82LynYt0oTfLuYM	2022-03-01 11:27:14.084909+05:30
4ycgpuifpy4bcvo1rmjd1cul2cbk7l3j	.eJxVjEEOwiAQRe_C2hCgdACX7j0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kTgLMOL0OybMD247oTu22yzz3NZlSnJX5EG7vM7Ez8vh_h1U7PVbK7AeXCBIzAwZmCDwYA34MLrBkRmNBu0zhqIVQCbDRVNBtMokxU68P_m3N-s:1nI6qJ:GRSsVocmTHpWiVBk_7ESdWIEckVktkaVwbe-CHCzP08	2022-02-24 16:08:27.577834+05:30
5fdh3veh92cxergz1bt8h1ou50bfypdt	.eJxVjDsOwjAQBe_iGlnGP9aU9DmDtc6ucQDZUpxUiLuTSCmgnZn33iLiupS4dp7jROIqvBGnX5hwfHLdDT2w3pscW13mKck9kYftcmjEr9vR_h0U7GVbA3u02Tpgl4idZVQG8sUrYx1txGsdPOQABAopWdIIPvA5mKyDzlZ8vhZROC0:1nI8xM:LmMqPkMl6_840iK-iL_q8qBHeK12rND7dAHaqx9UgoQ	2022-02-24 18:23:52.836217+05:30
xxxkbnnk1u71pfe98rdtf77za57p63kj	.eJxVjMsOwiAQRf-FtSG8GVy69xvIAINUDU1KuzL-uzbpQrf3nHNfLOK2trgNWuJU2JkFz06_Y8L8oL6Tcsd-m3me-7pMie8KP-jg17nQ83K4fwcNR_vWZCF4UxVWqkIKEwqCBtBCJ5eTlYKsq8Zq51B5BUqALjIRZOVt8Dqx9wf4fzcs:1nKKs1:clj8wTGGj01iM2TNS15QcFIrCHcTLVC7SAXytBUWbAU	2022-03-02 19:31:25.194422+05:30
jt59ubfrg0t8rnb6o5rsohbdcd5jvl08	.eJxVjMsOwiAUBf-FtSEFhIJL935Dc3sfUjWQlHZl_HfbpAvdnpk5bzXAuuRhbTwPE6mL6q06_Y4j4JPLTugB5V411rLM06h3RR-06Vslfl0P9-8gQ8tbbQ13XjhyH4KcyXVGkovYA6ALEpHYR2uD2yxIjCTeGEFOnpwYYlafLxjFOQo:1nICww:agaqg5BoJ3jvSU2CySN1Ap29K_QteiIyvX53P1FQLdI	2022-02-24 22:39:42.945657+05:30
hp4qmxwi9uhm9woz0dsdwxa40r8ur6xc	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nL0aq:9xlboX6l9_FGxTfeZHhWV86ojss1Pz_jkjQk8Yp1swY	2022-03-04 16:04:28.255568+05:30
gc1eohiheifago0oy326xfbn7i3w4mnu	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nLOyB:kG79g3c9n_Do-3xJJfeP4bC5ycf5kRoRZsHKCB-88FM	2022-03-05 18:06:11.287617+05:30
2o2xh4921604r24vulos0nkl0zmti7hv	.eJxVjDsOwjAQBe_iGlk26y8lfc5grXcdHECOFCcV4u4QKQW0b2beSyTc1pq2XpY0sbgIrYI4_a4Z6VHajviO7TZLmtu6TFnuijxol8PM5Xk93L-Dir1-a_AFSBUXDIKJ0bIF60BHDiFkyGAoko-KHFsTwIzeICsL5EZdtD4r8f4ABvc3KQ:1nLm0g:cFOlG1CdcmE5y6DzmnDEiFaXSnO_ahgjgsxhu-krrwQ	2022-03-06 18:42:18.319024+05:30
vzqih7t2zsb2wcnhs63sybp76zoeh0gd	.eJxVjr0KwzAQg9_FczF3_kvSsXuewZztS522OBAnU-m714EM7SSQPgm9had9y36vvPo5iatARHH5dQPFJ5cjSg8q90XGpWzrHOSByDOtclwSv24n-zeQqebWdjaiQVAIgZsOmqCzVmuw1qYewqAmZ6iPSAxaucmQ4gBd-xPZpaDF5wvo7jcR:1nM6wf:GD4Tf0Q6aX4uhxuT4vmiyXM1IU66arwlQAQip4QmLgk	2022-03-07 17:03:33.825938+05:30
63opbxdync0csgdx03klj5g9zfc1v0on	.eJxVjEEOwiAQRe_C2hAmFBhcuvcMZGAGqZo2Ke3KeHdt0oVu_3vvv1SibW1p67KkkdVZATh1-l0zlYdMO-I7TbdZl3lalzHrXdEH7fo6szwvh_t30Ki3b21MkBgLchaO3qK3uaKDGLASEnAAKH4gNwSmaE0WD8GRKUMVZItOvT8owDgi:1nMGCz:OGApFEvu5cwb6-cfS3snWUZ9XrxJzTya1EMfxjEhm5g	2022-03-08 02:57:01.916301+05:30
0ez0y7nnasm6nk1a9w81zz3yloiqrf06	.eJxVjMsOwiAUBf-FtSE8CohL9_0Gch8gVUOT0q6M_65NutDtmZnzEgm2taat5yVNLC5iCOL0OyLQI7ed8B3abZY0t3WZUO6KPGiX48z5eT3cv4MKvX7rkAm9ipHAk0brLESwuZBxikx0ETFo50rRBlj5glEzE8JAqCybchbvDyehORo:1nMZTT:DokLeC8_SHuhumSfmdJkPJy0TDBjlRLyptdubn2AhfQ	2022-03-08 23:31:19.691848+05:30
vnf6wav97ul0ftra9jw35n279l72ss4w	.eJxVjEEOwiAQRe_C2hCghQGX7nsGMgOjVA0kpV0Z765NutDtf-_9l4i4rSVunZc4Z3EWxovT70iYHlx3ku9Yb02mVtdlJrkr8qBdTi3z83K4fwcFe_nWDMoqBWMiTQTg-YrsEzvOycKIQI6DIq8TgUYbKIC1hgfSYJ0ajBLvDyAXOAo:1nAuAL:eOVcCpdfT2zP3k_af9WpQTjaaE_YDJCg5ianY2OdQK4	2022-02-04 19:11:21.802529+05:30
to7xb65qmp4b0sa2xw4a7aw3ial9r0ab	.eJxVjEsOwjAMBe-SNYrixHFcluw5QxU3Fi2gROpnhbg7VOoCtm9m3sv0eVvHflt07qdizgYomNPvKnl4aN1Rued6a3ZodZ0nsbtiD7rYayv6vBzu38GYl_Fbh6wgXYKEEpHUESNGlsjMIaMmr4ICiYDUd4SBwUF0XnxiEh6SeX8A_OQ2mQ:1nevoN:1QJhmZQ7KjT2HN-yYdtGWUkOuJopbjnl68BZ5B3xGWc	2022-04-28 15:00:47.268776+05:30
mlv2ymelxq7c91tnz8586hwjnkbzp8un	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nFaiK:sUKZ19IUUzTkMlyx4HmxSaE0haI0Yh4WsIenqFDhqmw	2022-02-17 17:25:48.250567+05:30
r8rkhs3hzngggw9fbknz5nt0ekwfeiph	.eJxVjMsOwiAQRf-FtSFTaXm4dO83kBkGpGogKe3K-O_SpAvdnnPufQuP25r91uLiZxYXoZQ4_ULC8IxlN_zAcq8y1LIuM8k9kYdt8lY5vq5H-3eQseW-1k7TSNqecRpsYgCcknJERjk3IEFygYxjqyMnBOxMg1XBjNQjMCA-XwprODs:1nBHwc:md5h7msDJu05W839-1o91nyzt8M9GNDHAB5YgMUH9Hk	2022-02-05 20:34:46.934473+05:30
21ud4un190thg6fv0kcq41vp9hfz56mw	.eJxVjEEOwiAQRe_C2hCYaaG4dO8ZyDBMpWpoUtqV8e7apAvd_vfef6lI21ri1mSJU1ZnZcGq0--aiB9Sd5TvVG-z5rmuy5T0ruiDNn2dszwvh_t3UKiVby1eUJwDcOMwJmQK3jKYEEyfbUbwHYvrrSFEE7IwegoJhw4CkrMi6v0BILc31w:1nMlgK:mtA_uV8MFzZmHaeC-_lD4xAhSoi9q-osESOmocj9T3s	2022-03-09 12:33:24.426438+05:30
v5z2is5jw0g3wfpfmcgvot2lnvt7n5io	.eJxVjEEOwiAQRe_C2hDs0JZx6d4zEIYZpGogKe3KeHfbpAvd_vfefysf1iX7tcnsJ1YXBYM6_Y4U4lPKTvgRyr3qWMsyT6R3RR-06VtleV0P9-8gh5a3OjiORCZZMxBi3yG6FHsagN3oOCQAZE42Qgemk02KgAQyCotDy2f1-QIiyDiw:1nBhOH:Y1s6q8r0iBMRD4Ir7PB0ma44gqPDvx1vxH03Reqr2kk	2022-02-06 23:45:01.932824+05:30
js6aberxinaayw7cxk1684bf5olut4ks	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nFgMX:lSetuOvc434h7Jbmf2Twu9w2Z3BLtdfhRrIA-gFEIok	2022-02-17 23:27:41.941126+05:30
8i66opd51ahjuny72bh9uqkwf6u7zswz	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGOXX:vEjsJwRnNc15OvNmKMjgnHsvYEM6ubxafrS2URiVGeg	2022-02-19 22:37:59.315168+05:30
tc591srtcd4dksetdrsrrkb3n00uv71o	.eJxVjDsOwjAQBe_iGlmxN3YSSnrOYL1db0gAOVI-FeLuECkFtG9m3sskbOuQtkXnNGZzNhTM6XdkyEPLTvId5TZZmco6j2x3xR50sdcp6_NyuH8HA5bhW1cdagTuIUGgwXErQi4ShZaCr_qWpFPJtXeiEDTsvQeiNsyMWLN5fwAoTjky:1nD4KE:EpY8NSSbkQG1oRNvflhfUa7EJ3w7EqWK1i2Sw3TakpM	2022-02-10 18:26:30.204762+05:30
rs2u9grcqm1g7qwb03cptvlqlxe6p4qb	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nITde:q3dB0xe8Mr8U-Q2MJtYThsr_Iu-BvVhEHmDaFxOHZrE	2022-02-25 16:28:54.370492+05:30
010z640zucsl439kgffo4jgbrfulb9jj	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGeCM:URwehfx8hNkVJ1k2G9xINwhuG0cEcPd72ym85FfDLXs	2022-02-20 15:21:10.966863+05:30
mm6rrkltujy8yy0q1o2p32m0bg0ahx7d	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nDmwn:y1ROtkfAFNn64_9xychI-h3S4KzKVru9XucS--1OI4I	2022-02-12 18:05:17.39283+05:30
i3ygdaccelp0rikm1w8behnggetu6pfk	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nGnU9:dDLE-cGNWCQ0hteh71lOnqqsp252qcxKz1y7qeB8__Y	2022-02-21 01:16:09.962384+05:30
f4xhluh2uim7nfxomxxzzajsdpkga0pk	.eJxVjDsOwjAQBe_iGln-rgMlfc5g7dobHEC2FCcV4u4QKQW0b2beS0Tc1hK3zkucs7iIwYjT70iYHlx3ku9Yb02mVtdlJrkr8qBdji3z83q4fwcFe_nWZ3KYVQbgBM75DKzJTOSt0tZ6lZzX3iKDGgxqxwlJAQYdXJgYLbF4fwAGeTgY:1nIXu8:PAbOvREmaakO8Jz0ui8upniq3gjchKum3OwRQjVmJHU	2022-02-25 21:02:12.728465+05:30
20bhdfg3ibry7xq917p2cuw91i9ac5uj	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nHrDh:YtE1WCUhtUjJVzt2Tgd7_2tABbKKGdFirNZCUU8-UaA	2022-02-23 23:27:33.290804+05:30
kxmxe4r85oset091dbgvsur0ivqvrd94	.eJxVjMsOwiAQAP-FsyEUC7vr0bvfQJaXVA1NSnsy_rsl6UGvM5N5C8fbWtzW0uKmKC7CgDj9Qs_hmWo38cH1Pssw13WZvOyJPGyTtzmm1_Vo_waFW-nfgYC0HTWbmFHZEDL7s4o0AEKGnBC93hsdkZQeAyYmMlYFtXMDVny-9HI3Qg:1nI6Pu:5POVKu8no_-IU91EU2r9t_WgpBGLq6UpCCt9LUJuCAk	2022-02-24 15:41:10.826957+05:30
rwtokwgbebcsao3rgxxrr0fhkjgkoadh	.eJxVjMsOwiAQRf-FtSFCGRhcuu83kIEZpGrapI-V8d-1SRe6veec-1KJtrWlbZE5DawuClGdfsdM5SHjTvhO423SZRrXech6V_RBF91PLM_r4f4dNFrat47B2o4Fzog1RB8dQinVWi-OCzmBSkCd6TKDiZKzRwhojM3GF-BA6v0BAQ038Q:1nJ4qr:ZnmnKl4rlp2sHdHAjDTV0kOkt8AXtzfNDn-5RE541To	2022-02-27 08:13:01.31034+05:30
5kdar64t5lgfcjvsbcauav0jmtnx4dea	.eJxVjEEOwiAURO_C2pACkn5cuvcMzXz4laqBpLQr491tky50-96beasB65KHtck8TEldVHDq9AsZ8SllN-mBcq861rLME-s90Ydt-laTvK5H-3eQ0fK2hoEEQ7YTuDEwvCO3MRMgPTo_GjKcCD0TsVjLkHMHiZbEsJCH-nwBJEI5Dw:1nJr69:1-l2T62mp9ZWiMkzAgsftFWGnDoFpipr7fQBA4h9KOE	2022-03-01 11:44:01.57942+05:30
4ulzbbee7a2u2pcmeidky1tpyob8t9m1	.eJxVjMEOwiAQRP-FsyEUygIevfcbyG5ZpGpoUtqT8d9tkx70Npn3Zt4i4raWuDVe4pTEVYATl9-ScHxyPUh6YL3PcpzrukwkD0WetMlhTvy6ne7fQcFW9rXPoCGHjN4FCo688tBlMl3oYU-BtQUwRvWEqDTlzEpZQAqMhg1Y8fkC88k3kw:1nI9pd:dzE_BVV-nIc0m3JyoDN-0h0hJRvSofwskUHbGgqEg_g	2022-02-24 19:19:57.858976+05:30
nx094umx1v4mvfius6j6okeuko1ud5sr	.eJxVjEEOwiAQRe_C2hAozFBcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWzojT7xgpPbjtJN-p3WaZ5rYuU5S7Ig_a5XXO_Lwc7t9BpV6_NUBG9AjktAXAqJWl0XllWCVPuRg0rIvVZVDeYgILhsY0FLbE4DSI9wfc-zch:1nILdm:YExqlwvzhwer5Km9G32XRc9w8DX2gzMgtGwOE_f_ZIE	2022-02-25 07:56:30.96707+05:30
lznv9ec7dgqhu1pvxychb9pferymy7em	.eJxVjEEOwiAQRe_C2pACZWBcuvcMzQxDpGogKe3KeHdt0oVu_3vvv9RE21qmredlmkWdFUZ1-h2Z0iPXncid6q3p1Oq6zKx3RR-062uT_Lwc7t9BoV6-tUEWtE7AgwH0AJ5hyGH0IQE4HgciQ4wCxkNkCQ6sQZs4ioBIRvX-AOZ-N5Q:1nKLJh:t3rp0ulHK_ugm4tjG-s_GeoKYHfY4v8tVXziPKxDLKM	2022-03-02 20:00:01.262691+05:30
eqribkt1lqo7ot81fbd29kq4k2idfor8	.eJxVjEEOwiAQRe_C2hBoOkNx6d4zkGEGpGogKe3KeHdt0oVu_3vvv1SgbS1h62kJs6izssao0-8aiR-p7kjuVG9Nc6vrMke9K_qgXV-bpOflcP8OCvXyrTOih8lStgnTKAAEXgzzhCREmcWOzMlBdgjeSBwGn7Oz4KMbCaNV7w9JxzkE:1nL1vb:iQkNx6cVsjqAF2YcaOwbWmGkvdpEMb-0Vz6rIymR0yI	2022-03-04 17:29:59.219126+05:30
dd1prad125fk3mctoyr8l8ytv9y85m9g	.eJxVjDsOwjAQBe_iGlkx3sQ2JX3OEO3azziAHCmfCnF3iJQC2jcz76UG3tYybAvmYUzqokxD6vS7CscH6o7Snett0nGq6zyK3hV90EX3U8Lzerh_B4WX8q1hqW3hpDO5ywI2OdrIhHMDsiY4ydIAwQhJTNlmch6w3negIIm8en8AVuk5ZQ:1nLPw2:5lt2m5B8Eflf7hQdEEBJStsMYV0YBuEvMdjdd_2VvI0	2022-03-05 19:08:02.995204+05:30
d2d2dkzduqvotb31xutzok65vtgj0m6c	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nLmNO:GM_ulamsgL6zwnBdxeNjbYQD6e3_ZeaeegMnCAfP7GU	2022-03-06 19:05:46.571192+05:30
ymdjjg4gyld18ydgxckeouq97ahl0nj7	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nM7rC:8-qNsFCOOC91Thi46ow5Q6MMumEwq0UkxJpcIHUT1xE	2022-03-07 18:01:58.617509+05:30
6sc80wgar337ji2n0kxlqk13nk1aex25	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nMRO8:dcIkqpfMPKcnjAA06NkTIagD7IS2UcnRM0FfN0mKvT4	2022-03-08 14:53:16.093931+05:30
bmo6z40xr8pfh7rjsng32yc3z842966o	.eJxVjDsOwjAQBe_iGlnxb1lT0ucM1q4_OIAcKU4qxN0hUgpo38y8lwi0rTVsPS9hSuIilEZx-l2Z4iO3HaU7tdss49zWZWK5K_KgXY5zys_r4f4dVOr1WwOckQxGbwuZgt4la4BTiQhQtB9YOUVODVZpgsIKMmeLRmfvkEqM4v0BI-Q4Sw:1nMmVY:ZVG_DQPwVvsCXfEbJZevibgQC_ACar6DLOs3ga3egp0	2022-03-09 13:26:20.851365+05:30
k9wvtzwqsojxx3a18imcpeatd3qmx9zy	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1ngoUu:_ouatDRRFK0B3m4Wy2ef8bvocae_mCGNMp6-kPAq0e8	2022-05-03 19:36:28.443569+05:30
ext7ia2quxoymdzg4mslwnkj3yduxnmj	.eJxVjEEOwiAQRe_C2hAGkAGX7nsGAsxUqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xInERWqM4_a45lQe3HdE9tdssy9zWZcpyV-RBuxxm4uf1cP8Oaur1WztliYL2piDl4K3CMxUEhDEoQi42sQcNJjkw4JCBLBsgguxhzNqI9wcbIzfT:1oOr1d:eP0aV30ANh8i_pZwrevJa1a5isnuThp8Dw5nPZw8PHE	2022-09-02 07:12:17.566212+05:30
9emh2eegdqyir0j8e8dya1m2csbdxg4j	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1nuyNS:5vKFg7NtO6vNeyafEFuyjYXBEW-bE437ahCJNqEekh0	2022-06-11 20:59:18.859266+05:30
nw0wednsl0k1rj4z1hprfa7tqb55txom	.eJxVjLsOwjAMAP8lM4qcNi8zsvMNlZ0YWkCJ1LQT4t9RpA6w3p3urSbat3nam6zTktVZDTio0y9lSk8pXeUHlXvVqZZtXVj3RB-26WvN8roc7d9gpjb3sXi0EJ2HzIJkiEYOSZLxliwZZogSnANIN6SQMY4ZjfUEjKODhOrzBTSbODM:1oSy6t:tPFO4LSyCdNT-UbvIstEVJ7FC-Vl8Rux0Ks7Zwp90yE	2022-09-13 15:34:43.404482+05:30
l7e8kf6uirhydwq3dg9wlrh81wiy0o5k	.eJxVjMsOwiAQRf-FtSE8hocu3fcbyACDVA0kpV0Z_12bdKHbe865LxZwW2vYBi1hzuzCpFPs9LtGTA9qO8p3bLfOU2_rMke-K_ygg0890_N6uH8HFUf91mewoCxYogJJIBVpIQufpM6ESUdblMymgDNgPGmHqgjrqUSjjaPo2fsDMZc4dw:1nzjZe:35g6heOrV5zrWskgCBliemS5UoYaQoPh75EVfGC5q88	2022-06-25 00:11:34.449828+05:30
s8d3ylab87outzyyrgdr0zwfrv1cd7yb	.eJxVjMsOwiAQRf-FtSEw5enSvd9ABhikaiAp7cr479qkC93ec859sYDbWsM2aAlzZmcGAOz0u0ZMD2o7yndst85Tb-syR74r_KCDX3um5-Vw_w4qjvqto0fh_CSdAKuILBijIWpFcioTeq-NyBKEAYKiUankikomoivFWI_I3h8AGzew:1oOxPN:vjSXUf8Ys9aVkK_0kzhblgLsHpVfeW0mfD6N8UsSRF0	2022-09-02 14:01:13.551464+05:30
afvcmiqs5uwfdzxnzyhe2hmi7oupe51i	.eJxVjMEOgjAQRP-lZ9OUskupR-98A9ltF4uaNqFwMv67kHDQ48x7M2810ramcauyjHNUVwWoLr8lU3hKPkh8UL4XHUpel5n1oeiTVj2UKK_b6f4dJKppXwd0QL31fTt1nTXSSoPGEdjJI--RBKVj6z17wEBkYM_YWA52YnBOfb7zGTes:1o0bOy:KrFDCnerbewYP6eeYImlWJcfAr2xaXCGp4Da9R3ltCM	2022-06-27 09:40:08.568846+05:30
io2wk84j7wgdf08iugbbcyxy1su1yscx	.eJxVjEEOwiAQRe_C2hAGWpi6dO8ZyDADUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnBWjU6XdNxI887UjuNN1mzfO0LmPSu6IP2vR1lvy8HO7fQaVWv3XHwp5cKEZCkNIDgnd9SYyJIXgWcLYDGZCBaEBr0VNxYtmIR5ONen8API04Yw:1o4gge:xVSkqp22oi0XGy2Fdy56mn2otPdXPyB0fyYZdkJ3mTE	2022-07-08 16:07:16.862681+05:30
t5qivvfefwm5f2eykpebxia5gtizgjs2	.eJxVjDEOwjAMRe-SGUWKnNY1IztniOzYoQXUSE07Ie4OlTrA-t97_-USb-uYtmZLmtSdXSR3-h2F88Pmneid51v1uc7rMonfFX_Q5q9V7Xk53L-Dkdv4rQXEFIfYlxyUsMvCaIwoHUUoA0QBJgRUCIUMchkKm1ofIsWOydz7Ay5AOPM:1oV2Bw:DK-WJFhH4YU2LuuX97NAzvxgr0aI-nxyxzX1Ci98XTM	2022-09-19 08:20:28.108593+05:30
m24aih626n63234cde5j8i1xlgn6wcxu	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oATOx:uovbo9ruFK_jn6BfKsZJwNx4OVtXTjLCWyjiHKW0KJc	2022-07-24 15:08:55.326253+05:30
u43qq9i6q9neml64um20pzmsj94cfx69	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oFbJX:1k5NOv5eL-Dby8nT_P6j89Apzd9niGHsfhI0mcCfIvw	2022-08-07 18:36:31.692685+05:30
p2njz5ohqcqluo33lq7t53hywsssamhw	.eJxVjEsOwiAUAO_C2hDg8Sku3XsG8uBRqRpISrsy3l1JutDtzGReLOC-lbD3vIaF2Jkp49npl0ZMj1yHojvWW-Op1W1dIh8JP2zn10b5eTnav0HBXsbYRkkuA4mIE5IBMFZo4YWbnbIwCdQQrTaepE8IGpOTOFtl1TcQkNj7AxbXN3A:1oQR5d:q3bK_4mP6324-08mqXUFobEtzvzsePt0LhIqKigHqxI	2022-09-06 15:54:57.245742+05:30
4p3ahlg11bak1f8xwhv7aw7dzsqmv5iy	.eJxVjDsOwjAQBe_iGlne-BtKes5grXdtHEC2lE-FuDtESgHtm5n3EhG3tcZtyXOcWJwFgBGn3zUhPXLbEd-x3bqk3tZ5SnJX5EEXee2cn5fD_TuouNRvTcaTBZ-URjaFSiEewFtIaDCQAe2UDtaOQaNVo2UX2AxKleDymDN48f4ALUQ32A:1nMpHI:-nXZGAET94Im9MrYlnwhBQersaDeaghdzP11N9IOsRQ	2022-03-09 16:23:48.252519+05:30
hapczleszdx6xw8rqy1491fk4go38ogi	.eJxVjDsOwjAQBe_iGlmxN3YSSnrOYL1db0gAOVI-FeLuECkFtG9m3sskbOuQtkXnNGZzNhTM6XdkyEPLTvId5TZZmco6j2x3xR50sdcp6_NyuH8HA5bhW1cdagTuIUGgwXErQi4ShZaCr_qWpFPJtXeiEDTsvQeiNsyMWLN5fwAoTjky:1nh7im:4NWENHyQ5vKTDQifvw_zpdseokepEBI66CrrsgN7UlQ	2022-05-04 16:08:04.945063+05:30
8b2x8p9ohcfh2cj01o91vef694kvp0aj	.eJxVjEEOwiAQRe_C2hAGWigu3XsGMsMMtmpoUtqV8e7apAvd_vfef6mE2zqmrcmSJlZnZe2gTr8rYX5I3RHfsd5mnee6LhPpXdEHbfo6szwvh_t3MGIbv3VXJEPxTMUVFyCWIJlN7LsYEHugAFZ6cNkMyD56R50Hyg4gkAAORr0_SAM4ZA:1oOznR:DNyDPGDsZUsMI8qhccGtmcs5ZF38NTBZmjvZ7YrMpLw	2022-09-02 16:34:13.513597+05:30
avvsgles7gom1k865p6bh5qe8y290kct	.eJxVjMsOwiAQRf-FtSEwQIdx6d5vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiZ2ZNJKdftfg4yO3HaW7b7fOY2_rMge-K_ygg197ys_L4f4dVD_qtwYMRihTkIKxUhFYI8kghBw0lhgBtSo2eoQsAQnElMjqVCZPmGUS7P0BAJY3Yw:1nxRfG:uag3pOn8gYn749J4RfiRuJwBR98mrrIqUqOjk92o4g8	2022-06-18 16:39:54.245037+05:30
yvxxpdq02221bldhllyhwpg2y80vt50n	.eJxVjEEOwiAQRe_C2hCZAUpduu8ZyMAwtmpoUtqV8e7apAvd_vfef6lI2zrGrZUlTqwuCnpUp981UX6UuiO-U73NOs91Xaakd0UftOlh5vK8Hu7fwUht_NYpODaWEPlMYhND6MVAB0kQOInzaHOHCOI9OC9o2ZXQA1pPhj2Ien8ALfA33g:1oSySn:6Mv1n9a2TO8QayM8Nfzt8WqlVaWxC79Swh6ypHt0PFg	2022-09-13 15:57:21.393498+05:30
syyrtt5aeduapmcmzcjlxuhzxybmwvkz	.eJxVjMsOwiAQRf-FtSHAdABduu83kIEZpGrapI-V8d-1SRe6veec-1KJtrWlbZE5DawuygZQp981U3nIuCO-03ibdJnGdR6y3hV90EX3E8vzerh_B42W9q0RkLFaU6tHCrbzUSi6MzNHRxXIhhJNAZeZkXKHuZPgTC0iHgCQ1PsDOI04wg:1nzuqs:E_PKTuRmf9tAZAHpX4cdKs6fCytZuej067j40HWhcwg	2022-06-25 12:14:06.504827+05:30
1ajkx7bjbhr7b399y6ugw21q0dzl9nwd	.eJxVjMEOwiAQRP-FsyFbSl3w6N1vIAssUjWQlPZk_Hdp0oPeJvPezFs42tbstsaLm6O4CDWhOP22nsKTy47ig8q9ylDLusxe7oo8aJO3Gvl1Pdy_g0wt9_WZtB-iRR5YWTAI6ClF5GmEZCkk0yPYjoKK1irNJmjkEcakEQhRfL4xPDf2:1oQQWJ:drIbmwAiFFyEsRdEJsI3nsuihtJ-07dYpDfEeFvrHvA	2022-09-06 15:18:28.019913+05:30
p1rv6kuta80d1gn159dvi2pgeweeit18	.eJxVjDsOwjAQBe_iGlkbf7BFSc8ZrF3vGgeQI8VJFXF3iJQC2jczb1MJ16WmtcucRlYXNQSvTr8rYX5K2xE_sN0nnae2zCPpXdEH7fo2sbyuh_t3ULHXbx0chlLEOIjoczBFCp3F5kCmuMgOrDURPAfORrCwswNC9EQZCQGMen8AS4E5Eg:1o0kwD:gnam5ilKDQhZ6OIiZLsBcJ71mniRdcjFLr9MBE8r_mA	2022-06-27 19:51:05.124835+05:30
yogjp8im2pvoayz2qcbjpwr47zel6bqi	.eJxVjDsOwyAQRO9CHSHzs5eU6X0GtMA6OIlAMnYV5e7GkgunmWLmzfsyh9ua3FZpcXNkdyZAsNu19RjelI8pvjA_Cw8lr8vs-YHwc618LJE-j5P9EySsqb11M1OvyKIIHYC1cqJBGm28iVr5CGKQoFUAiS1JT9BJgUb1SBCMtey3AwoGN10:1o4k7S:im1vsXhLeQj3G8Pr1xqWuX9NrXecsMZF5xg8m8nO6oM	2022-07-08 19:47:10.258781+05:30
o3c4p5v55vodjxawzwdllt3ilw2yaxzf	.eJxVjMsOwiAQRf-FtSEw5enSvd9ABhikaiAp7cr479qkC93ec859sYDbWsM2aAlzZmcGAOz0u0ZMD2o7yndst85Tb-syR74r_KCDX3um5-Vw_w4qjvqto0fh_CSdAKuILBijIWpFcioTeq-NyBKEAYKiUankikomoivFWI_I3h8AGzew:1oV4Td:9LWK82EgC0T9pM6ahhxojGL57XpE_hD3vFkPYK6K4DI	2022-09-19 10:46:53.798018+05:30
9dao6t5soez8mbvicdbnuajcr7f5gb24	.eJxVjMEOgjAQRP-lZ9OUskupR-98A9ltF4uaNqFwMv67kHDQ48x7M2810ramcauyjHNUVwWoLr8lU3hKPkh8UL4XHUpel5n1oeiTVj2UKK_b6f4dJKppXwd0QL31fTt1nTXSSoPGEdjJI--RBKVj6z17wEBkYM_YWA52YnBOfb7zGTes:1oAVsF:_Q1P17CO3oOs97Y3wsleqOTUWZmPOnt4B62e4cJ4_pI	2022-07-24 17:47:19.363785+05:30
kzf4ojmyuhjwodm8q82qrffprd0sazeo	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oFbJq:5WZhB0hIbG4JplcNBTnmXa9oxpPA4XrnkBeG1p2U5gg	2022-08-07 18:36:50.127985+05:30
ca9b8nplk1jvmqlafhtiq6p9onybia5i	.eJxVjEsOAiEQBe_C2hBgmk-7dO8ZSEODjJohmc_KeHedZBa6fVX1XiLStra4LWWOI4uz0AbF6XdNlB9l2hHfabp1mfu0zmOSuyIPushr5_K8HO7fQaOlfWtlBheC1cDGBSRVXGVWgY1nBK_BYano0QKmqjwQgQKgwYRsrbfKivcH_2c22A:1nMukV:ZYoNRUvepSF7Dz1aDj2pXlzqXghRaKRi4yP7tZJkuQM	2022-03-09 22:14:19.205492+05:30
rdgn9cbpcz53oaqj3160zb4oh6hr1ivw	.eJxVjDsOwjAQBe_iGlnxb2NT0nMGa23v4gBypDipEHeHSCmgfTPzXiLitta4dVriVMRZKLDi9LsmzA9qOyp3bLdZ5rmty5TkrsiDdnmdCz0vh_t3ULHXbx0YHXgyyYwZwFiwAB4YWWetuBBoD3YEUpapUBi88xBIOzs4nQ2yeH8AIMs30g:1nhrJM:yMfwdoIY1HBaW3tHzuEgjyA-FoT9Twm9m4HdXt3-oS0	2022-05-06 16:48:52.377282+05:30
wfhiqtpye6qbz5s6hdbl0ce1bjhgmm6a	.eJxVjDEOwjAMRe-SGUWN0zgOIztnqJzYogXUSE07Ie4OlTrA-t97_2UG3tZx2JouwyTmbACSOf2umctD5x3JnedbtaXO6zJluyv2oM1eq-jzcrh_ByO38VsHIQo9I3v0iJGLkgo5Epc78i4LEqSIoNwnjUEYlaSTCAIpExTz_gAkcTgp:1oP3QO:XltEwgZndpb_j633G7re6ioMELOLqHFFDsEW5VrZ0Mw	2022-09-02 20:26:40.931921+05:30
4c3m038bsrgkbtcpjx3t2k2cp6n053wv	.eJxVjDsOwjAQRO_iGlnr-BOHkj5nsHb9wQFkS3FSIe6OI6WAZjSaNzNv5nDfsttbXN0S2JWJUbDLb0ron7EcKDyw3Cv3tWzrQvyo8JM2PtcQX7ez-3eQseW-BrDoKY1olNIioPGgEadBCUgiDjIlQz7Z7gyCVSCniAIsSUlddGSfLzMuOEk:1nxjQD:flRb5dUuv1xiF309JPiuG5fPcQUn5KRzt1ie9N0TFUU	2022-06-19 11:37:33.221404+05:30
vvzya2ahbfgyxj5cguiknqoyhv2ez9ki	.eJxVjM0KwjAQhN8lZwnml8Sjd58hbHZXU5UEmvZUfHdT6EGZw8B8M7OJBOtS0tp5ThOJi9DRitNvmgFfXHdET6iPJrHVZZ6y3CvyoF3eGvH7enT_Dgr0MtZWk8lIJuZgtdYRPXEgT4jeedbOIAdWygwRKJeHmTsiKGQ8Exjx-QI_iTkQ:1oT3Zu:aFwNqMAzN36M7AoGXm3uN_n0yIoBoY93q7FMw_bBVxQ	2022-09-13 21:25:02.424687+05:30
hp61t8umnbcjeqd7199hnsa5b4w4yo1j	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1o04qR:Xajxx0b0KnPXFt0BfOPzztbztL1kHbRQrTDxjnx8m0c	2022-06-25 22:54:19.015613+05:30
gqlvle3083ki5ua475xmieo68lbk4m2z	.eJxVjDsOwjAQBe_iGlne-E9JnzNE6_UGB5At5VMh7k4ipYB2Zt57iwG3tQzbwvMwZXEV4J24_NKE9OR6qPzAem-SWl3nKckjkaddZN8yv25n-3dQcCn7Gh134wgMyoOOFFMwHDQTQBc1J-Ws8TsL5IIFNkxeGRXRenAYKLH4fAElUzfn:1o11Mo:e3pTwy5KneZTVAP55D-vy5B585WKup2lYAD434xGrAI	2022-06-28 13:23:38.732274+05:30
8wzocnhqav39uxjbqz664w3tqjuxose0	.eJxVjEEOwiAQRe_C2hAcKGVcuvcMZGBAqgaS0q6Md7dNutDtf--_t_C0LsWvPc1-YnER-ozi9LsGis9Ud8QPqvcmY6vLPAW5K_KgXd4ap9f1cP8ChXrZ3uiSCUqzMdEMOoCONjsii47yVtGj0zkol5gxB1AIdoDRcVaAKVoA8fkCPCw4eg:1oV634:WCbjXeDjlXwY3THwTUL3FmZBBTDSjP19Y4JIHOIMjAw	2022-09-19 12:27:34.381929+05:30
gz8izc2p9o81f94ml2cafuo6skwi7tju	.eJxVjDsOwjAQBe_iGlmON3ZsSvqcwdr1rnEAJVI-FeLuJFIKaGfmvbdKuK01bYvMaWB1VU2w6vJLCfNTxkPxA8f7pPM0rvNA-kj0aRfdTyyv29n-HVRc6r7uILe-cNMUwEAudz4Y3qGPZJwwIfpAQgDOZtuiN0UMlIgSYkccQX2-Phk40A:1o4nU8:V4JcP-w25ByQTg3aaoLDwVK3dmhvDIXjHJh-GJhGf9Y	2022-07-08 23:22:48.920395+05:30
7bkl9h548xqc0w716gp6q4h9jj3k50np	.eJxVzMEOwiAQBNB_4WwIdFkpHr37DWRZqFQNJKU9Gf9dmvSg13kz8xaetjX7raXFz1FchLZKnH7TQPxMZaf4oHKvkmtZlznIvSIPbfJWY3pdj-7fQaaW-xrAIBDjgEqPEFhbwElTGFMKpBU4QsWDsWfLLhlii46mbqhiR0Xi8wUXGTgd:1oBFGk:PD8HZMZBp21HggviMG6tfYd0W69oaie0EJ_-hjuxFCc	2022-07-26 18:15:38.293677+05:30
a09o5g5c5yc8p1bkdy4lt3qc6ir1c08g	.eJxVjMEOgjAQRP-lZ9OUskupR-98A9ltF4uaNqFwMv67kHDQ48x7M2810ramcauyjHNUVwWoLr8lU3hKPkh8UL4XHUpel5n1oeiTVj2UKK_b6f4dJKppXwd0QL31fTt1nTXSSoPGEdjJI--RBKVj6z17wEBkYM_YWA52YnBOfb7zGTes:1oGHRY:zOTpf8g7TUmpkrxh0fc-jRDeBzfcinhpx0ELrj7HXx4	2022-08-09 15:35:36.340804+05:30
0h01hwpihwsjvbv8oju8p5idyo8qwls1	.eJxVjM0OwiAQhN-FsyEgv-vRe5-BLLBK1dCktCfjuwtJD3qZZGa-mTcLuG8l7I3WMGd2YVIJdvpNI6Yn1VHlB9b7wtNSt3WOfCD8aBuflkyv68H-HRRsZawtgAOvUWlDVnWrvYCI0huQMSt7Fs7LW0pAUva8c0hdTbLkHAn2-QIKHDfo:1nN88u:-5hyMpM15h2TLjYO9fbZT-RYgMLQrUcGjjjpW4moBcc	2022-03-10 12:32:24.716871+05:30
gj7xjssdyvq2oqlwm6wdho2bgetyi61n	.eJxVjLsKwzAMAP_FczGWI0WmY_d-g5H8aNKWBPKYQv-9GDK0691xh4myb0Pc17LEMZurAWRz-aUq6VWmpvJTpsds0zxty6i2Jfa0q73PubxvZ_s3GGQd2thDZQ1OEEiLh8wVpCqT77teMGTsJRGg61zwopQIA4FzhZWRIZnPFxhBN1w:1ni5uZ:VNL-GfhosBFbrihypG1eHnBx-2n65LCUTIkiczuS2mw	2022-05-07 08:24:15.071699+05:30
qd7i3l85imqc3l3312u88rt9tzb2qs28	.eJxVjDEOwjAMRe-SGUWN0zgOIztnqJzYogXUSE07Ie4OlTrA-t97_2UG3tZx2JouwyTmbACSOf2umctD5x3JnedbtaXO6zJluyv2oM1eq-jzcrh_ByO38VsHIQo9I3v0iJGLkgo5Epc78i4LEqSIoNwnjUEYlaSTCAIpExTz_gAkcTgp:1oP3mX:awvpxqj6W1lgT6w-bAu9TCNJ3hCVS_buMg2V6sn883I	2022-09-02 20:49:33.119164+05:30
eicpac620yb06tmvqwqe8go3dqx4qwa1	.eJxVjLsKwzAMAP_FczGWI0WmY_d-g5H8aNKWBPKYQv-9GDK0691xh4myb0Pc17LEMZurAWRz-aUq6VWmpvJTpsds0zxty6i2Jfa0q73PubxvZ_s3GGQd2thDZQ1OEEiLh8wVpCqT77teMGTsJRGg61zwopQIA4FzhZWRIZnPFxhBN1w:1nykJ1:E1joUaPqpQjJYEKQ7RUSyWQYw96bz7bTu2eiw9NoIB4	2022-06-22 06:46:19.232565+05:30
1k4qjj97pogl1x63wqyqfyogudqy66oq	.eJxVjEEOwiAQRe_C2hBg2gFcuvcMhJkBWzVtUtqV8e7apAvd_vfef6mUt3VIWytLGkWdlYu9Ov2ulPlRph3JPU-3WfM8rctIelf0QZu-zlKel8P9OxhyG751h8TRVRdZ2DmREAsisxhjwVsE9gVQmMibaiHYDqgXtCRQMQBG9f4APh04Qw:1oTGeL:pNkqj3EaLSbwoGZohaoDL-vniJYWqUlDAdsjbXuGS-4	2022-09-14 11:22:29.044719+05:30
s47ly5kkzcs1i6uzmhj7qcazvnjy97bm	.eJxVjEEOwiAQRe_C2hCYAm1duu8ZyMAMUjWQlHZlvLtt0oVu_3vvv4XHbc1-a7z4mcRV6N6Iy-8aMD65HIgeWO5VxlrWZQ7yUORJm5wq8et2un8HGVve6yEEtkaPZAGYI6PqSDnXpYCoTE8WTTewIXBBj8CQksK4U1AuRgdGfL5JdTjf:1o0N2j:Rt1grohNwoc4SJZqI7dNLqL93Fp_hwvc0JdoKqOe99E	2022-06-26 18:20:13.999468+05:30
kq6xtgmhb67pbktq45aidd6iys3skj5q	.eJxVjDsOwjAQBe_iGlngH15K-pzB2vVucADZUpxUiLtDpBTQvpl5L5VwXUpau8xpYnVRxkd1-F0J80PqhviO9dZ0bnWZJ9Kbonfa9dBYntfd_Tso2Mu3RgPWHUFCtILsiH0YmQBGCwAO0ZlAlCPFkwcWb87G-YzM2cbIAYx6fwA71ziR:1oQQms:q-5xSM_bIWMODo16bZOMxnBQ1RLG4MV3yuj2kiD7PwM	2022-09-06 15:35:34.058112+05:30
fw0381zrkhpqe0fyeihfwuc2wdswdeys	.eJxVjDkOwjAURO_iGllxvOBPSc8ZIv_FJIBsKU4qxN1JpBRQTDPz5r3VkNZlHNYm8zCxuqg-dOr022Kip5R94kcq96qplmWeUO-IPtamb5XldT3YP8GY2ri9gSMbEUQgbzmT7yEBgHchuoARO5ujE-szGLLBbmI24exIyG_pSX2-RSw5Ew:1oQU4R:ESPy709ORhUKV01gwq6rUumolAMhd9htikH5_YhmWts	2022-09-06 19:05:55.278333+05:30
jxgsdtomvjylx7pvsyd207707u07y3i9	.eJxVjDsOwjAQBe_iGlmON3ZsSvqcwdr1rnEAJVI-FeLuJFIKaGfmvbdKuK01bYvMaWB1VU2w6vJLCfNTxkPxA8f7pPM0rvNA-kj0aRfdTyyv29n-HVRc6r7uILe-cNMUwEAudz4Y3qGPZJwwIfpAQgDOZtuiN0UMlIgSYkccQX2-Phk40A:1o4nYV:R7PwjlNoyFBebGfhjK46bsmyckCzrC6AIZsyUR5gzHI	2022-07-08 23:27:19.796079+05:30
pvb7eknn0oga65nsp8jsw120hsksqa7s	.eJxVjDsOwjAQBe_iGln-rH-U9DmDtWsbHEC2FCcV4u4QKQW0b2bei0Xc1hq3UZY4Z3ZmWgl2-l0J06O0HeU7tlvnqbd1mYnvCj_o4FPP5Xk53L-DiqN-6wBSgXZEDlzR4IWUIrtgPYIlQw6z9kkhQhI5gbFBeonWSCtUuQb07P0B_HI3QQ:1oV6op:dEXzw708MU2j3eG-OWlqcOjvlwmwJPcVkoev69nDGvc	2022-09-19 13:16:55.313215+05:30
q1nxtqw1ghvq1wspp432sdbri397uhiu	.eJxVjEEOwiAQRe_C2hCYAm1duu8ZyMAMUjWQlHZlvLtt0oVu_3vvv4XHbc1-a7z4mcRV6N6Iy-8aMD65HIgeWO5VxlrWZQ7yUORJm5wq8et2un8HGVve6yEEtkaPZAGYI6PqSDnXpYCoTE8WTTewIXBBj8CQksK4U1AuRgdGfL5JdTjf:1oBgDH:oRYhQLxYIeyZBwYaKdKu3FMsBl2qdL70CyxUQhqSzRM	2022-07-27 23:01:51.433963+05:30
6hbb2ypy3p3jcj4jvj53990lm9nkpxra	.eJxVjDkOwjAURO_iGlne_U1JnzNYXr5xANlSnFSIu5NIKaCYZt6beRMftrX6beDi50yuhAOQy28bQ3piO1B-hHbvNPW2LnOkh0JPOujUM75up_t3UMOo-5opZMWIAgU0E1FyRCtRo0XFojaFGeAiu2y5DgqMSU5Fx-0eCcykRD5fH343kQ:1oHHj4:_n6ZeHFII5SYhBBQuCCOtNO3WaOCVliRnTbUc66Pfw0	2022-08-12 10:05:50.802108+05:30
qmikeiansa7id9amldmlz37v4nxfom29	.eJxVjMEOwiAQRP-FsyFZoLR49O43kN1lkaqhSWlPjf9um_Sgx5n3ZjYVcV1KXJvMcUzqqsCCuvy2hPySeqD0xPqYNE91mUfSh6JP2vR9SvK-ne7fQcFW9jV7AsTgwQs7ZEI00lvYo2Rn8mDAEmUacuiDIfaJyVLnnXVDJz049fkCVms47g:1nN9Ho:MmzkQFZiUeA5ZLJzZ5CsQcFpqJbkMGGUgN8dXNN-WmI	2022-03-10 13:45:40.907188+05:30
18f2ffdiaac2gq9ka4blawqsl145pte7	.eJxVjM0OwiAQhN-FsyFuy_Lj0bvPQBYWpGogKe3J-O62SQ96m8z3zbyFp3Upfu1p9hOLiwCN4vTbBorPVHfED6r3JmOryzwFuSvyoF3eGqfX9XD_Dgr1sq1Ntm7IRoGxJhrLGLQJOjoYERgwKa0CjhjGqFElGhgcKd6CYpc5n8XnCxVsOCM:1nj2IT:ei-10_b3B0s6FlAiDBUDBtlMU6HTmwHMEHUQbL79xSQ	2022-05-09 22:44:49.337876+05:30
1doo1ik1tfqxfzzyvz3sf1bgv1x3m986	.eJxVjEEOwiAQRe_C2hAYBIpL9z0DmRlAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xSuIiwChx-l0J-ZHbjtId222WPLd1mUjuijxol-Oc8vN6uH8HFXv91l5ZpzM5bWwCNsmjAmc9lIFzMMCKEwcgsENAPhfioIqlonV2zMaReH8AH0Y4iw:1oP72r:gGxpCyXwVYW7gCnbxz7PuPrFUQ3RRkHJmaqieEEKsmY	2022-09-03 00:18:37.423755+05:30
41sg42ixusiwzl9ngxbd8q97awzxs339	.eJxVjMsOwiAQRf-FtSE8hocu3fcbyACDVA0kpV0Z_12bdKHbe865LxZwW2vYBi1hzuzCpFPs9LtGTA9qO8p3bLfOU2_rMke-K_ygg0890_N6uH8HFUf91mewoCxYogJJIBVpIQufpM6ESUdblMymgDNgPGmHqgjrqUSjjaPo2fsDMZc4dw:1nzjDi:FbMnhJ5lu71zuh7biwFJRvE5hFDN20BDoVMS1EfjZb0	2022-06-24 23:48:54.909724+05:30
o72lud4kqk400hpru84zagdtcoi3efet	.eJxVjDsOwjAQBe_iGln-xD9Kes5g7dprHEC2FCcV4u4QKQW0b2bei0XY1hq3QUucMzszFSw7_a4I6UFtR_kO7dZ56m1dZuS7wg86-LVnel4O9--gwqjf2hjSkqTWkzNFCu-tIYFZTuhCAOuKUg7RBG1EkN7KpKxVoAFdERQ8svcH_4M3Kg:1oTKJj:aXUXYvnHSZ5hTZDzy4d1jScU-0HGz3ohaJ_eyWVU0Dk	2022-09-14 15:17:27.941767+05:30
fc9vfm03lfrf3bk2epbon24d0hcgokvz	.eJxVjDsOwjAQBe_iGlne-E9JnzNE6_UGB5At5VMh7k4ipYB2Zt57iwG3tQzbwvMwZXEV4J24_NKE9OR6qPzAem-SWl3nKckjkaddZN8yv25n-3dQcCn7Gh134wgMyoOOFFMwHDQTQBc1J-Ws8TsL5IIFNkxeGRXRenAYKLH4fAElUzfn:1o129v:NJFJ3W9uQAIJweJSDrxpheNIkIHnMEmb9YMKjbs_OUE	2022-06-28 14:14:23.02152+05:30
7o6bxtblptgtsr6hizscryi3esdrqv4j	.eJxVjDsOwjAQBe_iGlngH15K-pzB2vVucADZUpxUiLtDpBTQvpl5L5VwXUpau8xpYnVRxkd1-F0J80PqhviO9dZ0bnWZJ9Kbonfa9dBYntfd_Tso2Mu3RgPWHUFCtILsiH0YmQBGCwAO0ZlAlCPFkwcWb87G-YzM2cbIAYx6fwA71ziR:1oQQpt:olZzy0lRw3he7etChLVEgO6z6FhwliegQBS_CmHfsjU	2022-09-06 15:38:41.165912+05:30
9u2uafxbcql738cqp87m29x38otbn1yo	.eJxVjEEOwiAQRe_C2hCYAm1duu8ZyMAMUjWQlHZlvLtt0oVu_3vvv4XHbc1-a7z4mcRV6N6Iy-8aMD65HIgeWO5VxlrWZQ7yUORJm5wq8et2un8HGVve6yEEtkaPZAGYI6PqSDnXpYCoTE8WTTewIXBBj8CQksK4U1AuRgdGfL5JdTjf:1o6Ahg:VA5zJK0aOHrjrH7aTOiWbzot-rIVC0iBiP8EZGRpiyE	2022-07-12 18:22:28.461158+05:30
8tdrjqec5fod87bm5w202mlfsbtjfn2j	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1oBvju:ZVJK6aMn5gzWKtxO8qHzUBKLHwPwCgvy92-RA6i1Bx4	2022-07-28 15:36:34.324492+05:30
st90boi597wyuzelmewmlleu68zykkok	.eJxVjMsOwiAQRf-FtSFleJRx6d5vIAMMUjU0Ke3K-O_apAvd3nPOfYlA21rD1nkJUxZnoUGJ0-8aKT247Sjfqd1mmea2LlOUuyIP2uV1zvy8HO7fQaVev3V0UY-elfGOU4GEAxsHyqIuOoJHzMqPQMZSLjyQAWchAaqUHTouVrw_Hqs36w:1oV7oL:vBRooV-pB93yG0JfcSO1mRYO7pfhCfiqLLXv1lJiODQ	2022-09-19 14:20:29.314922+05:30
tl5zssb8h2py24wttflxt0ek482uov81	.eJxVjLsKwzAMAP_FczGWI0WmY_d-g5H8aNKWBPKYQv-9GDK0691xh4myb0Pc17LEMZurAWRz-aUq6VWmpvJTpsds0zxty6i2Jfa0q73PubxvZ_s3GGQd2thDZQ1OEEiLh8wVpCqT77teMGTsJRGg61zwopQIA4FzhZWRIZnPFxhBN1w:1oHmK2:Nj7jCzSxGPSOh7U3XH_S2RKqGIJWAwuAEYC_nCNca2I	2022-08-13 18:46:02.983167+05:30
tzi8bl1ily32it6ymauj8072oq7m6htq	.eJxVjEEOwiAQRe_C2hBkGEpduu8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3ERZ9Di9LsGig-uO0p3qrcmY6vrMge5K_KgXU4t8fN6uH8HhXr51uhUwBFAO8hxtA5VtEPKqADIQGYewGVLlIA1AGdEi0aTVUYnF5DF-wMNjDez:1nNA01:eIb64DhpIxjyy9yBZQGmcRpi9kLwQZBMTNOR1UzwECo	2022-03-10 14:31:21.748195+05:30
8uxikof1bqnr3icndqnj9hkzpm9zxa2y	.eJxVjEEOgjAQRe_StWk6ZVqoS_ecoZmZjoIaSCisjHdXEha6_e-9_zKZtnXIW9Ulj8WcDaA5_Y5M8tBpJ-VO0222Mk_rMrLdFXvQavu56PNyuH8HA9XhWyNybEIqErqWk_McEnderggEMVEUjKqhKHUiPqYGAZxHT-wAoSmteX8A-Gs3aQ:1nj32P:wyesKlL8LraaRFtueIxxEwB7zYo8nU72fMh_XYmEx4I	2022-05-09 23:32:17.39074+05:30
hppj715l9aypj7mxe14k9zhyrkw6gnwh	.eJxVjEEOwiAQRe_C2hAYBIpL9z0DmRlAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xSuIiwChx-l0J-ZHbjtId222WPLd1mUjuijxol-Oc8vN6uH8HFXv91l5ZpzM5bWwCNsmjAmc9lIFzMMCKEwcgsENAPhfioIqlonV2zMaReH8AH0Y4iw:1oP7Ai:2H9GZ6RevTnwxtvt9_k571Ytz5kxH4fK-UPfD5lnQSw	2022-09-03 00:26:44.44012+05:30
cfghcwb7oqe1mcisu50scozuk4797ih3	.eJxVjDEOwjAMRe-SGUU4TpSUkZ0zRLZjSAGlUtNOiLtDpQ6w_vfef5lM61Lz2nXOYzEnAzGaw-_KJA9tGyp3arfJytSWeWS7KXan3V6mos_z7v4dVOr1W2tCED16Tjw4dowUAyYkFGAeiJ0TSeIDUIlIAARegwO9uhKgoDfvDzv9OHE:1o1QQg:J7fLLMjMfTg99wfWp1csEtlaL5DJLcLZE4ZedgEB1Co	2022-06-29 16:09:18.402288+05:30
pjjgekwrz3kuk7qgncic9ao69pik0y1r	.eJxVjMsOgjAQRf-la9PQ1j5w6Z5vILczU0ENJBRWxn9XEha6veec-1I9tnXotypLP7K6KNtGdfpdM-gh0474juk2a5qndRmz3hV90Kq7meV5Pdy_gwF1-NZoqAGQPChLskaMNUSGvESUnAJHJCfsGL740CBkx60trhRrUc5Q7w9rKTnR:1oTNCt:41iGEV11C6NowmUWTJlHi15dteCAK9oy4nn9WBSbOTE	2022-09-14 18:22:35.574871+05:30
rds9ytdwogyxay43lns3x4kcspplvxbo	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1o6BTT:AKs8MdnBwJRwmb3T7PCp_JQDfpNTBtLhzBp3OM4J0XA	2022-07-12 19:11:51.735477+05:30
cu8atz0pzfc2cvjl14klxj63gg3nfnwz	.eJxVjEsOwjAMBe-SNYoSp8YNS_Y9Q-XEDi2gRupnhbg7VOoCtm9m3sv0vK1Dvy0696OYi_FtY06_a-L80GlHcufpVm2u0zqPye6KPehiuyr6vB7u38HAy_CtMXAqxcXGA4U2iXAD5BUB0CM4BQ4aE1IGIUZf1JNyEW3JxXJOzrw_KOY4Yg:1oCgQ4:1giapkIo1QNZEKjb52wLwB8_SJxlG5yRdRMZYE6KLxU	2022-07-30 17:27:12.277729+05:30
8j6a7titetwscucy69ozxlg7j2w89kkl	.eJxVjDsOwjAQBe_iGln-4Q8lfc5g7dpeHEC2FCcV4u4QKQW0b2bei0XY1hq3UZY4Z3ZhWil2-l0R0qO0HeU7tFvnqbd1mZHvCj_o4FPP5Xk93L-DCqN-6xKsIwPBF60KhqBlOpMT1pAka1GgkzkFImEsBekyZq9dIuFBgUXj2PsDM0U4hg:1oV9HY:TS2v_UhfiXokkSNthbEwS5Mjkk23KERSJiUOzI_69cI	2022-09-19 15:54:44.328243+05:30
b35b5qgnmwbszz9oykp35ehtcsgad6oh	.eJxVjEEOwiAQRe_C2hCYAm1duu8ZyMAMUjWQlHZlvLtt0oVu_3vvv4XHbc1-a7z4mcRV6N6Iy-8aMD65HIgeWO5VxlrWZQ7yUORJm5wq8et2un8HGVve6yEEtkaPZAGYI6PqSDnXpYCoTE8WTTewIXBBj8CQksK4U1AuRgdGfL5JdTjf:1oHmoZ:eHV03-H3cMFawQ6eoXwedYhBX0rMVKq-BGdoJ7lA9Js	2022-08-13 19:17:35.049664+05:30
5dki14lnmj4xd0xqag07w7nuzkn1n4hn	.eJxVjDsOwjAQBe_iGln-xgslfc5geb0bHEC2FCcV4u4QKQW0b2beS8S0rSVunZc4k7gIba04_a6Y8oPrjuie6q3J3Oq6zCh3RR60y7ERP6-H-3dQUi_fGlFNiqyF5HXWIZ3ZD8YBeOXJACIwDBzIOxecxaC0yc4Zzn7SmnIA8f4AG6Y3pw:1nNDLM:SQW4shXFnPHKNlijKQVRc1p2U15QrfTrvN9koGh58N8	2022-03-10 18:05:36.545864+05:30
o50g1bl6doihdtbyxfu32g8r45b485rw	.eJxVjEEOwiAQRe_C2hAYBIpL9z0DmRlAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xSuIiwChx-l0J-ZHbjtId222WPLd1mUjuijxol-Oc8vN6uH8HFXv91l5ZpzM5bWwCNsmjAmc9lIFzMMCKEwcgsENAPhfioIqlonV2zMaReH8AH0Y4iw:1oP7MO:4Vn5EdtvoJi1cl8WLlTcZB36-E3bzqBJ4Jf2IqZJy4I	2022-09-03 00:38:48.694155+05:30
hx13m6elnclq6j5nq3dcyhfsjvgnf01c	.eJxVjEEOwiAQRe_C2hCgDIJL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERJnhx-l0J0yO3HfEd222WaW7rMpHcFXnQLseZ8_N6uH8HFXv91kUDapcMK1VCAesdDFYrzIEoew3WYibPxp4dGcfWmwGQEDiVwAmNeH8ALF44lw:1oTQAq:vv1XVMVAGKz7E4EXJvBzpiIpyiswTvWQJ-gyuYOH2WA	2022-09-14 21:32:40.477311+05:30
cdwzkeyr39xaruefzgresrdr110n9awg	.eJxVjDsOwjAQBe_iGlm2N_4sJT1niOzdDQ4gR8qnQtwdIqWA9s3Me6k-b2vtt0XmfmR1VjYmdfpdS6aHtB3xPbfbpGlq6zwWvSv6oIu-TizPy-H-HdS81G9dCkOwDqAT5OADFuqG7IAQJZGP3hVrTKAhSSCTjI9IgMKd5YwGBvX-ACy-OBw:1o1TBm:CS23gf3mG9i5Zx_oTXnZb1Oqd5ZCQjfvstZyX96Jprk	2022-06-29 19:06:06.105815+05:30
fy33wyykkqp8wmat8zhpuw164kqqj2hp	.eJxVjDsOwyAQBe9CHSF-4pMyfc6AdhcITiKQjF1ZuXuE5CJp38y8g0XYtxr3kde4JHZlSht2-V0R6JXbROkJ7dE59batC_Kp8JMOfu8pv2-n-3dQYdRZK8pACsA5FM4LdM5jQnCgQhFKgvVKaCsxBeulJlNyMJCQSGojcmGfL0iMOOI:1oQYLD:3oZHrHiF8vM2nZ7B6tfki-Xnt-t3zO9FgNspc3ReJxU	2022-09-06 23:39:31.214437+05:30
i2a6m0oi707azjbaoh623x13fgl3eq3s	.eJxVjEEOwiAQRe_C2hBogQ4u3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWGqw4_a6E8cF1R-mO9dZkbHVdZpK7Ig_a5bUlfl4O9--gYC_f2loGBJqyy3rygMhKa2JrshpGNhxVAjLejW5UCpNPmRxkDZrNEAFQvD85wjh3:1oDR1e:8jin3qgFUtAfWJQms7luOnz7HawcWEtTafR5vynbD1w	2022-08-01 19:13:06.172044+05:30
w5zll75keoibkicjy0f98ktntxpspy20	.eJxVjEEOwiAQRe_C2hBlYCgu3XuGZmAGqRpISrsy3l2bdKHb_977LzXSupRx7TKPE6uzAgPq8LtGSg-pG-I71VvTqdVlnqLeFL3Trq-N5XnZ3b-DQr1865SDMR49is1MLlhD2YcUTBgIEjsB8IiUj5gFBS3HiBkHh8lj5BOo9wc2MDiU:1oV9fX:i9bHPDmF2aKLkk_Uh-6IeWx146H4CeSQBpgmFk0SfnI	2022-09-19 16:19:31.34719+05:30
p3d8yezy14hqcwsrz2cm9bl48iclqd78	.eJxVjDsOwyAQBe9CHSFg-aZM7zOghcXBSYQlY1dR7h4huUjaNzPvzSIee41HL1tciF2ZAskuv2vC_CxtIHpgu688r23flsSHwk_a-bRSed1O9--gYq-jDgSztsYYR8F6nbS1KFAVoxMIDVRQkUgeLEmQZQ7Oggflhc9eaBfY5wsU1Dcn:1oPGVN:rsJHyxFmIebgpuQx7eXBOYQVVwmwQg40irtRDlIUj9A	2022-09-03 10:24:41.243821+05:30
o8f76wj6o6c62c2zgq4ojnmwgv2q92kf	.eJxVjEsOwjAMBe-SNYqspHFjluw5Q-XYhhRQK_Wzqrg7VOoCtm9m3uY6XpfarbNNXa_u7AKRO_2uheVpw470wcN99DIOy9QXvyv-oLO_jmqvy-H-HVSe67fGtqUQE0EhEczEGiOCpJsZtpohW87RIDUJlFEUFKhpOEtAscLo3h8cpjgp:1oTQCY:cxikA56IgCJDDpxyAGReyprGyyHTFQL7Efq-JcH1c-Y	2022-09-14 21:34:26.222655+05:30
vc07d0y1p9mu7ubyp9irju3ik5viace8	.eJxVjMsOgjAQRf-la9P0MTAdl-79BjJlBosaSCisjP-uJCx0e88592U63tbSbVWXbhRzNh7JnH7XzP1Dpx3JnafbbPt5Wpcx212xB632Oos-L4f7d1C4lm_t-gQNkUbAgC6SIHFwDMCxzZjRsw8NBdcmkgbVQ1SHgiAwRNU0mPcH-XM3NA:1o1vgN:b2814QzkKniI47s0_KeQmOfXwZpQ8ZntB-juNFwZh2A	2022-07-01 01:31:35.122232+05:30
69htwpn4c7nhw8odouees2bmxctn3hva	.eJxVjDsOwjAQBe_iGlnxD9uU9DmDtevd4ACypTipEHeHSCmgfTPzXiLBtpa0dV7STOIitDPi9Lsi5AfXHdEd6q3J3Oq6zCh3RR60y7ERP6-H-3dQoJdvPbGH6NB7N7DNOHnj2dsBlAnEQWl0Z-CIxNaQgmy10xmCMtFqS8gg3h9AZjjF:1oQgYg:am0ymAH27HmLFOG82kFvWdui21vGWTgvUksbhkTkVIs	2022-09-07 08:25:58.234461+05:30
0mbg1x1tnb2pw3pcnlrp90l4a2homp0j	.eJxVjDsOwjAQBe_iGln-e01JzxmsXX9wADlSnFSIu0OkFNC-mXkvFnFbW9xGWeKU2ZlJcOz0uxKmR-k7ynfst5mnua_LRHxX-EEHv865PC-H-3fQcLRv7YUOROhlNUH7YgLKWgEdalVdBZkkaEUopLFWAZAlQCMsJJcgZG_Z-wMlBze9:1oDTO4:ehKN65676DiL9Zofny1kPJksOWq8Peh2bjk8gKZbAEA	2022-08-01 21:44:24.863191+05:30
95qudjsj20kobugc95cg371vzcysgcov	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1oITdG:0RKgle7C8thIGda1zZGCoE_3PMt7UMqx_-Az5DFgMw0	2022-08-15 17:00:46.744594+05:30
jwh5ke59gil3adhbkeqxf8el206xjgmm	.eJxVjDsOwjAQBe_iGln-xR9K-pzB2vUuOIAcKU4qxN0hUgpo38y8l8iwrTVvnZc8kTgLa5w4_a4I5cFtR3SHdptlmdu6TCh3RR60y3Emfl4O9--gQq_f2qTAzrBTCAOSJ6OZGZUKWCiQ02xCtGRj0Cpckwf07Aeno9JWacIk3h81vTf9:1oVDZi:KaTYg6L3FUsQaPz0MW8JY14QDZobAt4A2ZXomc4VEBY	2022-09-19 20:29:46.531133+05:30
87rhq375viswi2fhf5kb8tpowhbbf17k	.eJxVjMsOwiAQRf-FtSE8C7h07zeQGQakamhS2pXx35WkC93ec-55sQj7VuPe8xpnYmcmtWGn3xUhPXIbiO7QbgtPS9vWGflQ-EE7vy6Un5fD_QtU6HWEk5woYCFjvQ3f3-SkNQ6z0KgKaWU9ggKPKEWROlsUCoIuDjxZ6TV7fwA3GDhY:1nNDon:BNgBOakPhXODDb689td6rU_TaD9Bb-o_DtlnUX6frr0	2022-03-10 18:36:01.893313+05:30
8qsyuzk4du4sh5pkuib0tjwirdl75ajl	.eJxVjMEOgjAQRP-lZ9NsK7S7Hr37DWR3WwQ1JaFwMv67kHDQ48x7M2_T8boM3Vrz3I3JXIwL0Zx-W2F95rKj9OByn6xOZZlHsbtiD1rtbUr5dT3cv4OB67CtlXoPZ2BglJYAFAUIo3Akr7gF1OQEIDn0MQUlakOTnWso9g32wXy-HaI3iQ:1njDLK:JmbnMfG8YREpwqlybGMxwlzH7i3gAlWf2X5i8l9BL_g	2022-05-10 10:32:30.445068+05:30
fkh2n9o7le2wc9kdqgkcyf7iw0998m11	.eJxVjMsOwiAQRf-FtSED5enSvd9AgBmkaiAp7cr479qkC93ec859sRC3tYZt0BJmZGc2AbDT75piflDbEd5ju3Wee1uXOfFd4Qcd_NqRnpfD_TuocdRv7YQtNmczkfCTAu0loDApCg0IWeVkpDMCNRGVIksSkACArDfWkVHA3h8XdDfG:1oTQHG:7zrJ9pHZPVgy7EAGec_fyCIIfhy0giSanFuFBSbmTSU	2022-09-14 21:39:18.269696+05:30
ne9kts7lx7fku91wfsv03bpwvg8y69qg	.eJxVjDsOwjAQBe_iGlmO1x9CSc8Zol17FweQLeVTIe5OIqWA9s3Me6sB16UM68zTMGZ1Ud05qtPvSpieXHeUH1jvTadWl2kkvSv6oLO-tcyv6-H-HRScy1b30YRInmPHEAz11kj05EFQLDhvWJJshoBjJCcZJYMJNjgLQIFRfb4nyDhp:1oDUjn:xks8_Y79TgGLnRU2kDp0JFAWNdBPSCnvPrKhof4JT8s	2022-08-01 23:10:55.180559+05:30
mcp9fc8sygslmdn9jmg6wmgmf8r29kke	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oQhAh:S1lC-igCDrUWdSzpQcWqUyDX7x7uLUZDrWUWmM9X32Y	2022-09-07 09:05:15.546742+05:30
vl1r3n1nhqbewrdhqh6ibszye2f8vlso	.eJxVjEEOgjAQRe_StWloi6V16Z4zkJn5g6AGEgor492VhIVu_3vvv0xH2zp0W9GlG2EuxqVsTr8rkzx02hHuNN1mK_O0LiPbXbEHLbadoc_r4f4dDFSGb52h5xw5UO84OEEFAZhT7TwBmVxd-aZXTkgRPiRhoowgjfrQIIp5fwBorTm4:1oJ3Uc:QT4cPA3-9hzKKHXN9A5Z5ZV2uRLRvzBusLHddy-04YU	2022-08-17 07:18:14.276397+05:30
6cek0jerof4uybzgb1k0o0kt66fwkv8k	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oVDz9:jVyoqimNBRNcgYac9OJ_8CJvzZZSZFupAdd_EsE7ED8	2022-09-19 20:56:03.636125+05:30
cf7mmad3taficsiuvltdrp28zyk8pfln	.eJxVjDsOgzAQRO_iOrJs1h9ImZ4zWF7vEpNEtoShinL3gESRVCPNezNvEeK25rA1XsJM4io0OHH5bTGmJ5cD0SOWe5WplnWZUR6KPGmTYyV-3U737yDHlve10y6xRcu9SXska7wzyvagjVfeqjTFQZPqolXgUFFHw6QZwSMYBgLx-QIPrTea:1nNZV4:Kz4M6aE-rcwmXDhwKGDG0DBIfwgELQteODsPrwjyhWQ	2022-03-11 17:45:06.942539+05:30
rtv2ym3k3vgownmabvyhfh2xlvd46vzt	.eJxVjMEOgjAQRP-lZ9NsK7S7Hr37DWR3WwQ1JaFwMv67kHDQ48x7M2_T8boM3Vrz3I3JXIwL0Zx-W2F95rKj9OByn6xOZZlHsbtiD1rtbUr5dT3cv4OB67CtlXoPZ2BglJYAFAUIo3Akr7gF1OQEIDn0MQUlakOTnWso9g32wXy-HaI3iQ:1njDVt:MEDZEIfJE5W7naMUbJ9k-ZzOytrVxRAhlQ2aWIVV8uA	2022-05-10 10:43:25.28166+05:30
btc579tktx1wj62g7n16f7772kzkprd6	.eJxVjEEOgjAQRe_StWk6lGkZl-45A5lpR0ENTSisjHdXEha6_e-9_zIDb-s4bFWXYcrmbLwDc_pdhdND5x3lO8-3YlOZ12USuyv2oNX2Jevzcrh_ByPX8Vtr04UmKnpPEQAwZCeQJAYm6SJJSxhbQSUGTKThii1AotSIA3SK5v0BAtY3Tw:1oTQfX:RWWytmecyaS35PIwb9VIbY1gn3QABM9Tzt6L_RmqjF4	2022-09-14 22:04:23.227427+05:30
dmtyvprddcncjtm9nx20t0hnht6i48gr	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oEn3w:114qSDFekPSifW7ZV37XYOMLBl9_dGycaJCfsZuXrUQ	2022-08-05 12:57:04.961894+05:30
fyd4xf1o69em1ogcnnjf4tbjt54pe7h9	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oJATP:SsXJbeaPBDrklp1Ur2q1LCCZR0aVmB5GYk12pd2JzYs	2022-08-17 14:45:27.920791+05:30
ga85o6t93xfozr7p64rbvosllw7q05hs	.eJxVjMsOwiAQRf-FtSHDowVcuvcbyAwMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZnoUclTr8rYXpw21G-Y7vNMs1tXSaSuyIP2uV1zvy8HO7fQcVev7WFgEVrMARBo2F2lrQbvA0WLfmRSyH0RM5Dyo4NMZuSPQxsFIAy4v0BK1E4XA:1oQlcD:BYRxcdO5ruampikVdPIsZsqU6B5RZrKCFWvbznXUJn0	2022-09-07 13:49:57.141534+05:30
12rh4wuihyb9fmuhrbvsprxyp2g72h38	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nNbe9:mCWixfH7V4sz4wIphLbrJzVXgxHAA8G40qp0b_nm8jE	2022-03-11 20:02:37.371568+05:30
jcli75yxp9o24cuprb0tv18vutt62y3r	.eJxVjMsOwiAURP-FtSFAebp0328g9_KQqoGktCvjv0uTLnQ1yZkz8yYe9q34vafVL5FcCdeWXH4pQnimelTxAfXeaGh1Wxekh0LPttO5xfS6ne7fQYFexhq0QAfCqCjsxCeWFZODOMCYWOBobM6MK-WcANSGa4UCuY5CjpQWyOcLHdo3yg:1nk7aH:e6DBkBFlJ-eKLV2ZH07xu2__q0BGNX2JwBahVw714GU	2022-05-12 22:35:41.801445+05:30
oqffurs2w177eab0iw0hdvh5ldxne9ro	.eJxVjEEOwiAQRe_C2hAQBopL956BMDMgVUOT0q6Md7dNutDtf-_9t4hpXWpce57jyOIizsaI0--KiZ657Ygfqd0nSVNb5hHlrsiDdnmbOL-uh_t3UFOvWw3aBnbKDoWQMrjkAlIxjjFnw56C0l4pD8UGCmFjBIkADOjBOGQWny89aDit:1oPK1g:8_nYLRPeKof7p3yQQD90ODOJ-q2ZLuaW3EogqBCF2K8	2022-09-03 14:10:16.685461+05:30
05bm3t0e92vnwil3v5hinvye5yzoowmp	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oEn4A:Mx-4rZXKFgRh1hrJakitqIXDNtbBcKn24UB4J9M5DF4	2022-08-05 12:57:18.228032+05:30
d2pp5ioexvbq8zdn64qbfqf9sbutt97e	.eJxVjEEOwiAQRe_C2hCGQgou3XsGMsCMVA0kpV013t026UK3_733NxFwXUpYO81hyuIqwCtx-V0jphfVA-Un1keTqdVlnqI8FHnSLu8t0_t2un8HBXvZa4oUmcjxaImUB8aMxsZsrBpIYWJnBz0a74A0MA82M7A2tHsAqEF8vnHOOYA:1oJZpY:EZXnE4CxC2k9VEa5yzBQqjC-hjgDyYsTfYfvox5HI20	2022-08-18 17:50:00.006275+05:30
o2uqgnulw8eqvx8sb0xn4z4mx5s9jmv7	.eJxVjEEOwiAQRe_C2hAYYECX7nsGMjBUqoYmpV0Z765NutDtf-_9l4i0rTVuvSxxYnERgCBOv2ui_ChtR3yndptlntu6TEnuijxol8PM5Xk93L-DSr1-awWsM5sRNVoNlk1BYuMTp-BDGZVWZIg0-nNSZANY5xxa8DkzFUxZvD8oADhQ:1oQmCB:lPUH58ReynBLtFrX4n_nZPjhOXGBJyryl89ZA7xODqc	2022-09-07 14:27:07.529177+05:30
p4w2e23x9yg7g10j00myfb6qihrmhv50	.eJxVjEEOgjAQRe_StWk6ZVqoS_ecoZmZjoIaSCisjHdXEha6_e-9_zKZtnXIW9Ulj8WcDaA5_Y5M8tBpJ-VO0222Mk_rMrLdFXvQavu56PNyuH8HA9XhWyNybEIqErqWk_McEnderggEMVEUjKqhKHUiPqYGAZxHT-wAoSmteX8A-Gs3aQ:1nNbtI:4BV3yQh4uz_0c5b2gQOlzMc8t4NJtlNkV6z3jZPPTko	2022-03-11 20:18:16.402124+05:30
qjl4niohho0cq1o01obnh98493ha7e7x	.eJxVjksOgzAMRO-SdRVhcJzQZfecATl20tBWIPFZVb17QWLRbue9Gc3b9Lytpd-WNPeDmqsBas3lN40szzQeSB883icr07jOQ7SHYk-62G7S9Lqd7t9A4aXs7ah1hAQBEdo2Bi-qFAScZGRX-yzkIzeiQblCTFSn0KBjJoKK8v7q8wVDFDh3:1nk7cF:aHEuIkzII5-mllPiU1amRzxrC9p7Aj_HkWMvCmqGWXg	2022-05-12 22:37:43.715065+05:30
13fdtxk3pwiac8w9mg6tzl92smwb19jx	.eJxVjDsOwyAQBe9CHSF-4pMyfc6AdhcITiKQjF1ZuXuE5CJp38y8g0XYtxr3kde4JHZlSht2-V0R6JXbROkJ7dE59batC_Kp8JMOfu8pv2-n-3dQYdRZK8pACsA5FM4LdM5jQnCgQhFKgvVKaCsxBeulJlNyMJCQSGojcmGfL0iMOOI:1oPMhk:jQzB3Sy1CqXoyGM1NXNl2yGyVqAo7HmNP2grws3uv3I	2022-09-03 17:01:52.341179+05:30
40rgksvfxnejhy5tvwsj8ua18uavw80x	.eJxVjMEOwiAQBf-FsyHAQgGP3v0GssAiVQNJaU_Gf9cmPej1zcx7sYDbWsM2aAlzZmcmvWSn3zVielDbUb5ju3WeeluXOfJd4Qcd_NozPS-H-3dQcdRvXQQ6QxqskL6AAUElJg0F0SDkDBS9cSUrpDQ5MUmlQYOytihHKJ1l7w85cjg5:1oKHLc:BOKYfufnpKj6rPO70UY1SHLDfDAg9JwDiDMLZMjAb7c	2022-08-20 16:18:00.625227+05:30
lcz7254ti875japze1889xd68irq13bb	.eJxVjEEOwiAUBe_C2hDgUwSX7nsGwueBrZo2Ke3KeHdt0oVu38y8l4hpW4e4tbLEEeIijCNx-l055UeZdoR7mm6zzPO0LiPLXZEHbbKfUZ7Xw_07GFIbvjV52KR05QCHjuhcfbCWSftqDWfFYIQuI4BglHYEnxV0Mc7XkuHE-wM2ejjN:1oQoUW:bXeOomKCho294bc-HvWbdz5RIzDHY07xLuBQlgoPC9w	2022-09-07 16:54:12.578447+05:30
d6dzagjbpgckn6fr4cva0g73djarie6a	.eJxVjDsOwyAQBe9CHSF-K7Qp0-cMaIElOIlAMnZl5e4RkoukfTPzDhFo32rYB69hyeIqvBKX3zFSenGbJD-pPbpMvW3rEuVU5EmHvPfM79vp_h1UGnXWBYFAayJM4NkZVtagLcqjV7okR9kpBFuMNQkQomMu2RMZZJ-sEZ8vAuk4CA:1nNeVf:ZCzJ0QJ5JAOtDaFhiCAVt--_LkHy3_HBHqzU-QRN5MU	2022-03-11 23:06:03.290191+05:30
4l4mzjtt4d4c5ep3c9anc1f4njr7vrdv	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1nnD3U:lyZkuPKp1ZadVuBwx0164hpMUI9Il0_4dvbZSVzNWtk	2022-05-21 11:02:36.569233+05:30
rmp1f8o45132g85kw1p39mjwnh0tm6zb	.eJxVjEEOwiAQAP_C2RBY3AIevfsGsrAoVQNJaU_GvytJD3qdmcxLBNrWEraelzCzOAkwKA6_NFJ65DoU36nemkytrssc5Ujkbru8NM7P897-DQr1MsaTI6fRg9PJHzVppIgGLejJRMhowGgbI129ApMV4rcj9mxRMQGyeH8A9QQ3NA:1oPMyj:Z5OQeH_RtnvWbU_s2wKOMy-Mo5z19rcuFnCwbGJyejw	2022-09-03 17:19:25.269965+05:30
bofvrego32j3iy0iym4yb3rdr58o6fzm	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oKHcz:lFf_I-WEmLhkHIoU2xCYbIkMdjchNe7E0f0k1Wa_9Uw	2022-08-20 16:35:57.717652+05:30
p5wl45mfme7wdya168e8d53c3nkm9m1l	.eJxVjEEOwiAUBe_C2hDgUwSX7nsGwueBrZo2Ke3KeHdt0oVu38y8l4hpW4e4tbLEEeIijCNx-l055UeZdoR7mm6zzPO0LiPLXZEHbbKfUZ7Xw_07GFIbvjV52KR05QCHjuhcfbCWSftqDWfFYIQuI4BglHYEnxV0Mc7XkuHE-wM2ejjN:1oQoWu:IsJ-bjL4LUnbljNRiKqrEhMRtzJliHtIrYr9X8bLDyo	2022-09-07 16:56:40.470757+05:30
8z0n39gljtmo8vqswriuwdq0i62diwrw	.eJxVjMsOwiAQRf-FtSHMUB516d5vIAwMUjUlKe3K-O_apAvd3nPOfYkQt7WGrfMSpizOArQTp9-VYnrwvKN8j_OtydTmdZlI7oo8aJfXlvl5Ody_gxp7_dasYYDifTFekQVKjmhUYNEQaT06gwoAiuFo0aFGZZFRESbF2Y8DivcHCTA2_w:1nNqmj:SQZk8wDklkMfavN9gM1d_L4EenG23caERqv9WTZLmk4	2022-03-12 12:12:29.418218+05:30
2o0tsjg9e6t4n8pgn9glh9ir0tg04djy	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1nppqW:dcUQbzhBpmypNmXwyysibIKsiDCX8_naRrWmm8lQBrQ	2022-05-28 16:52:04.226733+05:30
yahz0cnnt9g4yvf6huhv57fj5fm3bkth	.eJxVjEsOAiEQBe_C2hCggYBL956BdEO3jJqZZD4r4911klno9lXVe6mC29rLtvBchqbOykFUp9-VsD543FG743ibdJ3GdR5I74o-6KKvU-Pn5XD_Djou_Vsnghy8dzZbxzGLa9nUBE5EqskEgZhRABKLbyGTBWEmRuRowbig3h8tQzjR:1oPOqq:iZfF5Mij8TlELIT0x4K7CDAaTM3IvtyXKFJghnKvs2o	2022-09-03 19:19:24.760555+05:30
ex8tkoz3vjxb4r7pql8jxgh3qvje6pf3	.eJxVjEEOwiAQRe_C2hCgFAeX7nsGAsOMVA0kpV0Z765NutDtf-_9lwhxW0vYOi1hzuIitDfi9LumiA-qO8r3WG9NYqvrMie5K_KgXU4t0_N6uH8HJfbyrTEBjZz9yECJHVkywApU1G6w2hJx8miAWBurz8YS6qwQ8sAOBwss3h9YsTkN:1oKJFw:Eq8ite16hoHvLt0kNGs3N_bC2hwr8oCCfNgcHMI8Vqw	2022-08-20 18:20:16.163524+05:30
h9gi61t2dasj16fc5b4e5h0vkncdxn1b	.eJxVjDsOAiEUAO9CbQjw4CGW9p6B8HnIqoFk2a2MdzckW2g7M5k382Hfqt8HrX7J7MIUanb6pTGkJ7Wp8iO0e-ept21dIp8JP-zgt57pdT3av0ENo85xVJKURpBCgEEXZBYQ0CkQpCMaq9AWCeUsTLJk0GJxziIAOSTAxD5f6ms2mQ:1oQqpu:SdQuNtQ0YLJwLahpUUucNCz5ShCR_9lTcRMZRsGoNTc	2022-09-07 19:24:26.852254+05:30
8fvmib630zmnk01kvn7xlj7djiyl2qhj	.eJxVjEEOwiAQRe_C2pDCgAwu3fcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnERClCcftdI6ZHbjvhO7TbLNLd1maLcFXnQLseZ8_N6uH8HlXr91olS9tEQeOWgAOkyRFbFJdaQFKJ1xnmPoAqwRSQXEc5kjdWoBjAs3h865je4:1nNr0i:m7GVKcpnblet5pME49rrRWehanz25vPzpNJF1X6d3kU	2022-03-12 12:26:56.829505+05:30
5eim336gzpuz6xelz5vr9lf08lf51o52	.eJxVzMEOwiAQBNB_4WwIdFkpHr37DWRZqFQNJKU9Gf9dmvSg13kz8xaetjX7raXFz1FchLZKnH7TQPxMZaf4oHKvkmtZlznIvSIPbfJWY3pdj-7fQaaW-xrAIBDjgEqPEFhbwElTGFMKpBU4QsWDsWfLLhlii46mbqhiR0Xi8wUXGTgd:1nqJdp:R-SwGH_GpUvzpKL5YXOdKLXLwubiuvEWuRsqgfwMaLM	2022-05-30 00:40:57.512042+05:30
ix1ebq5dk38d0m0vywhnwhxn5tng0u4u	.eJxVjEEOwiAQRe_C2hCm0AFduu8ZyDCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-juIitEJx-l0D8SPVHcU71VuT3Oq6zEHuijxol1OL6Xk93L-DQr18azYZEQMwn3Nml1QmMnFMiC5bDc4FpcA4CwhWxaD1gISOeBghIbAW7w8-lTgH:1oTlIJ:ViECjWThTnwsDhU95bMDswLJhWPND_UgrXWZqT2QaUM	2022-09-15 20:05:47.253258+05:30
1e3tuob5708012yceq4vi6u0rlnwtu9y	.eJxVjDsOwjAQBe_iGll2nPWHkp4zWLveNQmgRIqTCnF3iJQC2jcz76UybuuQtyZLHlmdVedBnX5XwvKQaUd8x-k26zJP6zKS3hV90KavM8vzcrh_BwO24VsbBEvA0bmavMFqCwqICQLMQD5GG4xNnkiC6_pOkqm1UI_CIVUXe_X-ADi1OKQ:1oQs2C:lrVLu_DKaNVk6Ao_OJHuGRyXud4gWqm_unCjvsiCEhI	2022-09-07 20:41:12.869747+05:30
8xlvlc571slb511ym7abgekjit9z282v	.eJxVjDsOwjAQBe_iGlk2_lPS5wzWeneNAyiW8qkQd4dIKaB9M_NeIsO2trwtPOeRxEVok8Tpdy2AD552RHeYbl1in9Z5LHJX5EEXOXTi5_Vw_w4aLO1bJ1ZBu-iBQ4rOKSSFoD2WUi0bEz1HNh4NcHVnC2SsTqQCgYu1YKri_QEzXDjb:1nNrBz:M3POK7Mo2eWgmOilhK4Jg8LuRmebjMvUX4m_UPAgsUY	2022-03-12 12:38:35.528406+05:30
6fq35j1notsg0ymk4ijks2fr4539biav	.eJxVjLsKwzAMAP_FczGWI0WmY_d-g5H8aNKWBPKYQv-9GDK0691xh4myb0Pc17LEMZurAWRz-aUq6VWmpvJTpsds0zxty6i2Jfa0q73PubxvZ_s3GGQd2thDZQ1OEEiLh8wVpCqT77teMGTsJRGg61zwopQIA4FzhZWRIZnPFxhBN1w:1nrgNh:kKw35hXm7Q5cJrmaqB9M_3DE0H8YZZJi2ZfKedCDUEg	2022-06-02 19:09:57.256039+05:30
ojo0c3q1gn0efjvdf8iu6rdrejt0b2qe	.eJxVjEEOwiAQRe_C2pApDAgu3fcMzZSZStVAUtqV8e7apAvd_vfef6mBtjUPW5NlmFldlLFBnX7XkdJDyo74TuVWdaplXeZR74o-aNN9ZXleD_fvIFPL3zoG6HxEJkwokycHwDidffTOGgATgClI1xnHfhrRJiuYjIdELqBEq94fDq03dw:1oPRCW:eDPoFayJF9zy3VR5q09m51vuwPwfBwyzJvhmgsKhdM8	2022-09-03 21:49:56.495189+05:30
eyt3b9f92o082pnbksxwpoh1nceyxvpz	.eJxVjDsOwjAQRO_iGlmOs_5R0nMGa71ecADZUpxUiLuTSClgynlv5i0irkuJa-c5TlmcxRBAnH7bhPTkuqP8wHpvklpd5inJXZEH7fLaMr8uh_t3ULCXbc2kkb3T6JTPyqM2VgcMYMxwc-BGYLJgFBrYYkdSQClbgoDaK4NZfL4V1Td5:1oKsnD:pE7LlvvcgLXXd9YR1-LSZokI5FbOmKLOhKoejd0ywHo	2022-08-22 08:16:59.856955+05:30
lz79kl1f54ng8a8yra8pib1w2ztxv5qd	.eJxVjE0OwiAYBe_C2hAEKeDSvWcg3x9SNTQp7cp4d23ShW7fzLyXyrAuNa9d5jyyOitngjr8rgj0kLYhvkO7TZqmtswj6k3RO-36OrE8L7v7d1Ch129NEYsgBlcSsveEQxKxgxEbj8ZyAB9BuNhERE7gJMVEogCGgW1AUe8PcWc6Rw:1oToZo:NiTRQiQj3ss5yVw-p_HWj-ElJ_ibQaTfwYU0ORFN7Ns	2022-09-15 23:36:04.469431+05:30
lbuzkarq9xz0g7f62l3hgzsvzyel4tb2	.eJxVjM0OwiAQhN-FsyGF5af16N1nIAu7SNWUpLQn47srSQ96m8z3zbxEwH0rYW-8hpnEWWjw4vTbRkwPXjqiOy63KlNdtnWOsivyoE1eK_Hzcrh_BwVb-a7B0sQIJnrULg9IDntwBBCdAoBp0FmhSmy1N8aPrFJWbkTrLRFP4v0BMSE4Ng:1oQs7n:Ex30E74Oy0WWRTNd_AmdeR5LasLBSDFLSvFLESoK8xw	2022-09-07 20:46:59.949047+05:30
47bpwmwdg9bv16q2g3j01iwivwex6jih	.eJxVjDsOwjAQBe_iGln-e01JzxmsXX9wADlSnFSIu0OkFNC-mXkvFnFbW9xGWeKU2ZlJcOz0uxKmR-k7ynfst5mnua_LRHxX-EEHv865PC-H-3fQcLRv7YUOROhlNUH7YgLKWgEdalVdBZkkaEUopLFWAZAlQCMsJJcgZG_Z-wMlBze9:1oKzgA:ad6prro8ncbrz8ca6QOP5Ji9uFd62HPmkM4oe86GVn0	2022-08-22 15:38:10.538875+05:30
02nn9oiefexr6z3a2e6x1jnkxlx7f7os	.eJxVjMsOgjAUBf-la9MU-kpduvcbmvuqRQ0kFFbEfxcSFro9M3M2lWFdal6bzHlgdVW9TeryuyLQS8YD8RPGx6RpGpd5QH0o-qRN3yeW9-10_w4qtLrXKaFEByAenHcGbQniiDgyEvXYGSOBCbgr6CUKhwQGfSmuF7sTqz5fbKY6EQ:1oPRKH:DO034V7uG_cixi4FtY793t0xXuydJhun1bVWlHR9lY0	2022-09-03 21:57:57.552081+05:30
qpc1u845w9d02b8b1w7r8gn70k4xp6my	.eJxVjDsOwyAQBe9CHSF-4pMyfc6AdhcITiKQjF1ZuXuE5CJp38y8g0XYtxr3kde4JHZlSht2-V0R6JXbROkJ7dE59batC_Kp8JMOfu8pv2-n-3dQYdRZK8pACsA5FM4LdM5jQnCgQhFKgvVKaCsxBeulJlNyMJCQSGojcmGfL0iMOOI:1oTojp:xPIn1DLER_Zqc7kNCX3QOqh_AImwh3oxDOPJvTZ8ADs	2022-09-15 23:46:25.652583+05:30
9iw4k7zox6sxiuzorqb3j1dwn9lsz1jn	.eJxVjEEOwiAQRe_C2hBaYAZcuvcMBGZQqgaS0q6Md7dNutDtf-_9twhxXUpYe57DxOIsRgBx-l1TpGeuO-JHrPcmqdVlnpLcFXnQLq-N8-tyuH8HJfay1ZkdJa8tu1sCQs5kCZNRCj0p7a3GUUUkMzAAOm_t4MFntWlswFkUny8-oDfV:1oR90B:mqiL3aLbqReDKmOoB5ROHnuh4lb4AfpdsxN-T24Aghs	2022-09-08 14:48:15.898198+05:30
7jgpbojpyc9dz7mu6kcpfjch3g3jrg5h	.eJxVjDEOwjAMRe-SGUVOiOOUkb1nqOzaogXUSk07Ie4OlTrA-t97_-U63tah26ot3aju4kICd_pdhfuHTTvSO0-32ffztC6j-F3xB62-ndWe18P9Oxi4Dt-aNZYIKnAuZIGaRqlAQYxESTmb5JjMEgtIaTigBDSGgJQYMwO69wcV1zec:1nNrI2:8144Xoxv1pLZSB00YXNv9afiheuLmAPXGdPS2hQUXWo	2022-03-12 12:44:50.201955+05:30
23o8wfhn8s9m1gusx7wu0cb8xyvh2shv	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1oTowI:3BxzAnE1vG0UJsU0yw_GLOeD7m8bpOJ4IZu-NNEHwwc	2022-09-15 23:59:18.813876+05:30
ej8lnlph21h6bfnflk34on35m9k7q056	.eJxVjEEOwiAQRe_C2hAGWpi6dO8ZyDADUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnBWjU6XdNxI887UjuNN1mzfO0LmPSu6IP2vR1lvy8HO7fQaVWv3XHwp5cKEZCkNIDgnd9SYyJIXgWcLYDGZCBaEBr0VNxYtmIR5ONen8API04Yw:1oL6mX:ovHqWknodYTJKfJF6CR2my7qCsModdBj5dGYnGcIXqs	2022-08-22 23:13:13.077894+05:30
h8a594mdtt5e92yc99ohue3kqnwk3vul	.eJxVjEEOwiAQRe_C2hCEdgCX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIiNFhx-l0J-ZHqjuId661JbnVdZpK7Ig_a5dRiel4P9--gYC_fOg_ZGwvmzGRcdN7pDDYnF9EDQzLITKyIUI_g8wAKWLGPFkbPxjgr3h9ENjiV:1oR9Cz:3QKZbik7ESt3-l2__EX-lxJCmtkuqM0u265AlKtvtd8	2022-09-08 15:01:29.062256+05:30
h6gnga9nvqxq1ofy006gw1enputxzhfk	.eJxVjDsOgzAQRO_iOrJs1h9ImZ4zWF7vEpNEtoShinL3gESRVCPNezNvEeK25rA1XsJM4io0OHH5bTGmJ5cD0SOWe5WplnWZUR6KPGmTYyV-3U737yDHlve10y6xRcu9SXska7wzyvagjVfeqjTFQZPqolXgUFFHw6QZwSMYBgLx-QIPrTea:1nNxFf:G15lvIWRQfowmhOGCpNxlhUV4fqfsSADc112p8E6zzw	2022-03-12 19:06:47.686571+05:30
vfhrk6wbr9cw3slimh1ds9ln22m14xjf	.eJxVjTsOgzAQRO_iOrK84A9OmZ4zWLZ3NyaJjIShinL3gESRtPPezLxFiNtawtZoCROKqwBvxOU3TTE_qR4IH7HeZ5nnui5TkociT9rkOCO9bqf7N1BiK3ubHffI3iZipy1G1pwBkhpgv8SeFFiDhgmtSUq77JmU9h0NDB3F7MTnC1XNORA:1oLLfx:uKuaaYbMd2SVliCTi7FWYD8XUuBgcsniprSVYd0Q5NI	2022-08-23 15:07:25.693433+05:30
6wdn5os0774qf05bdr6g8c1yx88tcbb3	.eJxVjMsOwiAQRf-FtSEjj1Jcuu83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxIXoZwSp9-VMD647ijdsd6ajK2uy0xyV-RBu5xa4uf1cP8OCvbyrW1yjApHbT2BdkjauwFyduhTBqUMs7ejBzRswNCAGjNFo8FngjNo8f4AMK04Lw:1oU3yf:2bmtD2df7kGUiIGCGqjW4pqvM8ifOrLKJ-97-qr0x5A	2022-09-16 16:02:45.377498+05:30
4cj0mpjqmrschydszoerj34updw5ag41	.eJxVjMsOwiAURP-FtSGAPF267zeQC_cqVQNJaVfGf5cmXWgyqzln5s0ibGuJW6clzsguTFnPTr9tgvykuiN8QL03nltdlznxXeEH7XxqSK_r4f4dFOhlrMHJbBIFIVA5TSCDRPQ3BSaIgAq1kRky-hF9HiwhheCsB0HegtHs8wVB_Tiq:1oR9HM:WxeNQEyT5k_VUyPYXFEZz83Bt-ORqdTTSi4XaCpnKGg	2022-09-08 15:06:00.434422+05:30
uqzechhjuq93tsbtcr9rkak0h9bsna50	.eJxVjDsOgzAQRO_iOrJs1h9ImZ4zWF7vEpNEtoShinL3gESRVCPNezNvEeK25rA1XsJM4io0OHH5bTGmJ5cD0SOWe5WplnWZUR6KPGmTYyV-3U737yDHlve10y6xRcu9SXska7wzyvagjVfeqjTFQZPqolXgUFFHw6QZwSMYBgLx-QIPrTea:1nONAb:91Mz3hqBRP6Q9wU5ckYjAPwDMIlUUxeHAKc2m60Woeg	2022-03-13 22:47:17.438593+05:30
19y3psu99gaq7m8y935y9e9jo0sy5k37	.eJxVjMsOwiAQRf-FtSEFhpdL934DGWCQqoGktCvjv2uTLnR7zzn3xQJuaw3boCXMmZ2Z8IadfteI6UFtR_mO7dZ56m1d5sh3hR908GvP9Lwc7t9BxVG_NYJyE4iYnZ4KEliRsldJFa-FLJK8teBEogRaymjQQXFYgGLWZKSz7P0BK0c4Tw:1oLLp2:NDi4vpThpzBs9mFINrWQVlQmWjfwnY1q6gkBYim_ySc	2022-08-23 15:16:48.745511+05:30
a51twqxx9zfoyijt464ytkybcxx7vm5k	.eJxVzMEOwiAQBNB_4WwIdFkpHr37DWRZqFQNJKU9Gf9dmvSg13kz8xaetjX7raXFz1FchLZKnH7TQPxMZaf4oHKvkmtZlznIvSIPbfJWY3pdj-7fQaaW-xrAIBDjgEqPEFhbwElTGFMKpBU4QsWDsWfLLhlii46mbqhiR0Xi8wUXGTgd:1oPfyG:M21ZpyTmzFPubU3P9QiKxhDpT_Kutst03ePToKmfV9E	2022-09-04 13:36:12.79969+05:30
rlajdhneo97pelrhnccp4zsrp27yoqd1	.eJxVjMsOwiAQRf-FtSEDM5Ti0r3fQAYGbNXQpI-V8d-1SRe6veec-1KRt3WI21LmOIo6K4RenX7XxPlR2o7kzu026Ty1dR6T3hV90EVfJynPy-H-HQy8DN8aTCWTXBLCLgt4wr4GZ4jFUmXw2XKfJQAGIxCoIlXfQcaSrDOArN4fIDs3wQ:1oU4iW:NDMXSgib-SlPHCAU8FTgcWPToxuFXMiHJPbu7-jwAtA	2022-09-16 16:50:08.034249+05:30
lburf28jg9fvehxbcxcdkckzdfr1n3ha	.eJxVjDsOwyAQBe9CHSF-4pMyfc6AdhcITiKQjF1ZuXuE5CJp38y8g0XYtxr3kde4JHZlSht2-V0R6JXbROkJ7dE59batC_Kp8JMOfu8pv2-n-3dQYdRZK8pACsA5FM4LdM5jQnCgQhFKgvVKaCsxBeulJlNyMJCQSGojcmGfL0iMOOI:1oR9TE:Ke5RniVIRD0AhX4Smt7CfH3M_W4QxWX0ZLZGLkN7Vpw	2022-09-08 15:18:16.062745+05:30
28d95cxebhwm9k5oa52giqy4utssmmlh	.eJxVjEEOgjAQRe_StWkoLe3UpXvO0Mx0poIaSCisjHcXEha6_e-9_1YJt3VIW5UljayuyjijLr8rYX7KdCB-4HSfdZ6ndRlJH4o-adX9zPK6ne7fwYB12OtIhp1pAweAbIt1FC013gCUXBrxnReP0kIrOw3UkY0BIjNEZ5FMUJ8vJLM4Jw:1nONdV:CUcCjodj9a48vofX-CVMZJw5A3mFg6qs_fKGTDgtvPw	2022-03-13 23:17:09.761022+05:30
wqo19ubtcsw718g0cj72s1fn7dg15wij	.eJxVjMsOwiAURP-FtSFSQC4u3fsN5D5QqgaS0q6M_26bdKHLmXNm3irhMpe09DylUdRZmRjU4bcl5GeuG5IH1nvT3Oo8jaQ3Re-062uT_Lrs7t9BwV7WNRoH6Imt9S5kzl4cENCaTjG4gT1IHjhI9JYZbmA8gQgKOiOIR1CfLziJONk:1oLM6O:o889_VnAjnmI67CxvY4RXPyrdVl7_LqAhhcPJ6DWfDY	2022-08-23 15:34:44.878017+05:30
teira3x0x960tkmnfdyqggodiq3twgvm	.eJxVjMsOgjAQRf-la9PAODDFpXu-gcyjtaiBhMLK-O9KwkK395xzX27gbc3DVuIyjOYuDrByp99VWB9x2pHdebrNXudpXUbxu-IPWnw_W3xeD_fvIHPJ37pTANSEQSgyIatgAqsxMYGaoEpHUrUQ6VwLUGshxbppAgmwVcru_QFMyTkb:1oPg1O:Jx5urjdRPrpc-WMs0ehuqSWUyLvXzlX3pUy-KhSxqNo	2022-09-04 13:39:26.654588+05:30
btto4b8bztpmb3v61pg2jv3m1pul6m1c	.eJxVjDsOwjAQBe_iGln-4Q8lfc5g7Xo3OIAcKU4qxN0hUgpo38y8l8iwrTVvnZc8kbgIq5I4_a4I5cFtR3SHdptlmdu6TCh3RR60y2Emfl4P9--gQq_fOkJymJIGdqCNArQ62FjIKevGM8XiAjkTo-dgSiBvRqWNZ4yEhgIX8f4AIfo4Pg:1oU8Md:jZWbmCjSRGd2VL2C4IqQZjQwK1tdKVvtnpEhrMugbrE	2022-09-16 20:43:47.075862+05:30
r54wtug930eh8jo233m4rvvwqewgzt2e	.eJxVjMsOwiAURP-FtSGAPF267zeQC_cqVQNJaVfGf5cmXWgyqzln5s0ibGuJW6clzsguTFnPTr9tgvykuiN8QL03nltdlznxXeEH7XxqSK_r4f4dFOhlrMHJbBIFIVA5TSCDRPQ3BSaIgAq1kRky-hF9HiwhheCsB0HegtHs8wVB_Tiq:1oRA9a:cOz6LUzGGoWGPeFb6dhf9uTw0FJgf9iFDcmRSZSHb3g	2022-09-08 16:02:02.211572+05:30
wul986gz0zqpt5y3nwxhvqgud495jjo4	.eJxVjEEOwiAQRe_C2hBgkIJL956BzDBUqgaS0q6Md7dNutDtf-_9t4i4LiWuPc9xYnER2hpx-l0J0zPXHfED673J1OoyTyR3RR60y1vj_Loe7t9BwV622iggfQatnWUDZEHRGLIBxQR-VBuwIeHgwYdkBzAKKbig0bPTHtGIzxf1kjb7:1nONoH:VVvTDnp3IGOeMkStbO561YdWRcyEFZRElwSq2DIADl8	2022-03-13 23:28:17.577329+05:30
2v93h301z08c2za9iazof3ye6pdsmxfs	.eJxVjMsOwiAQRf-FtSEw5enSvd9ABhikaiAp7cr479qkC93ec859sYDbWsM2aAlzZmcGAOz0u0ZMD2o7yndst85Tb-syR74r_KCDX3um5-Vw_w4qjvqto0fh_CSdAKuILBijIWpFcioTeq-NyBKEAYKiUankikomoivFWI_I3h8AGzew:1oPhEP:YcdX1if3m5aqC0B8nDoEL8wxM6lA0d4kzJfGEthkMMQ	2022-09-04 14:56:57.682921+05:30
nuzizyrph52cb0r8jrzbbojw7wvv6qwh	.eJxVjE0OwiAYBe_C2hAEKeDSvWcg3x9SNTQp7cp4d23ShW7fzLyXyrAuNa9d5jyyOitngjr8rgj0kLYhvkO7TZqmtswj6k3RO-36OrE8L7v7d1Ch129NEYsgBlcSsveEQxKxgxEbj8ZyAB9BuNhERE7gJMVEogCGgW1AUe8PcWc6Rw:1oUB2K:Al0pnUosxv00TBGsiU4UTAc5pWrbFq2mQmLbv_uYTTI	2022-09-16 23:35:00.670316+05:30
7sdtjsy66o3eym8d8y55py1ewx3urunj	.eJxVjMsOwiAURP-FtSGAPF267zeQC_cqVQNJaVfGf5cmXWgyqzln5s0ibGuJW6clzsguTFnPTr9tgvykuiN8QL03nltdlznxXeEH7XxqSK_r4f4dFOhlrMHJbBIFIVA5TSCDRPQ3BSaIgAq1kRky-hF9HiwhheCsB0HegtHs8wVB_Tiq:1oRDH1:Vj7bIOyiZmZZiLdF-ftXlS_xBQKF-QvPz2901ytxYVE	2022-09-08 19:21:55.745147+05:30
vwsjbd4cdp2u1w038lvzoijjueu2q8pe	.eJxVjEEOgjAQRe_StWk6pYWpS_eegUxnBosaSCisjHdXEha6_e-9_zI9bWvpt6pLP4o5GwiNOf2umfih047kTtNttjxP6zJmuyv2oNVeZ9Hn5XD_DgrV8q01cdaBQkiiKTrsOKAg-lYhYiMAApQgudZTywkiYWA3dC5mieqBzfsDMyA4Ew:1nOr9g:OyXelvaIeKne6dP2oK7woEyAXF8uwDcAyq8Chn36YJc	2022-03-15 06:48:20.752833+05:30
m462ws4tkdhpnsopu071fhmxvjr08ne1	.eJxVjDsOAjEMBe-SGkUbyM-U9Jwhsh2HLKBE2k-FuDustAW0b2beSyVcl5rWWaY0ZnVWBkAdfldCfkjbUL5ju3XNvS3TSHpT9E5nfe1Znpfd_TuoONdvzSWzs3YYyJgwEB7ZMsfC7IoL4KKgMJwocqEYBAEoCJAPZMAF5716fwBddTkf:1oLMUX:m9mRIaB7-3duQKw8vSpjsn4JO6mNlXgD88DDBK0nex0	2022-08-23 15:59:41.567348+05:30
2z992uo3al7pac1tr5gmnhki52kmr7bw	.eJxVjDkOwjAUBe_iGlk2XkNJnzNYf7FxADlSnFSIu0OkFNC-mXkvkWBba9p6XtLE4iKMVuL0uyLQI7cd8R3abZY0t3WZUO6KPGiX48z5eT3cv4MKvX5rZQHROh1VJABg9l5r8i7omI0ZcvGFI0VV0ABHjcPZUsDsDVhHHIp4fwA5-jjx:1oUIm7:2WzAThl8-BL7ofxRCsSt92pgelmwFmXTUZpN5Bt9CdQ	2022-09-17 07:50:47.397328+05:30
fvro50ls965u7d8gqc9iwegco1m7egku	.eJxVjMsOwiAURP-FtSGAPF267zeQC_cqVQNJaVfGf5cmXWgyqzln5s0ibGuJW6clzsguTFnPTr9tgvykuiN8QL03nltdlznxXeEH7XxqSK_r4f4dFOhlrMHJbBIFIVA5TSCDRPQ3BSaIgAq1kRky-hF9HiwhheCsB0HegtHs8wVB_Tiq:1oREwB:RYj-6o6cGURpioEFTmDagFOTElXNyhfXd7SX-z4bBEo	2022-09-08 21:08:31.168546+05:30
9oe2kzk8ptf2yeup2xbyovpbpa9rq4i2	.eJxVjDsOgzAQRO_iOrJs1h9ImZ4zWF7vEpNEtoShinL3gESRVCPNezNvEeK25rA1XsJM4io0OHH5bTGmJ5cD0SOWe5WplnWZUR6KPGmTYyV-3U737yDHlve10y6xRcu9SXska7wzyvagjVfeqjTFQZPqolXgUFFHw6QZwSMYBgLx-QIPrTea:1nP67i:L_HLmbLAjIH2BqWNTwTmXyhoNVCwrj7Tb-XCQaY5mZo	2022-03-15 22:47:18.126317+05:30
6xmcn8xx7qse9rrvhn7cd3vbpxamfiaa	.eJxVjEEOwiAQRe_C2pARWigu3XsGMjCMVA0kpV0Z7y5NutDte-__t_C4rdlvLS1-JnERCkCcfmnA-ExlV_TAcq8y1rIuc5B7Ig_b5K1Sel2P9u8gY8t9HWnQYBGIFQzGArqzcWyDVQ4gmonGrhAhGehc4TQyJ2a2WrsUtBOfLyCTOG4:1oLU30:6mMeDvDexPAO0RQq-BG7eqXu02sCrLerI9wHHATbN8A	2022-08-24 00:03:46.301359+05:30
ldnw4c3yl16i8efw7dk7a8qsunvgqfyc	.eJxVjMsOwiAQRf-FtSEw5enSvd9ABhikaiAp7cr479qkC93ec859sYDbWsM2aAlzZmcGAOz0u0ZMD2o7yndst85Tb-syR74r_KCDX3um5-Vw_w4qjvqto0fh_CSdAKuILBijIWpFcioTeq-NyBKEAYKiUankikomoivFWI_I3h8AGzew:1oPhNc:0cWcFmJAOMJQzqX34gcrZpBSMD_45cRxT2JxRTg7zgM	2022-09-04 15:06:28.471582+05:30
gy5833196vojfycnx7fq2to88hk592dl	.eJxVjDkOwjAUBe_iGln4O3ihpOcM1l8cHEC2FCcV4u4QKQW0b2beSyVcl5LWnuc0iTora4w6_K6E_Mh1Q3LHemuaW13mifSm6J12fW2Sn5fd_Tso2Mu3JgkYPKElZ4yno7XMGYh5cEg5n6wHB8HHSCN7iDICIwg5N3AEMKzeH0wjOO0:1oUL1S:xMoSoWMSxj-4vXV2AwDSI0RwwHuXP98pTGeBnMPpFPU	2022-09-17 10:14:46.874293+05:30
w3pdaqqy7xef4090y30ok7t4qydi6a5e	.eJxVjEEOwiAQRe_C2pCBDh3GpfuegcCAtmpoUtqV8e7apAvd_vfef6kQt3UMWytLmLI6K4usTr9rivIodUf5Hutt1jLXdZmS3hV90KaHOZfn5XD_DsbYxm-NiH3qpBPqixchYQPm2oNDoATOM1kAQGMjM4NHYKZEZEmcFcui3h_45zZp:1oRGF8:zNQOHEnPmfLgz92wV81vKfNz8ccLDURr3eEN-3qOlBA	2022-09-08 22:32:10.683455+05:30
u0zr9kljpboy0tiz1ll9kt81omf7ls53	.eJxVjEEOwiAQRe_C2hBgkIJL956BzDBUqgaS0q6Md7dNutDtf-_9t4i4LiWuPc9xYnER2hpx-l0J0zPXHfED673J1OoyTyR3RR60y1vj_Loe7t9BwV622iggfQatnWUDZEHRGLIBxQR-VBuwIeHgwYdkBzAKKbig0bPTHtGIzxf1kjb7:1nP7t3:6BXgItVFaORsJakJemZDN6KLHPEnsYLbsWNnwm0wo8c	2022-03-16 00:40:17.843066+05:30
qmni3wrqilemxkttvdkf89md8n07fewn	.eJxVjMsOwiAQRf-FtSEDRB4u3fsNBGYGqRpISrtq_Hdt0oVu7znnbiKmdalxHTzHicRFaFDi9LvmhE9uO6JHavcusbdlnrLcFXnQIW-d-HU93L-Dmkb91sUp7Ys1pRQApx0zUglWeQDwmTN5IhUcBnM2mdAmnwwTe0sOMRCI9wdAQzk6:1oLgG6:Cbbw_iOvY9nHQWVqCDvQj7BRq0nMkmoutmu63RhH4VI	2022-08-24 13:06:06.177062+05:30
ko30whi7hrov89biefyri9s5n5ea7s7y	.eJxVjDsOwyAQBe9CHSF-4pMyfc6AdhcITiKQjF1ZuXuE5CJp38y8g0XYtxr3kde4JHZlSht2-V0R6JXbROkJ7dE59batC_Kp8JMOfu8pv2-n-3dQYdRZK8pACsA5FM4LdM5jQnCgQhFKgvVKaCsxBeulJlNyMJCQSGojcmGfL0iMOOI:1oPhkP:BHbBCJnTdcM3nUry6rhCMQ1bgqnnW5iohfKXBIe33xM	2022-09-04 15:30:01.968976+05:30
eqimeeozsx6a6j4t62rxd3xoexkd5fe4	.eJxVjDkOwjAUBe_iGln4O3ihpOcM1l8cHEC2FCcV4u4QKQW0b2beSyVcl5LWnuc0iTora4w6_K6E_Mh1Q3LHemuaW13mifSm6J12fW2Sn5fd_Tso2Mu3JgkYPKElZ4yno7XMGYh5cEg5n6wHB8HHSCN7iDICIwg5N3AEMKzeH0wjOO0:1oULAm:ky3F6D4iM65OhlzbneEVMaF8G7qYFtStSiFOwesAVe0	2022-09-17 10:24:24.35892+05:30
qezfbgcsc0iyakboogkem6fq7u8z6se3	.eJxVjDsOwjAQBe_iGlmJnfWHkj5nsHa9Ng4gR4qTCnF3EikFtDPz3lsE3NYStpaWMLG4CmW8uPxSwvhM9VD8wHqfZZzrukwkj0Setslx5vS6ne3fQcFW9rVzbDwryz3kBNYomwG9ZqKMhnWkvKMeQPNAHnPHkeygyUXlNPjOic8XQtk4ig:1oRIu7:ec9dR2gLhFSV2k1EMq3SvDWZf8esEwpQyf4ItXZ8bMk	2022-09-09 01:22:39.860346+05:30
7hy7aziroz85113hpadolw6u8t5hp5g8	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1nPPr1:yi4sJcwVPIt6EmW0HYz185s4VPcejraP-q__3xB22nk	2022-03-16 19:51:23.952843+05:30
uw8fjq346j09a39nqygv585hqbjh6ob3	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oLk17:Vy3P2ElpBYRp3R6gsEPHjQ4lR7HcEIunpW-VnBT0vOw	2022-08-24 17:06:53.759338+05:30
dij75fvkls8oroimk3tbm2dbhk7yuky5	.eJxVjEEOwiAQRe_C2hCgDIJL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERJnhx-l0J0yO3HfEd222WaW7rMpHcFXnQLseZ8_N6uH8HFXv91kUDapcMK1VCAesdDFYrzIEoew3WYibPxp4dGcfWmwGQEDiVwAmNeH8ALF44lw:1oULlR:Utla2_PBhSolcmjkjdwCzQsCBxs3NWM6RCHF1cQatWg	2022-09-17 11:02:17.126762+05:30
3ooiq5n84w4m73j1642044czr25ee625	.eJxVjDsOwjAQBe_iGlmJnfWHkj5nsHa9Ng4gR4qTCnF3EikFtDPz3lsE3NYStpaWMLG4CmW8uPxSwvhM9VD8wHqfZZzrukwkj0Setslx5vS6ne3fQcFW9rVzbDwryz3kBNYomwG9ZqKMhnWkvKMeQPNAHnPHkeygyUXlNPjOic8XQtk4ig:1oRJ0i:32BYZR72F3HR8Ea0zjcGIr1pG9cit-FZZfnMvc-l7ho	2022-09-09 01:29:28.146781+05:30
i6vuunwj6dt0jekhmbl19uaw8cyjsygb	.eJxVjEEOwiAQRe_C2hCgMKBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIitLXi9LsmpEdpO8p3bLdZ0tzWZUpyV-RBuxznXJ7Xw_07qNjrt8bsWHvjFA_kQ2CvXSpgGYtXDAMRkDWQCc5AJSmnNOrkwBsImAOweH8AOHI4cw:1nPPsu:bEGpUXeO4VXir4TyFSXP6xOOtXfN281v8umikk6okdQ	2022-03-16 19:53:20.589689+05:30
8lq9fo27yzhxcth68hq9fodqkic081pa	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oLk1F:YWYS7rytQ--Q79I65f3ihrFEDjhg97TdjXwIeePZLnw	2022-08-24 17:07:01.347495+05:30
nfd1eb718bv5szhll2ac8c32tkdtkwia	.eJxVjMsOwiAQRf-FtSE8BhGX7vsNBJgZqRqalHZl_HfbpAvd3nPOfYuY1qXGtdMcRxRXYcCK0--aU3lS2xE-UrtPskxtmccsd0UetMthQnrdDvfvoKZet9o6duAdAJPV3tuQsiZA5ciGjSlQBU0JzClcqGgmBlYG_ZkVa4MoPl8iCDij:1oPiNc:I3VQGi9vuMJ4k8GEE0nPlJS0zuUu7BrXa0sbz1pkXe0	2022-09-04 16:10:32.987435+05:30
hwh54yp7vgw2nwxh1wf9gcjdavu6kigp	.eJxVjMEOwiAQRP-FsyFdWErx6N1vILuwStXQpLQn47_bJj3ocea9mbeKtC4lrk3mOGZ1VhaMOv22TOkpdUf5QfU-6TTVZR5Z74o-aNPXKcvrcrh_B4Va2dbeCorkYANL6BIC9ujJpiG7nHoIJkEH7IctebwhATMDOwnOeEJC9fkCMN04Yw:1oUNy9:-fgeQlpKxID7aykARFwA4Ggobp3MzHCGtcHB9BnK8DM	2022-09-17 13:23:33.35899+05:30
j2mnjmh3elptoqxlmu6jaarf2kg5mzdm	.eJxVjDsOwjAQBe_iGlmJnfWHkj5nsHa9Ng4gR4qTCnF3EikFtDPz3lsE3NYStpaWMLG4CmW8uPxSwvhM9VD8wHqfZZzrukwkj0Setslx5vS6ne3fQcFW9rVzbDwryz3kBNYomwG9ZqKMhnWkvKMeQPNAHnPHkeygyUXlNPjOic8XQtk4ig:1oRJGU:nDvzy95vIvR_FBVpeh6Djdq9klqKi9NG7evfohShsPY	2022-09-09 01:45:46.937468+05:30
6tjmmlwm9s6lvbemub8zxfscq5a6aj73	.eJxVjEEOwiAQRe_C2hCgMKBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIitLXi9LsmpEdpO8p3bLdZ0tzWZUpyV-RBuxznXJ7Xw_07qNjrt8bsWHvjFA_kQ2CvXSpgGYtXDAMRkDWQCc5AJSmnNOrkwBsImAOweH8AOHI4cw:1nPcVi:1yreqV8BlC2Jqam4r4fbunLI164d6_1Q8KSs1_WKvr0	2022-03-17 09:22:14.610862+05:30
jq7jzvyp4rsvz4yfbg50ylhzenoqn0b0	.eJxVjEEOwiAQAP_C2RBKywIevfcNhGW3UjWQlPZk_Lsh6UGvM5N5ixCPPYej8RZWElcxuFFcfinG9OTSFT1iuVeZatm3FWVP5GmbnCvx63a2f4McW-5jNZmEmr2z4N3iaRrVMg4IFixZZg2kEZDYGMtJcUIP5CgCm6QZWHy-KrE46w:1oLk1L:zbgunPHt1bUSjLjdIfNGF7FXDf2aQ6bKYq6VrQuDGIE	2022-08-24 17:07:07.362896+05:30
92en4p85uwby6jncjyiwie6qvuf5lyu9	.eJxVjMEOwiAQRP-FsyFsAQGP3v0GwrKLrRpISnsy_rtt0oOeJpn3Zt4ipnUZ49p5jhOJixiMEaffFlN-ct0RPVK9N5lbXeYJ5a7Ig3Z5a8Sv6-H-HYypj9saAhBbUAE9uS14YNagPdiQixuQLRIoVBC89oYxGUfFnXOB7DloEJ8vHRM4EA:1oPiYQ:WcHVx8m6jUt7WqN4eFSQ7jLNzjg-vKCQWd7P1B6Q-EE	2022-09-04 16:21:42.432672+05:30
z2qtw7sqlicoa8inso2zx8dep7nbk6bl	.eJxVjEsKwjAUAO-StYTmpSapS_eeobxfTFVaaNqVeHcJdKHbmWHeZsR9K-NedR0nMRcDsTOnX0rIT52bkgfO98XyMm_rRLYl9rDV3hbR1_Vo_wYFa2ljYq8BCIaQAElcxtz36jwkQuCkMTC6zEweRCW6LPHsuUPIFAcB8_kCUls5dQ:1oRPBt:V3Hwq5DR-7LlfDUo6YedernEzHeldjeCQrPvVwbNB-s	2022-09-09 08:05:25.789538+05:30
5c2dd0ybajvx5anhghsv4hdh1u3bmymp	.eJxVjDsOwjAQBe_iGln-rW0o6TmDtesPDiBbipMKcXcSKQW0b2bemwVclxrWkecwJXZh0gA7_a6E8ZnbjtID273z2NsyT8R3hR908FtP-XU93L-DiqNudS7eCCwpgQPhFRWXrKGotLKepKcCRFoAWlSgN6Y0oSjeSUlSx7Ngny87hDgm:1nPdsm:ccB9zmdgPG1SYZd2q-IA9zur2OSgVJ-vXkEijjgyYw4	2022-03-17 10:50:08.165224+05:30
85kewz4kdhxbrioxtktkzrin0d7ulhdi	.eJxVjEEOwiAQRe_C2hCEQgeX7nsGMsxMpWpoUtqV8e7apAvd_vfef6mE21rS1mRJE6uLssaq0--akR5Sd8R3rLdZ01zXZcp6V_RBmx5mluf1cP8OCrbyrcU5DCCB_GgN9N4gh2CcCbnrzigewVtyEQGiRCdMIDwGtBQpO5RevT8g6jig:1oLxZr:n5-RM2duKEH-XcnNWktU-_afwUAs0MbuOkBIhp1BOQI	2022-08-25 07:35:39.643895+05:30
xzjvh64y59do4msyyfv1gw5cft4kuj2v	.eJxVjEEOwiAQRe_C2hCgDBGX7j0DGZgZqRqalHbVeHdt0oVu_3vvbyrhutS0dp7TSOqinAd1-l0zlie3HdED233SZWrLPGa9K_qgXd8m4tf1cP8OKvb6rbl4CChFwLHEQJhJindggX1w9kwCgzXiwDCDRxsdGjLGUgxDxkDq_QFSjzi3:1oPk65:hzH3NGvS3JyA6xJNphQGghoaTQRfurcxPVgJISjNEhM	2022-09-04 18:00:33.457161+05:30
lpsfmaj61r5eq2vqra389vznlzsqr20q	.eJxVjM0OwiAQhN-FsyFbflzw6N1nIAtLpWogKe3J-O62SQ96m8z3zbxFoHUpYe15DhOLi9CDFqffNlJ65rojflC9N5laXeYpyl2RB-3y1ji_rof7d1Col20dR-UsAHrHqB2QBZM4Y1YMg3FqS2eO1lBmBmXcqA0yok3Re0BkLT5fHjg36A:1oURrK:YitucDPOKEreVLM5tO4P-sRRyX276qKjFIa3gClOzyY	2022-09-17 17:32:46.420494+05:30
hga7t3a7bbn7390fkab4csigk1p99dfm	.eJxVjEEOwiAQAP_C2RDYbqF49O4byLKAVA1NSnsy_l1JetDrzGRewtO-Fb-3tPo5irMAq8XplwbiR6pdxTvV2yJ5qds6B9kTedgmr0tMz8vR_g0KtdLHaAKS4ynZUUW2ZgCNjJATaY2QhtE5CmSZSOXJKKvcF2UAMAYVBPH-AB0wN20:1oRQ0o:03DnRPHp9P1UDwIbejSg9otLVG3SIlprGCiFTOJ-83g	2022-09-09 08:58:02.226915+05:30
83em7s9mn4w6x7zwauwzl54glevw0lpl	.eJxVjEEOwiAQRe_C2hCgDBGX7j0DGZgZqRqalHbVeHdt0oVu_3vvbyrhutS0dp7TSOqinAd1-l0zlie3HdED233SZWrLPGa9K_qgXd8m4tf1cP8OKvb6rbl4CChFwLHEQJhJindggX1w9kwCgzXiwDCDRxsdGjLGUgxDxkDq_QFSjzi3:1oPkLj:j4p1pQdfK9xlwz0WBvhiWu6bDkZx4l41Y0sxCMzMJkI	2022-09-04 18:16:43.805961+05:30
vgktrzoay7t42rl6cfz8z1tlhq8772td	.eJxVjMsOwiAQRf-FtSEjj1Jcuu83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxIXoZwSp9-VMD647ijdsd6ajK2uy0xyV-RBu5xa4uf1cP8OCvbyrW1yjApHbT2BdkjauwFyduhTBqUMs7ejBzRswNCAGjNFo8FngjNo8f4AMK04Lw:1oRUdQ:E7MbUKcfEcx-wNp-wErfhC5ntusQ8Bm7fRwOunfY45w	2022-09-09 13:54:12.430952+05:30
pn9esrsrn80xtxe5rnuqpnos2hylhpa3	.eJxVjLsKwzAMAP_FczGWI0WmY_d-g5H8aNKWBPKYQv-9GDK0691xh4myb0Pc17LEMZurAWRz-aUq6VWmpvJTpsds0zxty6i2Jfa0q73PubxvZ_s3GGQd2thDZQ1OEEiLh8wVpCqT77teMGTsJRGg61zwopQIA4FzhZWRIZnPFxhBN1w:1nQ7gJ:ZaxJu5K6RDJbTzxNc7aUfu54HfaTfPuIRdf5XhN4GKE	2022-03-18 18:39:15.518775+05:30
8gvodf1w217buxl3ijdyncf2np8s1rrn	.eJxVjDkOwjAURO_iGll2HOs7lPScwfpbSADZUpYq4u4kUgrQdPPezGYyrsuQ11mnPIq5mgaCufy2hPzSciB5YnlUy7Us00j2UOxJZ3uvou_b6f4dDDgP-xo6pQa4hz1Jk6fWc98FVsIUPTuOLBgYnEPBpkXFPiAAxyhJyHnz-QJimTmx:1oRVds:58P0RjaYsLNIemJLQG6m-ZsMxP6CJuvqaiK3Vv34GRw	2022-09-09 14:58:44.836753+05:30
lyz5ix7sijs7r55bhy49scbal0a1fq7b	.eJxVjDsOwyAQRO9CHaHlYz4p0_sMaGEhOImwZOwqyt1jSy6SbjTvzbxZwG2tYet5CROxKxMg2eW3jZieuR2IHtjuM09zW5cp8kPhJ-18nCm_bqf7d1Cx133tC3kwKAsJnbXyXhSZQcnkhNmzcUNCq5JTOno0ogBaR0oOSODIgmWfLxviN68:1nQECz:6Qyv6393ZWsO-Ii7fCX8eDoLN3PTUDaDLKlWJ5WiQ34	2022-03-19 01:37:25.839385+05:30
elj1m6no4ge2a2heewwhor9uggsaev97	.eJxVjEsOAiEQBe_C2pDm04Au3XsG0g0oowaSYWZlvLtOMgvdvqp6LxFpXWpcR5njlMVJaEBx-F2Z0qO0DeU7tVuXqbdlnlhuitzpkJeey_O8u38HlUb91pCODqwhtICcCZwKbBiJg7UM3kHKwTqN2jsMWV0LqOLJ62KCVZhAvD8IZDcv:1oMORr:oAn-r13pN3slr-Eox8Ve7nMajHaiK247ABrOqqeS-0o	2022-08-26 12:17:11.142182+05:30
66ujksaz807wj1a3w6wid6f9e47ni6wh	.eJxVjEEOgjAQRe_StWlKh5kyLt1zBjJlqqCmTSisjHdXEha6_e-9_zKDbOs0bDUtw6zmbHxL5vS7RhkfKe9I75JvxY4lr8sc7a7Yg1bbF03Py-H-HUxSp28NV4wsTQQeFR07FzpQxZBaDs57ASBEwA6JSNvgExIoe0aKjXTszPsDBQE2ow:1oPm5k:42a1PAhA7oEaqg3bag07N7O7kP3uLMHB7rHTTIZeZME	2022-09-04 20:08:20.271154+05:30
fhn7w5935lzzi69gr77x5c2l6cgfreog	.eJxVjDsOwjAUBO_iGlnxJ8ampOcM0fM-GweQLeVTIe5OIqWAdmdm32KgdSnDOqdpGFlchFFWnH7XSHimuiN-UL03iVaXaYxyV-RBZ3lrnF7Xw_07KDSXrY7acmByMElR0EBOWnGGB1vogOiNJtMF9I46bMy6c1bZevLK9xHi8wVc1zkd:1oUTwS:Wxlqmacmc6R7UG7wfdL9DOCdurRpMEGJpffiWMJZv0Q	2022-09-17 19:46:12.038269+05:30
4iz3n2h1xzblwet9ydob3a92hbioxqcv	.eJxVjMEOwiAQRP-FsyFllwr16N1vIAu72KopSWlPxn-XJj3oZQ5v3sxbBdrWMWxVljCxuihwVp1-aaT0lHmv-EHzvehU5nWZot4VfbRV3wrL63q4fwcj1bGtMUGPBrkX3zHkls4OElHQApFJjNmSUOPGQmfj4M-QMziPybA4Up8vLGw4Xg:1oRVrY:zGOApPKWTG9oBlE5jyspUemIKugzRvNlBt0OK7r_iQ0	2022-09-09 15:12:52.422156+05:30
msxx057odpfmvli3wcoxh0ppwd01wd34	.eJxVjEEOwiAQRe_C2hCgMKBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIitLXi9LsmpEdpO8p3bLdZ0tzWZUpyV-RBuxznXJ7Xw_07qNjrt8bsWHvjFA_kQ2CvXSpgGYtXDAMRkDWQCc5AJSmnNOrkwBsImAOweH8AOHI4cw:1nQIvp:FWZ0IMwUBLFvQxedL7Rm4Ce_Ce1demOlLH5OL09-V-4	2022-03-19 06:40:01.124972+05:30
xj0x29bpzcd0xi0hqczbzflpcz2znjjh	.eJxVjEsOwiAUAO_C2hD6yq8u3fcMBHg8qRpISrsy3t2SdKHbmcm8mfP7lt3e0uoWZFcGQrPLLw0-PlPpCh--3CuPtWzrEnhP-Gkbnyum1-1s_wbZt9zHBMlIPSBGUEkFKVB7cUCJYrSERGDVCMkOYEYTpIrG0BQmZQ9sCNjnCzFsN-8:1oMQrG:PgUvN3JmyE2728zdarFkjfr74lBp12eLFg9KBktd5ys	2022-08-26 14:51:34.259341+05:30
yroqbnjm4iey80fmh0nj9nbmyi5hqgvd	.eJxVjDsOwyAQRO9CHSHAfEzK9D4Dgl02OIlAMnYV5e6xJRdJNdK8N_NmIW5rCVvPS5iRXZnSjl1-2xThmeuB8BHrvXFodV3mxA-Fn7TzqWF-3U7376DEXvZ1llGgGDR5a6yibDOAS1Zjoj0GgxClJ-fIoB8FoR-cB0pKmtEZLYF9vkrJOLo:1oPmli:MGHJL0VSxzk-P7yhE9xl7ALEEJNq9u-xDVoL2cQH5dA	2022-09-04 20:51:42.772823+05:30
iflkq5ocxb1m25adlfcra83fqh3pg2qw	.eJxVjEEOgjAQRe_StWlaOmXApXvO0Mx0WkFNSSisjHcXEha6_e-9_1aBtnUMW01LmERdlbNeXX5XpvhM5UDyoHKfdZzLukysD0WftOphlvS6ne7fwUh13Gtm7h1atNY3XQ_GGxLnewQHKG23o9aRAY5NjC1lm1MG6DIIIiOKUZ8v_r03fw:1oUVNV:b87-m0zFrBfuYnaN4aQeKSQ9yFiq0Hx7GJmXi-jRZwg	2022-09-17 21:18:13.592431+05:30
bfj8f5hqprhvo2jwn6a0wsey0vm9tc6g	.eJxVjMEOwiAQRP-FsyFllwr16N1vIAu72KopSWlPxn-XJj3oZQ5v3sxbBdrWMWxVljCxuihwVp1-aaT0lHmv-EHzvehU5nWZot4VfbRV3wrL63q4fwcj1bGtMUGPBrkX3zHkls4OElHQApFJjNmSUOPGQmfj4M-QMziPybA4Up8vLGw4Xg:1oRW3J:fiJwxH0Y3eQxJ3GKpLQW-2iLRHdqdceyVySNlQaOkP4	2022-09-09 15:25:01.405112+05:30
zsu2fgqzgndxz9z3tko551mad1nc33sf	.eJxVjDsOwyAQRO9CHSEwLHhTpvcZrIWF4CQCyZ8qyt1jSy6SaqR5b-YtRtrWMm5LmseJxVVoheLy2waKz1QPxA-q9yZjq-s8BXko8qSLHBqn1-10_w4KLWVfQ4fKWsPco88EbIg9KIceqAM0Dm3gqJ0POTsFxu2BOidFWTFB6MXnCxU4OCI:1nQOnn:J4f38Sp4uY9llktMCBRewA1s2bj10IqtQb0xQQnNEmo	2022-03-19 12:56:07.82535+05:30
rmrqoj1bitvuj7o4p0f9xdn9f3j5xwi9	.eJxVjDsOwjAQBe_iGll2_Kekzxms3fWCA8iR4qRC3B0ipYD2zcx7iQzbWvPWeclTEWcxqCBOvysCPbjtqNyh3WZJc1uXCeWuyIN2Oc6Fn5fD_Tuo0Ou3jgkQypCu7IIlY3VgC1obtIaUQu_JK0-YDLIjIp9sgKhiNJYdECXx_gAztTho:1oMVCd:dm25N58dltNwqkzVJVvXjMBOJrye3ZBWGyAfl3kVC8k	2022-08-26 19:29:55.282366+05:30
g6dbbpwyx6w6j753v47zkrxh09gkidnr	.eJxVjMsOwiAQRf-FtSGUNy7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7Myk9uz0uybID2o7wju0W-e5t3WZE98VftDBrx3peTncv4MKo35rQudFsGSN85ikBiOy0kYU7TBZ5YvEXGzA5ED5HDCLSRCFAhMoWZRk7w809Dim:1oPmtJ:A5ZHwj2Ie5usVVWBUHQt0FluTAxL-_NNvwSG76V2OSY	2022-09-04 20:59:33.563112+05:30
0fifk7p9fsqe2bsl4vbnkuu8d6pl62b6	.eJxVjEEOwiAQRe_C2pBSplNw6d4zkBkYpWogKe3KeHfbpAvdvvf-f6tA65LD2mQOU1JnZQ2q0y9lik8pu0oPKveqYy3LPLHeE33Ypq81yetytH8HmVre1uQs-44peQsoVm7UC8Zx8Bs1QEBenAUZ0TgiYbSMHSTsETwPPrH6fAE8TTh0:1oUWEU:LBpzIsu9hUo9GV2uGWkqb_ocRM6e9LGFJjCsMAzwUqg	2022-09-17 22:12:58.881239+05:30
2oxxr8emw4swni40hllypsb50opi3y1k	.eJxVjDsOwjAQBe_iGlmJnfWHkj5nsHa9Ng4gR4qTCnF3EikFtDPz3lsE3NYStpaWMLG4CmW8uPxSwvhM9VD8wHqfZZzrukwkj0Setslx5vS6ne3fQcFW9rVzbDwryz3kBNYomwG9ZqKMhnWkvKMeQPNAHnPHkeygyUXlNPjOic8XQtk4ig:1oRZEn:gLJZAApUOahveXKt3D3ydSRHALGYALOThMQhKxo1WB8	2022-09-09 18:49:05.751052+05:30
st41574r7zthbmmebvdue5emmmk99fb9	.eJxVjDkOwjAUBe_iGlleY0NJzxmsvzg4gGwpTirE3UmkFNC-mXlvkWBdSlp7ntPE4iK0i-L0uyLQM9cd8QPqvUlqdZknlLsiD9rlrXF-XQ_376BAL1tNENEHYDJstc4YQoTRkvMcow_joPAMaiD2pCIQGdh8FbTxLhg01orPF0-lOIk:1nQRWg:zY_oTWJ3zXVVxTmt5YJ_4lQy6s4giYKP6PK0b8RLcm4	2022-03-19 15:50:38.308678+05:30
l9yw3mxopb2w08n8jssfgthyopevxlr9	.eJxVjEsOgkAQBe8yazOZbh1oXLrnDKR_CGogYWBlvLshYaHbV1XvHTre1qHbii_daOEaMFE4_a7C-vRpR_bg6T5Hnad1GSXuSjxoie1s_rod7t_BwGXYa1d34watSlWFwgiGRpgvRCDEWVkAezA-Z2qgpkTe1z0mrZFFIXy-TKg4uw:1oMVPr:ljZUlgnSUz4ZofrKJXRUu_QiDfiWnEqhAZOnEzwSe6k	2022-08-26 19:43:35.443423+05:30
qvcp9t30vnw8ob6ams9sgh37qlu4cug5	.eJxVjEEOwiAQRe_C2pCBDh3GpfuegcCAtmpoUtqV8e7apAvd_vfef6kQt3UMWytLmLI6K4usTr9rivIodUf5Hutt1jLXdZmS3hV90KaHOZfn5XD_DsbYxm-NiH3qpBPqixchYQPm2oNDoATOM1kAQGMjM4NHYKZEZEmcFcui3h_45zZp:1oPp5w:6pDsAVXW71IDlYj6KZc4nBuIwOiIzaMGBGZXB9wtll0	2022-09-04 23:20:44.856988+05:30
fordyjzzwby9jleodcrgtfxj9av1wjk6	.eJxVjMsOwiAQRf-FtSHgQBlduu83kOExUjWQlHZl_HfbpAvdnnPufQtP61L82vPspySuArQTp18aKD5z3VV6UL03GVtd5inIPZGH7XJsKb9uR_t3UKiXbW10xktAY11mm9ipbJBQMbHCmCxEYk0DhMgaQBlLmplBDZzOuFEQny9EXDj3:1oUWFd:InzHGOumsfGCIqYL5tAp9YtUFFognKSxJOKRRVC70x8	2022-09-17 22:14:09.616736+05:30
ohueenwt3j5k4y3u3nyc1xz5hgu0kx3q	.eJxVjEEOgjAURO_StWkq8OnHpXvP0Ezpx6KmTSisjHeXJix0O--9eSuHbY1uK7K4OaiLaiyp0-_qMT4lVRQeSPesx5zWZfa6KvqgRd9ykNf1cP8OIkrca2kxMDAZ4630E4NbA-u7AZ4roP5sIMQkRB0FEFsYBGn2jmyw6vMFRzg4pQ:1oRaub:F36c1uksZq4diewCpcRhtSp-d3ix_uQR9lB41MzeWUk	2022-09-09 20:36:21.432289+05:30
kzpb64airdkkhm0qe3ekynfvtlatsojr	.eJxVjEEOwiAQRe_C2hCgMKBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIitLXi9LsmpEdpO8p3bLdZ0tzWZUpyV-RBuxznXJ7Xw_07qNjrt8bsWHvjFA_kQ2CvXSpgGYtXDAMRkDWQCc5AJSmnNOrkwBsImAOweH8AOHI4cw:1nRH16:cgbxpphWt-UkyYD2HW8sqmlRBEkb11K2OCBY4x84_8o	2022-03-21 22:49:28.63728+05:30
ij6al6guagps6g3sl9rmbkxtmzuxs8dk	.eJxVjMEOwiAQRP-FsyGwBQoevfcbyLIstmpKUtqT8d9tkx70NMm8N_MWEbd1jFvjJU5ZXAWoIC6_bUJ68nyg_MD5XiXVeV2mJA9FnrTJoWZ-3U7372DENu5rLoCafWZ0RImppB4p61AckO67PR0HW7xiB0CcCxRtjfXKBDLYgfh8AXwCOWY:1oMVlz:D5p_E5xg1vcFKspPyJrSKEjmx8PqUIkkKboHDnGIApE	2022-08-26 20:06:27.457159+05:30
01iayviga4ni7gd9iluhhg439v2sjuq6	.eJxVjEEOwiAQRe_C2pCBDh3GpfuegcCAtmpoUtqV8e7apAvd_vfef6kQt3UMWytLmLI6K4usTr9rivIodUf5Hutt1jLXdZmS3hV90KaHOZfn5XD_DsbYxm-NiH3qpBPqixchYQPm2oNDoATOM1kAQGMjM4NHYKZEZEmcFcui3h_45zZp:1oPpC7:7PwCKrhI6I_sm5Huw67wsVaONsss-xUiSYVIr0H-3uw	2022-09-04 23:27:07.997113+05:30
zuxiycx85id3xumxpterzpgfp59dk56d	.eJxVjDEOAiEURO9CbQgsfAFLe89APnyQVQPJslsZ7y6bbKHNFPPezJt53Nbit54WPxO7MCUtO_22AeMz1R3RA-u98djqusyB7wo_aOe3Rul1Pdy_g4K9jLWAJI3MwlnIbmSOoCjgOQAQ2kkjKUGABpUlApG1Bqd0NkMOIZuJfb4oqjhI:1oUf3d:oG4Hxjp2w1J4hsIM5FwGQXvb3ReYOGRmIrcWvtiXo7s	2022-09-18 07:38:21.777408+05:30
3i9cerxz9jjtmx5zu0bkclwzljfv1o69	.eJxVjMEOwiAQRP-FsyFAswU8evcbyO4CUjWQlPbU-O-2SQ96m8x7M5sIuC4lrD3NYYriKowdxeW3JeRXqgeKT6yPJrnVZZ5IHoo8aZf3FtP7drp_BwV72dcERoHjMSrtrGWrsgME5GFPZAZIwIkBnNWUyeuktHI-Zo8GskarxecLIwA4DQ:1oRbxT:msgHFSRLkT6-G6FO4Z9v3K-MfqKWm2pVmx1_oSIs0K8	2022-09-09 21:43:23.282083+05:30
nwgquw08h9d7o4x82j788tz2pe2ryn2b	.eJxVjDEOwjAMRe-SGUWKnNY1IztniOzYoQXUSE07Ie4OlTrA-t97_-USb-uYtmZLmtSdXSR3-h2F88Pmneid51v1uc7rMonfFX_Q5q9V7Xk53L-Dkdv4rQXEFIfYlxyUsMvCaIwoHUUoA0QBJgRUCIUMchkKm1ofIsWOydz7Ay5AOPM:1oMXUB:a1vna2FyBTZx3Tqk88LcpygxLpPjQH5rapeASaz2FLM	2022-08-26 21:56:11.216593+05:30
ry51qv87k5lw6e3sl3ftwvh1w16g7zhm	.eJxVjEEOwiAQRe_C2pCBDh3GpfuegcCAtmpoUtqV8e7apAvd_vfef6kQt3UMWytLmLI6K4usTr9rivIodUf5Hutt1jLXdZmS3hV90KaHOZfn5XD_DsbYxm-NiH3qpBPqixchYQPm2oNDoATOM1kAQGMjM4NHYKZEZEmcFcui3h_45zZp:1oPpLD:BHtncQJuV3tDjlbXdEZwdkpLMXie5PCus-GZonLjPak	2022-09-04 23:36:31.232498+05:30
slth1wrxemnjyfqcvgbki43pyeic1fqq	.eJxVjEsOwjAMBe-SNYoc6jgNS_Y9Q-XELi2gROpnhbg7VOoCtm9m3sv0vK1jvy0695OYizmHYE6_a-L80LIjuXO5VZtrWecp2V2xB11sV0Wf18P9Oxh5Gb_1kDFQExuXJOpARAJCDIqIBOC98wETYCtBcusA2DVAbVQljR5zNO8PGEU3Ww:1oRd4V:wOl37SntZdhirn1Pel0hOQCo03LymeERkDXN0o_fClg	2022-09-09 22:54:43.595233+05:30
l9dvomz77lolk46ocjxj8q2alaz9q38m	.eJxVjDsOwjAQBe_iGln-xJ9Q0ucM1tq7xgFkS3FSIe5OIqWA9s3Me7MA21rC1mkJM7Irk8PILr9rhPSkeiB8QL03nlpdlznyQ-En7XxqSK_b6f4dFOhlrwkpOYxWZaSMag_JZqPFANJLkbTLXmki7YV3MMoorUZAK3NGg4IM-3wBciE5hw:1nRg8N:_opkGGc32EEdtDEFKNss7csAZEH6KUj2UchGbKZOwL0	2022-03-23 01:38:39.478146+05:30
6tmsn0l7ze7qu6mcrrllxd40zdp4on4k	.eJxVjMEOgjAQRP-lZ9PU0u0uHr37DWTbXSxqIKFwMv67kHDQ22Tem3mbjteldGvVuRvEXIw_O3P6bRPnp447kgeP98nmaVzmIdldsQet9jaJvq6H-3dQuJZt3fTZ-YZdK4Rtz6QQYkBAddgTSsrBRaS4BfUICYBUNbIIQyBoyXy-J_o4Xw:1oMZDA:10c_ciSeEe-XAknnRCQTdHiK2vTrUlvemRNlYZwa_p8	2022-08-26 23:46:44.043291+05:30
rn0elh2f952lzcbedqq5nc2u10xxj7xd	.eJxVjEEOwiAQRe_C2pCBDh3GpfuegcCAtmpoUtqV8e7apAvd_vfef6kQt3UMWytLmLI6K4usTr9rivIodUf5Hutt1jLXdZmS3hV90KaHOZfn5XD_DsbYxm-NiH3qpBPqixchYQPm2oNDoATOM1kAQGMjM4NHYKZEZEmcFcui3h_45zZp:1oPpP6:soC48F3ObQX_eMt641GoCGkjMAKH2Rxu9VtR7-cEiA4	2022-09-04 23:40:32.940714+05:30
mu2fh1tgkroqihc0h7vtr94izkf22osx	.eJxVjDsOwyAQBe9CHSF-4pMyfc6AdhcITiKQjF1ZuXuE5CJp38y8g0XYtxr3kde4JHZlSht2-V0R6JXbROkJ7dE59batC_Kp8JMOfu8pv2-n-3dQYdRZK8pACsA5FM4LdM5jQnCgQhFKgvVKaCsxBeulJlNyMJCQSGojcmGfL0iMOOI:1oRdJi:avS9MHA7xumqJOw8opm_aKUk-88SI1yhvTOeVibKezw	2022-09-09 23:10:26.537846+05:30
eq5t4z693muhx252eybpgpt64sj421eb	.eJxVjDsOwjAQBe_iGln-ZmNK-pzB2vUHB5AtxUmFuDuJlALaNzPvzTxua_FbT4ufI7syaQW7_K6E4ZnqgeID673x0Oq6zMQPhZ-086nF9Lqd7t9BwV72WpManIIRsnBGETlNqCOMAQYBKYCzyiarELNBl-2uAgFm0to4GWRkny8VgDft:1nSD8P:eGe1vWc2WSPngPPoclcPsNJT8ivv5rG3wfk9qMnCl2g	2022-03-24 12:52:53.484181+05:30
0a7a085ddw2wgnncit5e2qztu90dpz50	.eJxVjLEOwjAMRP8lM4piB6eEkb3fUNmJQwuolZp2Qvw7rdQBlhvuvbu36Xhd-m6tOndDNleDAOb02wqnp447yg8e75NN07jMg9hdsQettp2yvm6H-3fQc-23NXlAd46yRXEBGmAgV0QdehIJBBeMmUJDCTBGDUWT98yK4ktJSObzBfJEN4w:1oMjmi:UrB0DnXWD1FoyBqA3xukreHOynTRwgAoJ4gIS-hiyMU	2022-08-27 11:04:08.813251+05:30
w35w39fayk1xwqtj276n9mjyto0s4okm	.eJxVjMsOwiAUBf-FtSFtubTg0r3fQO4DpGogKe3K-O_apAvdnpk5LxVwW3PYWlzCLOqsBtup0-9KyI9YdiR3LLequZZ1mUnvij5o09cq8Xk53L-DjC1_a5ZkKXV-kp7Rgptc6tE4gIENDAReuKdRkKJBYqAI5MiS-JFSAmvV-wNRrDmE:1oPyn8:gzNp5Soc3vWNMkxjTNGZ2TcqFqqjeSn4XZK3kjBsT50	2022-09-05 09:41:58.349675+05:30
bnx5iencyvmawzp1q2axsnsavmrrjaw1	.eJxVjEEOwiAQAP_C2RDYbqF49O4byLKAVA1NSnsy_l1JetDrzGRewtO-Fb-3tPo5irMAq8XplwbiR6pdxTvV2yJ5qds6B9kTedgmr0tMz8vR_g0KtdLHaAKS4ynZUUW2ZgCNjJATaY2QhtE5CmSZSOXJKKvcF2UAMAYVBPH-AB0wN20:1oRnIF:unPeiCQ5hTSLD1MCpxoVOZrh4GR0EquPa1rVMyU4lQI	2022-09-10 09:49:35.728087+05:30
s83a56z482dl6ldc27d8axhva1j7qg6w	.eJxVjMsOwiAQRf-FtSEwQIdx6d5vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiZ2ZNJKdftfg4yO3HaW7b7fOY2_rMge-K_ygg197ys_L4f4dVD_qtwYMRihTkIKxUhFYI8kghBw0lhgBtSo2eoQsAQnElMjqVCZPmGUS7P0BAJY3Yw:1nSFcS:RJpeLHsYrBPCpKbg83-WPk6UfDNylw-SUB1X1WHLOmY	2022-03-24 15:32:04.821566+05:30
lb08fpgxwcgx1uin9pb9o9xquxspuukg	.eJxVjMsOgjAQRf-la9O0Q6HUpXu_gUznYVEDCYWV8d-VhIVu7znnvsyA21qGrcoyjGzOBjyY0--akR4y7YjvON1mS_O0LmO2u2IPWu11ZnleDvfvoGAt31rAB00SI2p0EHOjmaR3jUfufRccOG5YNZHGHBJREiDyrm87H1tQNu8POe84mQ:1oMoJ1:8Oy25gTH7TG_rA2aDLMuU3kOOLp26jZ6k5o6XTSEsOk	2022-08-27 15:53:47.973536+05:30
pf8g1isn0nejshjmkgn9hc4kfc9iy5i6	.eJxVjDEOwjAMRe-SGUWKnNY1IztniOzYoQXUSE07Ie4OlTrA-t97_-USb-uYtmZLmtSdXSR3-h2F88Pmneid51v1uc7rMonfFX_Q5q9V7Xk53L-Dkdv4rQXEFIfYlxyUsMvCaIwoHUUoA0QBJgRUCIUMchkKm1ofIsWOydz7Ay5AOPM:1oQ013:002MKQytrkdT8gBjNhK3ZnuQZ-Fa8L1k5uVkRAcJFfg	2022-09-05 11:00:25.889106+05:30
0ltv16y7ciahjnzcvokmswiwu5vdeev0	.eJxVjDEOwjAMRe-SGUWKnNY1IztniOzYoQXUSE07Ie4OlTrA-t97_-USb-uYtmZLmtSdXSR3-h2F88Pmneid51v1uc7rMonfFX_Q5q9V7Xk53L-Dkdv4rQXEFIfYlxyUsMvCaIwoHUUoA0QBJgRUCIUMchkKm1ofIsWOydz7Ay5AOPM:1oRnbo:2c3OB_7Fml5XOcmX2-N6UI_-6AbJCiP07i9qU7vndOg	2022-09-10 10:09:48.047484+05:30
fb71sksn71x89kk0hwm3jo0jr4zipczw	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nSK9a:cdp4tZCy9ZIHrHgMJALm-Rq-34yngUcPk-5bscQhNt0	2022-03-24 20:22:34.646351+05:30
yjs0jrb5bce9vkodg7fo6mhj5wn64qy5	.eJxVjDsOwjAQRO_iGln2-ruU9JzB8mfBAWRLcVIh7k4ipYBminlv5s1CXJca1kFzmAo7M5CKnX7bFPOT2o7KI7Z757m3ZZ4S3xV-0MGvvdDrcrh_BzWOuq2TUCRuHoUxhDaTNIUykY5UinBOpwQZ0BpUHiBr57eQ0lnw1qNEYp8vNeY3vg:1oMvvE:RPVVWU7kKBUb3uVHsJLcLCHUWqRwN0uSOT-uy8P4zTQ	2022-08-28 00:01:44.197696+05:30
zx4ir59w6qvetmn1r21mffsjgjqnxev1	.eJxVjDsOwyAQBe9CHSF-4pMyfc6AdhcITiKQjF1ZuXuE5CJp38y8g0XYtxr3kde4JHZlSht2-V0R6JXbROkJ7dE59batC_Kp8JMOfu8pv2-n-3dQYdRZK8pACsA5FM4LdM5jQnCgQhFKgvVKaCsxBeulJlNyMJCQSGojcmGfL0iMOOI:1oQ0E2:DH-NT9bAY6NUXtV_T-Ob3sV81Z6FA63fxbEhlopzqlY	2022-09-05 11:13:50.654372+05:30
pfhtmw0k5gok5p4d9lk8i03451ynt18z	.eJxVjMsOwiAQRf-FtSEjj1Jcuu83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxIXoZwSp9-VMD647ijdsd6ajK2uy0xyV-RBu5xa4uf1cP8OCvbyrW1yjApHbT2BdkjauwFyduhTBqUMs7ejBzRswNCAGjNFo8FngjNo8f4AMK04Lw:1oRpB8:AU4rmXQsSm7ycUKZQ8tUJZyhx4nSV_kWaPF1xhHdpZc	2022-09-10 11:50:22.310017+05:30
onp0i7fg3jc8oxb6pevvmmccl5c2xl54	.eJxVjDsOwjAQBe_iGlnyH1PScwZrd73GAWRLcVIh7k4ipYB2Zt57iwTrUtM6eE5TFhehnBanX4pAT267yg9o9y6pt2WeUO6JPOyQt575dT3av4MKo25r4wuXqLEEMIxRuUjISJ426GwIUDSQZ2M8x8xglfKKOQYitHguUXy-YQg5ow:1nSXQj:fD0IT54M1neUiItU2HBjZlNdapkdDDA6QMQNnjgwuTE	2022-03-25 10:33:09.403794+05:30
7d8wgpkajtjlhbbw9sjzc89j2mzmwpmw	.eJxVjEEOwiAQRe_C2pCBDh3GpfuegcCAtmpoUtqV8e7apAvd_vfef6kQt3UMWytLmLI6K4usTr9rivIodUf5Hutt1jLXdZmS3hV90KaHOZfn5XD_DsbYxm-NiH3qpBPqixchYQPm2oNDoATOM1kAQGMjM4NHYKZEZEmcFcui3h_45zZp:1oQ0gS:tB7Hj_AGUFB2qzs3PBvUhZjmQHsJO34n7xO2nzuGd3A	2022-09-05 11:43:12.523367+05:30
j7ojunrv0bucqytz3t2gq7mijx3e28za	.eJxVjMsOwiAQRf-FtSG8YVy69xvIAINUDU1KuzL-uzbpQrf3nHNfLOK2trgNWuJU2JkpH9jpd02YH9R3VO7YbzPPc1-XKfFd4Qcd_DoXel4O9--g4Wjf2hmbADATgBZKGkBZpNO2AirQHoLXUmdVaypWkhdBy1wUBWGrqd4p9v4ADyw3Zg:1oRpNy:uh4UQmgfsVprZVXH_KyvtSBbuFOHFKsC_JXzsGrTX0Q	2022-09-10 12:03:38.406373+05:30
n7f8yuxuj7eg5sfmzs8u31suew5lgh5c	.eJxVjDEOwjAMRe-SGUU4qdOUkZ0zVI7tkAJqpaadEHdHkTrA-t97_21G2rcy7lXXcRJzMYDenH7XRPzUuSF50HxfLC_ztk7JNsUetNrbIvq6Hu7fQaFaWu0VE_QaOi8QkfMwOBczCCODdoE9dREzKUo4B2IgYI2cHCDGnrL5fAE6vDjJ:1nSaJr:Rb5neuQUIZ2QheH1fqyW5feGOeuBYGRgIfCNKyF7FsM	2022-03-25 13:38:15.45569+05:30
3pna7wst5hcq7y7l2k24wuw215lvcxsm	.eJxVjMsOwiAQRf-FtSGVR2FcuvcbyMwAUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcpiguQp2NOP2uhPxMdUfxgfXeJLe6zBPJXZEH7fLWYnpdD_fvoGAvW50yQdbaDjQ6rzQmRHbR-QF4AJ8ZGSiDyxwtAbIBMk6Z7DdfWxqV-HwBVMA5Dw:1oN8sn:lr_-wvldDld0pQwwVYLtr52Tu4_ud3QsILOz54GB9jU	2022-08-28 13:52:05.820666+05:30
fnh33dxfydmvh90rwryp89a76jzipf83	.eJxVjEEOwiAQRe_C2pCBDh3GpfuegcCAtmpoUtqV8e7apAvd_vfef6kQt3UMWytLmLI6K4usTr9rivIodUf5Hutt1jLXdZmS3hV90KaHOZfn5XD_DsbYxm-NiH3qpBPqixchYQPm2oNDoATOM1kAQGMjM4NHYKZEZEmcFcui3h_45zZp:1oQ0gS:tB7Hj_AGUFB2qzs3PBvUhZjmQHsJO34n7xO2nzuGd3A	2022-09-05 11:43:12.553595+05:30
gu480bfwxbt23eab8gx3rw5rpk5ko5kw	.eJxVjMsOwiAQRf-FtSEjj1Jcuu83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxIXoZwSp9-VMD647ijdsd6ajK2uy0xyV-RBu5xa4uf1cP8OCvbyrW1yjApHbT2BdkjauwFyduhTBqUMs7ejBzRswNCAGjNFo8FngjNo8f4AMK04Lw:1oRpV2:2HMNvBCdnYqZO_3ZMdlYSK2yHs4xDp9_CCDwiANmUmo	2022-09-10 12:10:56.236334+05:30
wn4q5omdc0cuwh7154zc9xfy0818f3vt	.eJxVjDsOwjAQBe_iGlmJs2sHSvqcIdpfSADZUj4V4u4QKQW0b2bey_W0rWO_LTb3k7qLCzW60-_KJA_LO9I75VvxUvI6T-x3xR908V1Re14P9-9gpGX81hWD8TAErKWliNpytHNIbZMYE3OgJIgaJQFwJQgGpoETNU0EUUb3_gBBHTjI:1oNAEZ:SghIetxcUdsslG3Fj3OkFS59iATftrf2hEkah630Tgk	2022-08-28 15:18:39.6504+05:30
bcd3lipcqkyzijzlx4v6o5098a60q1rd	.eJxVjEEOwiAQRe_C2hCBAoNL9z0DGZipVA0kpV0Z765NutDtf-_9l4i4rSVunZc4k7gIbZU4_a4J84PrjuiO9dZkbnVd5iR3RR60y7ERP6-H-3dQsJdv7QmsV-QgG092Mj6z8dr5QWWVJg5I52AH0C4YsMAuuJBYK9ApI4JT4v0BF7U3oQ:1oQ52J:LuUm3DgE7mALJf1JeUVbOLgYrwEOUT7muLnY8s3mgH4	2022-09-05 16:22:03.838031+05:30
qkcuujczfsxk0xc1ae1m4xjpf6wxm205	.eJxVjMsOwiAQRf-FtSEjj1Jcuu83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxIXoZwSp9-VMD647ijdsd6ajK2uy0xyV-RBu5xa4uf1cP8OCvbyrW1yjApHbT2BdkjauwFyduhTBqUMs7ejBzRswNCAGjNFo8FngjNo8f4AMK04Lw:1oRq5U:GGBfm_eYd0Bq9p86APtYNDcrTJPwMkc-qeTOsfTUnJc	2022-09-10 12:48:36.997601+05:30
qxm1oo97rjf38qr6xts995hbvos3ji9v	.eJxVjEsOAiEQBe_C2hBgmk-7dO8ZSEODjJohmc_KeHedZBa6fVX1XiLStra4LWWOI4uz0AbF6XdNlB9l2hHfabp1mfu0zmOSuyIPushr5_K8HO7fQaOlfWtlBheC1cDGBSRVXGVWgY1nBK_BYano0QKmqjwQgQKgwYRsrbfKivcH_2c22A:1nSgM4:C8Ypnn738XdZQAegjJtbN2x80tJQsNEhoeVrCGnGB0c	2022-03-25 20:04:56.682527+05:30
vpb7kvbpum1imgywmolardb020y6eltp	.eJxVjMEOwiAQRP-FsyGwZSv16N1vIAu7laqBpLQn47_bJj3ocea9mbcKtC45rE3mMLG6KLC9Ov22kdJTyo74QeVedaplmaeod0UftOlbZXldD_fvIFPL21qQPZMgGuZ-MKkDZmtxxKEbXbJGQCKcLUFH3gJsmRJHdIkRnPGoPl89hThH:1oNAN9:a4R5wYkR7MHc_fm-bvFSA8oxco0QoubfwFTEj2IUe8A	2022-08-28 15:27:31.279002+05:30
k98ksrhzbgt839r8lbpeqiim8mo3juiy	.eJxVjMsOwiAQRf-FtSHAMLR16b7fQBhmlKqBpI-V8d-1SRe6veec-1IxbWuJ2yJznFidlUOnTr8rpfyQuiO-p3prOre6zhPpXdEHXfTYWJ6Xw_07KGkp3zqJFfLYGWPJ0oA-XLkTRhQD_ZAB2A0meEjiOza27yUH44MnIISAoN4fIpQ3cg:1oQ8uX:1BkjeTMArkSqtsu8crqFBbU4v6c1cvn3msKbbFWmwZE	2022-09-05 20:30:17.241174+05:30
dq3obl2likuvna0efmn54penrc8kw0o3	.eJxVjMsOwiAQRf-FtSF0gBnq0r3fQBgeUjU0Ke3K-O_apAvd3nPOfQkftrX6refFT0mcBdAoTr8rh_jIbUfpHtptlnFu6zKx3BV50C6vc8rPy-H-HdTQ67eOpBUzBE1sdHFDDJGAHBpHxdrBKZ0M2wRKK0TnEMcCgEwRkCjzKN4fFjU3Mw:1oRr9m:lSSHZ26FqgNSch34xCK0p-NRytfZ-bAtDk4qJeO77RQ	2022-09-10 13:57:06.716697+05:30
kdtw4rggvr7ayl5jejlpzudxts2iixku	.eJxVjEEOwiAQRe_C2hCgMKBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIitLXi9LsmpEdpO8p3bLdZ0tzWZUpyV-RBuxznXJ7Xw_07qNjrt8bsWHvjFA_kQ2CvXSpgGYtXDAMRkDWQCc5AJSmnNOrkwBsImAOweH8AOHI4cw:1nShy4:Ya-YVO-we7lRLnlo-6mMHtXu_AVAdaYmGXbXSiMZWWY	2022-03-25 21:48:16.070199+05:30
hh5g7lyq183j1bxw3j9ceyj54334tuwl	.eJxVjEEOwiAQRe_C2hBAcMCl-56BDMwgVUOT0q6Md7dNutDtf-_9t4i4LjWunec4krgKo0GcfteE-cltR_TAdp9kntoyj0nuijxol8NE_Lod7t9BxV63GhOGUIz3XlG-GJ3BKkiKz-w0qYROcQ5QwHmbgS1QMJvkVbLWMxYSny8xwzhx:1oNVAg:J1qKfd9vSqqR-fQwoPG0Dp-i1lnXeuAF5GnJR2UqnRs	2022-08-29 13:40:02.785447+05:30
dz2gb8wgkg3f2sx0ptdp60clp52adu8s	.eJxVjDsOwjAQBe_iGlnxD9uU9DmDtevd4ACypTipEHeHSCmgfTPzXiLBtpa0dV7STOIitDPi9Lsi5AfXHdEd6q3J3Oq6zCh3RR60y7ERP6-H-3dQoJdvPbGH6NB7N7DNOHnj2dsBlAnEQWl0Z-CIxNaQgmy10xmCMtFqS8gg3h9AZjjF:1oQIOI:_wgNPwKsMPBZ-AMM_SIk5ZwQ3DIqSdYoWMlXiq2BC6I	2022-09-06 06:37:38.797549+05:30
5f32p4voyuk5bom1xsinceqrva7kt9ad	.eJxVjEEOwiAQRe_C2hCgMKBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIitLXi9LsmpEdpO8p3bLdZ0tzWZUpyV-RBuxznXJ7Xw_07qNjrt8bsWHvjFA_kQ2CvXSpgGYtXDAMRkDWQCc5AJSmnNOrkwBsImAOweH8AOHI4cw:1nSiRa:F5ouJE7M4ACERxjhvjJRVyZdNYP3HdV8Q9bMokvPkV4	2022-03-25 22:18:46.566199+05:30
rwiytzbobw73gwxelldz15f1witfe4vg	.eJxVjLEOwjAMRP8lM4rcqKYJIzvfENmJTQoolZp2Qvw7rdQBttO9d_c2kdalxLXJHMdsLsZ13px-W6b0lLqj_KB6n2ya6jKPbHfFHrTZ25TldT3cv4NCrWxr9HJWQRXuU2JAAoLMNISAkgQZlINCQKfK4qHrMbBzmtwWxfnBfL5okTkp:1oNcrd:YoDePl5J7O8VJr5OeVOiSMQpsi9bsjm8PqSYRnTAYD4	2022-08-29 21:52:53.781788+05:30
9f7bzrouvw6r9jplcq3rtqdjdkgjo14p	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nT0PY:LBXxUOyhbNUjR5LAcyULmhItL-d-PTctlRGvEbw3ovI	2022-03-26 17:29:52.895156+05:30
nyn4x0ejko6wl0himxpnv49m4pwe29vu	.eJxVjEEOwiAQRe_C2hBngAou3fcMZIBBqgaS0q6Md7dNutDtf-_9t_C0LsWvnWc_JXEVCE6cftdA8cl1R-lB9d5kbHWZpyB3RR60y7Elft0O9--gUC9bnR2oAYAtWKsYo1EXlTOw0w6DNSnZoBFiiKQRtWFNPJw30waTMTGJzxcYzThC:1oNd28:96u2ZAhHlo17kqRhOe7OmgU85jFUfh3Y4amad1f2lLc	2022-08-29 22:03:44.395006+05:30
sgk3478lsk5p020s7qevfadh37beh32l	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nTG7y:ke6ioypEGImYeTR6LJGueWPBj0kmVUWkYL5mCle5vq0	2022-03-27 10:16:46.750812+05:30
02u51z3s9sq095si6jin08exb7aw89em	.eJxVjDsOwjAQBe_iGln-xD9Kes5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4EzszpQQ7_a4J8JHbjugO7dY59rYuc-K7wg86-LVTfl4O9--gwqjf2gUt3WSMtGgTgpUlaEOSTKFSrECT0QLmTBa8Sxq10j4JP5niQyDU7P0BL8A4qg:1oNlZG:NugxBwtOUM67Zdcu7zRUhHgViPrmEHuZ8JIqrcnwIfQ	2022-08-30 07:10:30.748242+05:30
h2gkxv4i1dscvjf3brpgacqkc2u5t4ur	.eJxVjEEOwiAQRe_C2pAOgwy4dN8zEAqDVA1NSrsy3l1JutDdz38v7yV82Lfi98arn5O4CGVBnH7fKcQH147SPdTbIuNSt3WeZFfkQZscl8TP6-H-BUpopYeHqOAMVoNVZBASaI5OIznO6bsgUQ6IBjNhNMSOgrKDJSAi64wR7w__Xjbi:1oRtE0:_Hnhwzy2WKM9oXTOQuTbIcDjBO6avqEKfehNOgUhHIk	2022-09-10 16:09:36.976331+05:30
mmqgtg2dw521u8zt5bu9988w3d635plq	.eJxVjMsOwiAQRf-FtSG8QZfu-w0EZgapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2YVJdvrdcoIHtR3gPbVb59DbusyZ7wo_6OBTR3peD_fvoKZRvzUppzVqJdCAkygIgy7eiHDWQYAFmUOxWkkqDqwjYYItijxBKBK8y-z9Ac59N6k:1nTGAE:b7EWzLV5GNKfZTAqjfmJ0zSe_roxnvb-zQx-qzMJXDc	2022-03-27 10:19:06.771992+05:30
4ko2z5y40pekvq7o24w83bwv2b1gd51v	.eJxVjMsOwiAURP-FtSFAoL24dO83NPcBUjWQ9LFq_HfbpAtdzpwzs6kB16UM65ymYRR1Vc5ZdfltCfmV6oHkifXRNLe6TCPpQ9EnnfW9SXrfTvfvoOBc9jUARxNyh4aIJQewPWWSaAMi9OCjNwmsYc_ZGQ7Z7jlKCh0JiBOnPl8--jjL:1oNpUD:JtKFNODl_-dMbWH0iPWVO3TPKXfdC2GyKbogzSIHAHI	2022-08-30 11:21:33.496765+05:30
g5mmzkki654199ibtm5gq872n6do9tzd	.eJxVjEEOwiAQRe_C2hAGWpi6dO8ZyDADUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnBWjU6XdNxI887UjuNN1mzfO0LmPSu6IP2vR1lvy8HO7fQaVWv3XHwp5cKEZCkNIDgnd9SYyJIXgWcLYDGZCBaEBr0VNxYtmIR5ONen8API04Yw:1oQLQw:8ByWPDcAOB1yGks_0L3vhEgk94UgFMlW3p2RyAWWQ_U	2022-09-06 09:52:34.676785+05:30
naa61sttiqktc1rt6e81xlxxw38dt9m8	.eJxVjDsOwyAQBe9CHSGD-W3K9D4DWlgITiKQjF1FuXtsyUXSvpl5b-ZxW4vfelr8TOzKpJPs8rsGjM9UD0QPrPfGY6vrMgd-KPyknU-N0ut2un8HBXvZ6wyWImrIRkRthANBwQkI0SoFA2lFFu2OJdmsAC04hXmUYABHHQbDPl8tZTfd:1oRuhF:7ct0-iCDpcNA1CGUTP8opvW2cJLeiV0WUqLKVw6Sck4	2022-09-10 17:43:53.269646+05:30
4aixq4055hkrzhus5xbcyweq1xmxshwm	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nTefH:iceFXvfTcXdTYUTc5LrmB1nMjUnMSamL3mqDSAgt_2M	2022-03-28 12:28:47.677061+05:30
jed2vcm56vo2ojohvv0ly1shvxc55wsy	.eJxVjMsOwiAQRf-FtSEw5enSvd9ABhikaiAp7cr479qkC93ec859sYDbWsM2aAlzZmcGAOz0u0ZMD2o7yndst85Tb-syR74r_KCDX3um5-Vw_w4qjvqto0fh_CSdAKuILBijIWpFcioTeq-NyBKEAYKiUankikomoivFWI_I3h8AGzew:1oNvSw:LojErxG25nvAiE3TmR_I-Ijuk8N8hvll_M-ogH108AI	2022-08-30 17:44:38.339006+05:30
9y0i1cnhusboxm7pvzutr5pm5glefepw	.eJxVjMEOwiAQRP-FsyF2YaH16N1vILuwSNXQpLQn47_bJj3oaZJ5b-atAq1LCWuTOYxJXRSgVafflik-pe4oPajeJx2nuswj613RB236NiV5XQ_376BQK9s6ix2cxZxN8oOwkzN5zAzGASCwkdgbL4aiJECMxJ1wR7QlcY9i1OcLTS45ew:1oQNLl:tIUs-3ps2eVB0QbkKkWLGT8tTyIqqQVvHtO9vANb-mk	2022-09-06 11:55:21.981965+05:30
kq19j1hgy21zwwf7nbhfy996qht3by7e	.eJxVjDsOwyAQBe9CHSHA5pcyvc-AFtgNTiKQjF1FuXtsyUXSvpl5bxZgW0vYOi5hzuzKlBvY5XeNkJ5YD5QfUO-Np1bXZY78UPhJO59axtftdP8OCvSy1yKNqK2NpKJQwsbsEUkDSptBKi3RJuMS-ei82uFABomkkUMGNRJY9vkCTa45NA:1oSI6X:m7nMZ095amSUYrT3SGx09dLQJ2dkenGvjbMKjO59tFs	2022-09-11 18:43:33.642837+05:30
3bxtz7ex6xn0fkxanzv1txrd2t3ifaxt	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nTgDv:n08J5y1pCjXy6QMwLIX2I7a83l4cqxEvxJ7_lY0K3Fs	2022-03-28 14:08:39.682016+05:30
g34a3n714otnz2vhffjo49dxwj9xymb7	.eJxVjDEOwjAMRe-SGUWKnNY1IztniOzYoQXUSE07Ie4OlTrA-t97_-USb-uYtmZLmtSdXSR3-h2F88Pmneid51v1uc7rMonfFX_Q5q9V7Xk53L-Dkdv4rQXEFIfYlxyUsMvCaIwoHUUoA0QBJgRUCIUMchkKm1ofIsWOydz7Ay5AOPM:1oQNYE:fTklIyKdMbe-6eUD9EhZFu2AyuvNfqj7TumJLRfwQb0	2022-09-06 12:08:14.475819+05:30
xs80j1a0h13i1unu7iq7mhqx1ptqshvl	.eJxVjEEOwiAQRe_C2pBCBwou3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EW2oE4_a6E8cF1R-mO9dZkbHVdZpK7Ig_a5bUlfl4O9--gYC_f2oGFwdHEk2YcwaBiS9aiHzMm5zSPSRF4jDBosApzVt5YdoZQQwQQ7w8l0zgP:1oSINN:eOtrUGT_mhDVbKUSxFacmcOKVZlNjJ_eH5qleVEDrsk	2022-09-11 19:00:57.726797+05:30
15odrs7f1b1ejrsvl0buny7lgm4rd4p9	.eJxVjDsOwjAQBe_iGln-rD-ipOcM1q7XxgHkSHFSIe4OkVJA-2bmvUTCbW1pG2VJE4uz0A7E6XclzI_Sd8R37LdZ5rmvy0RyV-RBh7zOXJ6Xw_07aDjat_YAml2M5KIhRFM55MLWBVPIog9YwaoA0RhWjjMGW0Ok7IEZWKMS7w8x-ziR:1nTgy1:SDza5re7o3dLfCQVzjDGhONfOP-i2-5e8pCcxSi8DtE	2022-03-28 14:56:17.470864+05:30
4giyo0lnp34fcfocts11zy1na3wjbv8q	.eJxVjMsOwiAQRf-FtSE8BmhduvcbyDAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZnYYwVp981IT247Sjfsd1mSXNblynJXZEH7fI6Z35eDvfvoGKv31pZ8ImZjCdSqKkYLgwukEXQYQhmQKedUwhAMKbAY1HaErD2NifD4v0BNj04VA:1oNyIO:VfJojkXEhDaNZF_-TDn__3CvYqJpZNcKDGMjBCYX_zE	2022-08-30 20:45:56.131889+05:30
n9e5gg055feixuvk28uufm7358v35a6g	.eJxVjMsOwiAQRf-FtSEFOgzj0r3f0AwMSNXQpI-V8d-1SRe6veec-1IDb2sdtiXPwyjqrCyAOv2ukdMjtx3Jndtt0mlq6zxGvSv6oIu-TpKfl8P9O6i81G8dMhqJjsAHk7o-CjHZEiwZhCzkEDvHQCH0FgUieY9SCDNBIU7OqPcHEuI3iA:1oQNcF:izpKG1yDemlmK-huIQS1jPYfmwCDNC13_ctdDqILMG4	2022-09-06 12:12:23.38123+05:30
w6qh74ybojq03rksuxklxvqcbofeibcj	.eJxVjMEOwiAQRP-FsyGUsiz16L3fQBYWpGpoUtqT8d9tkx40mdO8N_MWnra1-K2lxU8srkI7EJffNlB8pnogflC9zzLOdV2mIA9FnrTJceb0up3u30GhVvY1QVZGsVacKWGnM9mIA3IfMKADwJiDGTpE14Oylg2kPRhNNpSTZvH5Ajg_OIE:1oSLnn:zgP-hdRkx-ETbjoDFx6Tu5zP28uPtl_a_473rwcwoCI	2022-09-11 22:40:27.207531+05:30
vzrib4satwkxsnt87c4e6h5tj7yrbcyc	.eJxVjDsOwjAQRO_iGln-rmJKes5grddeHECOFCcV4u5gKQWUM-_NvETEfatx72WNcxZn4Yw4_ZYJ6VHaIPmO7bZIWtq2zkkORR60y-uSy_NyuH8HFXv9ri0qZw0RgNbaeR3cxMlCIAVJA2vlyCD7CQyDJbbJkR_JE7DHwOL9AdrwN0I:1nTh6X:0-xrCmX2IcFv67cF7Ljj0rCJCt-XIXOSvSExGfU07TY	2022-03-28 15:05:05.899078+05:30
6imxli324z9v81t2zg5llgczn26560vm	.eJxVjEEOwiAQRe_C2pCBIqUu3XsGMsMMUjU0Ke3KeHfbpAvd_vfef6uI61Li2mSOI6uLstap0-9KmJ5Sd8QPrPdJp6ku80h6V_RBm75NLK_r4f4dFGxlq_su-GwSWejB55yymJwYSRwzALIJwEmc78BTMI5ABnGIQfiMmz2ozxdZmDnZ:1oOEDt:Wd4-aN-CTYqG1lGD5z9DwoyW9Hwq7Rl6TyepwpqHaOw	2022-08-31 13:46:21.489048+05:30
wu87md9vtt259pi1si3d5xdl4h0r3xsn	.eJxVjMsOwiAUBf-FtSFc6OXh0n2_gfCUqoGktCvjv0uTLnQ7Z-a8iXX7Vuze02qXSK6EoySXX-pdeKZ6TPHh6r3R0Oq2Lp4eCj3XTucW0-t2un8HxfUyatReMRGc5MCiVhkNz8p4kAK50h7MJMAghAg8yMSywgAYvZlGoQcmny8DtzdS:1oQOj4:B1hGFQQeMHVM7PAs-l5_qr21zjwfDbL1g2xqw_4bju8	2022-09-06 13:23:30.850835+05:30
ixa24wslq08vkam86hkyd0quqi89srkp	.eJxVjMEOgjAQRP-lZ9OUskupR-98A9ltF4uaNqFwMv67kHDQ48x7M2810ramcauyjHNUVwWoLr8lU3hKPkh8UL4XHUpel5n1oeiTVj2UKK_b6f4dJKppXwd0QL31fTt1nTXSSoPGEdjJI--RBKVj6z17wEBkYM_YWA52YnBOfb7zGTes:1oSTD0:CNcVK8WO4ytGlObqRkJ_HzPJEbeGv3K70QdQm5g-EvI	2022-09-12 06:34:58.741866+05:30
z8jdgs97tjdsvfa0xpiub94o1h62hadq	.eJxVjEEOgjAQRe_StWk6ZVqoS_ecoZmZjoIaSCisjHdXEha6_e-9_zKZtnXIW9Ulj8WcDaA5_Y5M8tBpJ-VO0222Mk_rMrLdFXvQavu56PNyuH8HA9XhWyNybEIqErqWk_McEnderggEMVEUjKqhKHUiPqYGAZxHT-wAoSmteX8A-Gs3aQ:1nTnAf:uqXoo8TnZRqPXUfDKF2oc32jDN2L0shpWTalpA0W8w0	2022-03-28 21:33:45.63265+05:30
qirqzfztm794yq3ffu4rntc4ho9thx2e	.eJxVjMsOwiAQRf-FtSEw5enSvd9ABhikaiAp7cr479qkC93ec859sYDbWsM2aAlzZmcGAOz0u0ZMD2o7yndst85Tb-syR74r_KCDX3um5-Vw_w4qjvqto0fh_CSdAKuILBijIWpFcioTeq-NyBKEAYKiUankikomoivFWI_I3h8AGzew:1oOF5C:PLdpI3mXE8bXgs9BScMV9QsMF7111PNYOoVQOiUzkAc	2022-08-31 14:41:26.77091+05:30
ck9l8qa32t38at2edejn9i59z0ep47pr	.eJxVjEEOwiAQAP_C2ZBCYQGP3vsGAssiVQNJaU_GvxuSHvQ6M5k38-HYiz86bX5N7MqkBXb5pTHgk-pQ6RHqvXFsdd_WyEfCT9v50hK9bmf7NyihlzF2wUAG5zAqPVFGoSxpnYxDCSlhhCkDaCPm2QC6LBURqdmQtNplEdjnCzFAODk:1oSUKQ:JrfwNK-XNnyLU7DaRXZdpRJZsePwsPNeBy6Z6Rz5U9A	2022-09-12 07:46:42.188452+05:30
c5gyrfld3nevtxn4a17ovr0rx8dx5wr9	.eJxVjEEOwiAQRe_C2hCgMKBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIitLXi9LsmpEdpO8p3bLdZ0tzWZUpyV-RBuxznXJ7Xw_07qNjrt8bsWHvjFA_kQ2CvXSpgGYtXDAMRkDWQCc5AJSmnNOrkwBsImAOweH8AOHI4cw:1nU17X:GZzMH-2FCuWGTD3oFMNGZoHnIxBEwB2EG5F6R-VIcIQ	2022-03-29 12:27:27.541874+05:30
z36stzg2jq292im8qd7h0rfhzgvkc2vr	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1oOFOi:nnlGNCxFoAqk3ZO0T57U__WRpS7AD1S2oYtkzs-0fd4	2022-08-31 15:01:36.976065+05:30
k3hy4r0vt7qemwrbrelhglrdibrl8vi3	.eJxVjMEOwiAQRP-FsyFllwr16N1vIAu72KopSWlPxn-XJj3oZQ5v3sxbBdrWMWxVljCxuihwVp1-aaT0lHmv-EHzvehU5nWZot4VfbRV3wrL63q4fwcj1bGtMUGPBrkX3zHkls4OElHQApFJjNmSUOPGQmfj4M-QMziPybA4Up8vLGw4Xg:1oSXIR:qswWqfZjXi0ef4c6yPd_rjaRzaIPXFbH5iPMQOOCzrM	2022-09-12 10:56:51.08056+05:30
k1jrxxasfu7xvow2x2d49vh5howyei5e	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1nUX7z:Lcg8QKI6_qR4FYhK9TB5TjH5X9tCioQerKd7TZlXSkM	2022-03-30 22:38:03.264085+05:30
zj52rbr2qkgqbund5jkluaz7596r2zix	.eJxVjDsOwjAQBe_iGln-YO-akj5nsNY_HEC2FCcV4u4QKQW0b2bei3na1uq3kRc_J3ZhShl2-l0DxUduO0p3arfOY2_rMge-K_ygg0895ef1cP8OKo36rV2iUiyBjhmlloDOKgQ6W0QoKoCWiJQVFQWQNBiJJhSpi7NCCOkce38AHuo3Pw:1oOSKl:idvsFd8zng6d1aBTluXBQVu4eYIrwHGIEpia8Y5_1Lc	2022-09-01 04:50:23.776854+05:30
mim5kybxy9yo84n8qgn2ck1a76rnjviy	.eJxVjEEOwiAQRe_C2hCgztBx6b5nIAMMUjVtUtqV8e7apAvd_vfef6nA21rD1mQJY1YX5XqvTr9r5PSQaUf5ztNt1mme1mWMelf0QZse5izP6-H-HVRu9VsLRJLOdjZagGI4I3PpraAQWCkkCRGIEiQiAy667A2VziY8o3fo1fsDPQM3-w:1oSYr0:YTCESjTY7VEEd1hQGSlM1jZg1mkYUxiYNqKLL9wvNlY	2022-09-12 12:36:38.046533+05:30
ffb2rap5kcqkhid6jyqn9hfpwugibmib	.eJxVjDsOwyAQRO9CHSEwLHhTpvcZrIWF4CQCyZ8qyt1jSy6SaqR5b-YtRtrWMm5LmseJxVVoheLy2waKz1QPxA-q9yZjq-s8BXko8qSLHBqn1-10_w4KLWVfQ4fKWsPco88EbIg9KIceqAM0Dm3gqJ0POTsFxu2BOidFWTFB6MXnCxU4OCI:1nUmjt:-UXKX9oyrWs_dhfyge02s9NZX1sCiA8HgtS39Oco5iM	2022-03-31 15:18:13.762962+05:30
tqvwmb0hzpjhs6zrxmjq5mzvne5ilnpx	.eJxVjEEOwiAQRe_C2hAGWgsu3fcMzTAzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlLVndfpdI9JDyo74juVWNdWyLnPUu6IP2vRYWZ7Xw_07yNjyt4YhOnYmDaE3Fr1Fg2CNT9yLJaIoRmjwwQC4QNj5joMLQIlTD50IqPcHJyk4WQ:1oOYmV:n9ohfQ8COzYOyjaHCbDqF32bDDBHq1Cg_SV7xkGAMiE	2022-09-01 11:43:27.888462+05:30
x6iymzqwkjutxezul6nlkzf5s91y5sfj	.eJxVjEEOwiAQRe_C2pDAUBhcuvcMZGAGqZo2Ke3KeHdt0oVu_3vvv1SibW1p67KkkdVZWUR1-l0zlYdMO-I7TbdZl3lalzHrXdEH7fo6szwvh_t30Ki3b-2QwEIEU1lckFIhFkMDIDsvHoCreFMqSY3ZsAPLIbsYEG1Emwej3h880jha:1oSb9b:vvETp02a9sqB8b9ubQu0bA6bhplSp6w9Wf61KSE-9M4	2022-09-12 15:03:59.20891+05:30
dcu96rniwnixf474ask21suepdvmy99q	.eJxVjEEOwiAQRe_C2hDAAVqX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gIba04_a4R04PrjuiO9dZkanVd5ih3RR60y6kRP6-H-3dQsJdvDeAVZe1JZYJoRlJuYMyk2dCQbLLOgdM5ZiDWbDGDZQZ39uRH4z2K9wdGPzjd:1nUtMK:jTqNzX70fMIC9_n4Wtsm-2ccICruQTy6_A85NxIBeA8	2022-03-31 22:22:20.856895+05:30
op026ul84n73b14uq58hgbvywgte8mxx	.eJxVjEEOwiAQRe_C2pDAUBhcuvcMZGAGqZo2Ke3KeHdt0oVu_3vvv1SibW1p67KkkdVZWUR1-l0zlYdMO-I7TbdZl3lalzHrXdEH7fo6szwvh_t30Ki3b-2QwEIEU1lckFIhFkMDIDsvHoCreFMqSY3ZsAPLIbsYEG1Emwej3h880jha:1oSdGe:QF1o8c3dF4YPcSBGqtxXbw5A3mgf2xb7vgrBnmzBuVg	2022-09-12 17:19:24.917917+05:30
86vlywq3bgg5m9m2b0w3kt8uts1ros3s	.eJxVjDkOwjAQAP_iGlm-N6akzxus9bE4gBwpTirE35GlFNDOjObNAh57DUcvW1gyuzJpHbv80ojpWdpQ-YHtvvK0tn1bIh8JP23n85rL63a2f4OKvY4xCE9WJUAVJ4uSZElCUnIRbNTCkTaYQYMistIUpcG4gpNzXhMqT-zzBShiOBA:1nVBUG:z2swMRLfmjv7JRNHUHQu2kCKcDBj2XsI3fvQwv2fgcI	2022-04-01 17:43:44.094903+05:30
wmb3awiz8ynl2vqajzvbidt9k52ahjvo	.eJxVjEEOwiAQRe_C2pDAUBhcuvcMZGAGqZo2Ke3KeHdt0oVu_3vvv1SibW1p67KkkdVZWUR1-l0zlYdMO-I7TbdZl3lalzHrXdEH7fo6szwvh_t30Ki3b-2QwEIEU1lckFIhFkMDIDsvHoCreFMqSY3ZsAPLIbsYEG1Emwej3h880jha:1oSdIH:_VwHlJ7vK6jyWKOtHIzkPjDZqTrWBMUqw_OHvoeAozY	2022-09-12 17:21:05.660341+05:30
ob7avr7xjw8pnulf97qa2mduomed6uz7	.eJxVjEEOwiAQRe_C2hCgMKBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIitLXi9LsmpEdpO8p3bLdZ0tzWZUpyV-RBuxznXJ7Xw_07qNjrt8bsWHvjFA_kQ2CvXSpgGYtXDAMRkDWQCc5AJSmnNOrkwBsImAOweH8AOHI4cw:1nVlkv:qwmzcIPItWAzY3Q73gPBdwmUVP6hJVAAqMmBXB8Yacw	2022-04-03 08:27:21.391531+05:30
o7jzqe81u9a8op37qi4dkvkhrq13jlb2	.eJxVjEEOwiAQRe_C2hBgGAGX7nsGwsBUqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xKuIijA_i9LtSyg9uOyr31G6zzHNbl4nkrsiDdjnMhZ_Xw_07qKnXbw22BA0qMXmN6IPyCllDZk6ABUhnZfHMwVuwxjmDgI5wJOdUsWYM4v0BDQ43KA:1oSdQ7:w-Ac5GGU2zJfm4hV4zWkmV1JuL2zSadZJFmLGvDppyc	2022-09-12 17:29:11.160764+05:30
hurqb0eulbuk1u627pq0lyzsd7n468lc	.eJxVjMEOgjAQRP-lZ9OUskupR-98A9ltF4uaNqFwMv67kHDQ48x7M2810ramcauyjHNUVwWoLr8lU3hKPkh8UL4XHUpel5n1oeiTVj2UKK_b6f4dJKppXwd0QL31fTt1nTXSSoPGEdjJI--RBKVj6z17wEBkYM_YWA52YnBOfb7zGTes:1nVo3Q:bxHGEFnG9qBfIeque1CoiwIMpncQVgrT5nu6Zb-J12c	2022-04-03 10:54:36.97135+05:30
yi40g1qov1n48payjzu4f7xl37bn28op	.eJxVjMsOwiAQRf-FtSFA6zDj0n2_oRkYkKqBpI-V8d-1SRe6veec-1Ijb2sZtyXN4yTqohwZdfpdA8dHqjuSO9db07HVdZ6C3hV90EUPTdLzerh_B4WX8q1JBFg6700fKICzZxttNpagJ0DnSVIKhIYoI2KKHNAheBM74wE4q_cHGcI3pg:1oSeYk:5R1P9l7VYfq4so3NTNCVRuEN052RBwQJzAjJjfA8en0	2022-09-12 18:42:10.556613+05:30
9dbtorpz1j29siqge32wueb7j97dth7z	.eJxVjEEOwiAQRe_C2hCgMKBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIitLXi9LsmpEdpO8p3bLdZ0tzWZUpyV-RBuxznXJ7Xw_07qNjrt8bsWHvjFA_kQ2CvXSpgGYtXDAMRkDWQCc5AJSmnNOrkwBsImAOweH8AOHI4cw:1nVrwJ:PYIaJIFpqhfNV16YBBxSV-K4Rsgc8jHkuYMtIwNB5Fc	2022-04-03 15:03:31.103237+05:30
bjes2b3r685pdj0ra63zkivh8kvi8xpo	.eJxVjDsOwjAQBe_iGll2_Kek5wyWd72LAyiW8qkQd4dIKaB9M_NeIpdtbXlbaM5jFWehXRCn3xUKPmjaUb2X6dYl9mmdR5C7Ig-6yGuv9Lwc7t9BK0v71owpKNDWKx2dizqpOLDHQpUpWV3BJ2cGcIageDaOiRIaJMvIMUAS7w8rOzjp:1nVsyW:9ht9jifV-ww2iopCmDdPv0BjpM02rm88L1lmCQTZAwM	2022-04-03 16:09:52.149385+05:30
p2v4g6z72gedazlcyvl8quztuhm6xhxh	.eJxVjDsOwjAQBe_iGll24l3WlPScwVr_cADZUpxUiLtDUApoZ-a9p3C8LsWtPc1uiuIkNJA4_FLP4Z7qpuKN67XJ0OoyT15uidxtl5cW0-O8t38HhXv5rDMQjCoPCDBqhSahTQxDDDrTlx0ze9KIylgdMRMpG1lRBlQcjBWvNwLoNzE:1nYR9d:2iW1YCmwkmxV4MR8QolKwq0sWwZUGCzL8GOv4ryRPJI	2022-04-10 17:03:53.018393+05:30
qblvjgj18iyiqjwz5t6l7iamwzl7qjyo	.eJxVjDsOwjAQBe_iGlnZ-E9JnzNYa--aBJAtxUmFuDuKlALaNzPvLSLu2xz3zmtcSFwFmCAuv2vC_OR6IHpgvTeZW93WJclDkSftcmrEr9vp_h3M2OejHnR2PKgAaHQaNbPOyiMpZyCQYvDFWiowQEnWFc8j-sDWALF2YSTx-QIv-DhO:1nZDC2:hRaCscDm_C6NgaNZqa4usqSe5A2VlyIzPjFTydrcYAQ	2022-04-12 20:21:34.286829+05:30
kmtmafoj1lgoaiecs56f8sxv2cdpbiqw	.eJxVjEEOgjAQRe_StWmmHTq0Lt17BjIMU4saSCisjHdXEha6_e-9_zIdb2vptqpLNw7mbByBOf2uPctDpx0Nd55us5V5Wpext7tiD1rtdR70eTncv4PCtXxrFoctBqceJETEHJFikkRNSNRqk6FBj5mduARAwiF5IWQCwCCazPsD-fU25w:1naVM1:J1RCD7Kp3sSmyz7PPSmudTPFSDIqkzZQNek5CbjbnSA	2022-04-16 09:57:13.363516+05:30
maqzxt00vm3o10e0jef9d3asvt71e2j0	.eJxVjEEOgjAQRe_StWk6ZVqoS_ecoZmZjoIaSCisjHdXEha6_e-9_zKZtnXIW9Ulj8WcDaA5_Y5M8tBpJ-VO0222Mk_rMrLdFXvQavu56PNyuH8HA9XhWyNybEIqErqWk_McEnderggEMVEUjKqhKHUiPqYGAZxHT-wAoSmteX8A-Gs3aQ:1naxLm:LLN-N5zVXTCgrAihXSQFEfVa8r_zqkD0BAlIVl71O3k	2022-04-17 15:50:50.764188+05:30
4or4vjw4srl544reey1soqmkrx6sp0mu	.eJxVjLEOAiEQBf-F2hBgBRZLe7-BAAtyaiA57irjvxuSK7R9M_PezId9q34fefULsQuTRrLT7xpDeuY2ET1Cu3eeetvWJfKp8IMOfuuUX9fD_TuoYdRZCxujcpmckUpjcYEQ4QxWyWiLQJkhB0zoSBNQUqKAguiEs7aQNsg-Xye_N_Y:1nb4Xl:GvAMmpjyzQMBPNmntYSpFbRcKGH6YqvWuVboXCr-Sw0	2022-04-17 23:31:41.198639+05:30
6aobvcxb1nsexg3775907m2fr0nvgsdv	.eJxVjDsOwjAQBe_iGll2_Kek5wyWd72LAyiW8qkQd4dIKaB9M_NeIpdtbXlbaM5jFWehXRCn3xUKPmjaUb2X6dYl9mmdR5C7Ig-6yGuv9Lwc7t9BK0v71owpKNDWKx2dizqpOLDHQpUpWV3BJ2cGcIageDaOiRIaJMvIMUAS7w8rOzjp:1nbNyi:nHcgnSP6RqfAV6tzW4F3fCiCLnHHo7zLprwAKTjcPqU	2022-04-18 20:16:48.48942+05:30
64yyzscxb4i20tpx01vl6hlwx6ny7vdv	.eJxVjEEOwiAQRe_C2hAQmIBL956BDMwgVQNJaVeNd9cmXej2v_f-JiKuS43r4DlOJC7CiNPvljA_ue2AHtjuXebelnlKclfkQYe8deLX9XD_DiqO-q0zJnABtWHrE4HTBEERMPtkVVFnj65ohFJIEVIJVCwhMoExSaMH8f4ACn45TQ:1nbO4U:BP11u69etXVUBlreIJgnJy-l8C9Nucc2KI1SOlNjvqE	2022-04-18 20:22:46.358904+05:30
1z9fuwwan16ojdy5agzvwr4h58wujdd9	.eJxVjLsKwzAMAP_FczGWI0WmY_d-g5H8aNKWBPKYQv-9GDK0691xh4myb0Pc17LEMZurAWRz-aUq6VWmpvJTpsds0zxty6i2Jfa0q73PubxvZ_s3GGQd2thDZQ1OEEiLh8wVpCqT77teMGTsJRGg61zwopQIA4FzhZWRIZnPFxhBN1w:1nbmJF:OX2G8hki0RzoH2I_eTdupOjxUNJDb6wK6-iO7-UPCrQ	2022-04-19 22:15:37.790075+05:30
3hptvr7y3rhv16y1r9mvlnrnrkwxwquw	.eJxVjEEOwiAQRe_C2hChQMGle89AZphBqgaS0q6Md7dNutDtf-_9t4iwLiWunec4kbgI5bQ4_a4I6cl1R_SAem8ytbrME8pdkQft8taIX9fD_Tso0MtWG3ZZofPKjABB40garc3ZJK3Z2UE5ROBsiXgI1mzo7L2HEAyFzJDF5ws6RTjl:1nbwUw:3WuHRUsYUGUdRN8QTibymGltF2VzzvDfmr42tSBA7Bw	2022-04-20 09:08:22.629963+05:30
ysjpinqj40uvmz9d0nt8b01jfjexbngt	.eJxVjEEOwiAQRe_C2hBgkIJL956BzDBUqgaS0q6Md7dNutDtf-_9t4i4LiWuPc9xYnER2hpx-l0J0zPXHfED673J1OoyTyR3RR60y1vj_Loe7t9BwV622iggfQatnWUDZEHRGLIBxQR-VBuwIeHgwYdkBzAKKbig0bPTHtGIzxf1kjb7:1nc6Tw:89QxSDYZELT2rsnUsphCm_BesIGfbZyczvcNVJ_gXXM	2022-04-20 19:48:00.889356+05:30
\.


--
-- Data for Name: orders_ordersmodel; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.orders_ordersmodel (id, status, link, quantity, charge, last_updated, order_placed, service_id, user_id, third_party_id, third_party_name, start_count, remains) FROM stdin;
19	Completed	https://instagram.com/_mr_nick_071_?utm_medium=copy_link	100	10	2022-01-18 16:17:07.325381+05:30	2022-01-18 11:59:18.669467+05:30	3	14	\N	\N	\N	\N
284	In progress	https://instagram.com/sa1r3ddy?utm_medium=copy_link	10000	400	2022-03-02 22:57:04.385661+05:30	2022-03-02 22:46:36.025529+05:30	73	102	\N	\N	\N	\N
357	Pending	https://instagram.com/harrraeh	1000	120	2022-03-25 11:07:28.002088+05:30	2022-03-25 11:07:28.002111+05:30	30	3	\N	\N	\N	\N
40	Completed	https://www.instagram.com/p/CY0Y7pnvYK0UndIIFXnEkbtC2sosG_LwVILQD40/?utm_medium=copy_link	500	40	2022-01-22 13:32:33.230482+05:30	2022-01-21 23:10:26.998295+05:30	5	14	\N	\N	\N	\N
20	Completed	https://instagram.com/suraj_king_3078?utm_medium=copy_link	1000	100	2022-01-18 19:02:35.737935+05:30	2022-01-18 16:29:16.338125+05:30	3	16	\N	\N	\N	\N
31	Cancelled	https://instagram.com/d.e.c.e.n.t_b.o.y__h.a.r.i?utm_medium=copy_link	1000	100	2022-01-21 11:43:35.22278+05:30	2022-01-21 11:32:35.524087+05:30	3	14	\N	\N	\N	\N
7	Completed	https://www.instagram.com/p/CYvEq9DPa7n/?utm_medium=copy_link	250	20	2022-01-17 14:08:54.95779+05:30	2022-01-17 12:39:30.757067+05:30	5	14	\N	\N	\N	\N
8	Completed	https://www.instagram.com/reel/CTXGaQ-o31J0uBpPcps51Bdtew-R8O6Kdc74Ls0/?utm_medium=copy_link	1000	20	2022-01-17 14:36:30.46362+05:30	2022-01-17 12:48:10.24693+05:30	4	15	\N	\N	\N	\N
9	Cancelled	https://www.instagram.com/abhishekrajput42097/	400	40	2022-01-17 15:49:55.231127+05:30	2022-01-17 15:48:36.157124+05:30	3	17	\N	\N	\N	\N
10	Completed	https://www.instagram.com/abhishekrajput42097/	200	20	2022-01-17 16:11:58.63028+05:30	2022-01-17 15:50:07.332074+05:30	3	17	\N	\N	\N	\N
11	Completed	https://instagram.com/mr_manideep_24?utm_medium=copy_link	300	30	2022-01-17 16:29:01.319275+05:30	2022-01-17 15:59:01.516233+05:30	3	14	\N	\N	\N	\N
12	Completed	https://instagram.com/suraj_king_3078?utm_medium=copy_link	20	2	2022-01-17 16:29:08.684084+05:30	2022-01-17 16:04:22.264538+05:30	3	16	\N	\N	\N	\N
32	Completed	https://instagram.com/d.e.c.e.n.t_b.o.y__h.a.r.i?utm_medium=copy_link	500	50	2022-01-21 17:03:58.095869+05:30	2022-01-21 13:58:56.802014+05:30	3	14	\N	\N	\N	\N
14	Completed	https://instagram.com/suraj_king_3078?utm_medium=copy_link	2000	200	2022-01-17 21:03:32.266569+05:30	2022-01-17 18:27:06.893596+05:30	3	16	\N	\N	\N	\N
15	Completed	https://instagram.com/_mr_nick_071_?utm_medium=copy_link	900	90	2022-01-17 21:03:39.939628+05:30	2022-01-17 19:49:03.971201+05:30	3	14	\N	\N	\N	\N
24	Cancelled	https://instagram.com/us_sonu_ca?utm_medium=copy_link	200	20	2022-01-19 13:34:24.925704+05:30	2022-01-19 13:08:22.489766+05:30	3	21	\N	\N	\N	\N
13	Completed	https://instagram.com/suraj_king_3078?utm_medium=copy_link	228	22.8	2022-01-17 21:12:52.975166+05:30	2022-01-17 18:18:15.397558+05:30	3	16	\N	\N	\N	\N
16	Completed	https://instagram.com/kishore_dhandru_?utm_medium=copy_link	500	50	2022-01-17 22:32:41.83946+05:30	2022-01-17 21:22:07.618523+05:30	3	14	\N	\N	\N	\N
25	Completed	https://instagram.com/us_sonu_ca?utm_medium=copy_link	200	20	2022-01-19 14:14:40.972587+05:30	2022-01-19 13:12:41.572568+05:30	3	21	\N	\N	\N	\N
17	Completed	https://instagram.com/urs____comrade?utm_medium=copy_link	450	45	2022-01-18 12:41:19.107701+05:30	2022-01-18 11:48:14.109861+05:30	3	14	\N	\N	\N	\N
18	Completed	https://instagram.com/_mr_nick_071_?utm_medium=copy_link	100	10	2022-01-18 13:51:50.931467+05:30	2022-01-18 11:56:35.452011+05:30	3	14	\N	\N	\N	\N
26	Completed	https://instagram.com/cheapest_instu_followers?utm_medium=copy_link	500	50	2022-01-19 14:14:51.998576+05:30	2022-01-19 13:37:24.024861+05:30	3	21	\N	\N	\N	\N
21	Completed	https://instagram.com/sunny_official___1?utm_medium=copy_link	500	65	2022-01-19 21:27:04.749539+05:30	2022-01-18 18:37:37.86832+05:30	30	14	\N	\N	\N	\N
33	Completed	https://instagram.com/pandu_0_15?utm_medium=copy_link	1000	100	2022-01-21 17:54:11.21936+05:30	2022-01-21 17:40:36.772413+05:30	3	14	\N	\N	\N	\N
27	Completed	https://instagram.com/_nick_name_sonu_?utm_medium=copy_link	1000	100	2022-01-19 23:50:49.027288+05:30	2022-01-19 21:04:09.735134+05:30	3	14	\N	\N	\N	\N
23	Completed	https://instagram.com/suraj_king_3078?utm_medium=copy_link	5000	500	2022-01-20 20:07:53.295938+05:30	2022-01-19 12:44:46.041297+05:30	3	16	\N	\N	\N	\N
28	Completed	https://instagram.com/perfect_clicks.01?utm_medium=copy_link	500	50	2022-01-20 20:10:28.299346+05:30	2022-01-20 14:43:39.12106+05:30	3	14	\N	\N	\N	\N
29	Completed	https://instagram.com/_error______xo?utm_medium=copy_link	1000	100	2022-01-20 20:10:47.70072+05:30	2022-01-20 17:57:46.817018+05:30	3	14	\N	\N	\N	\N
22	Completed	https://www.instagram.com/c_h_u_m_k_i_9/reel/CY5uC3tKp2V/?utm_medium=copy_link	1000	20	2022-01-20 20:18:50.374882+05:30	2022-01-19 12:43:57.092721+05:30	4	22	\N	\N	\N	\N
30	Completed	https://instagram.com/sunny_official___1?utm_medium=copy_link	100	10	2022-01-20 21:26:44.529056+05:30	2022-01-20 19:53:36.279427+05:30	3	14	\N	\N	\N	\N
44	Completed	https://instagram.com/pandu_0_15?utm_medium=copy_link	250	25	2022-01-23 18:40:54.306409+05:30	2022-01-23 12:23:45.155146+05:30	3	14	\N	\N	\N	\N
45	Completed	https://www.instagram.com/p/CSje_xNn39Q/?utm_medium=copy_link	250	20	2022-01-23 18:41:08.608637+05:30	2022-01-23 12:24:25.416371+05:30	5	14	\N	\N	\N	\N
38	Completed	https://www.instagram.com/p/CYxdL8_vUe5/?utm_medium=copy_link	500	40	2022-01-22 17:40:54.564005+05:30	2022-01-21 19:59:23.797747+05:30	5	14	\N	\N	\N	\N
35	Completed	https://instagram.com/srinivas_tammisetti?utm_medium=copy_link	1100	110	2022-01-21 21:27:58.353483+05:30	2022-01-21 19:56:39.60902+05:30	3	14	\N	\N	\N	\N
39	Completed	https://instagram.com/mr_sasi1911?utm_medium=copy_link	100	10	2022-01-22 07:39:18.978302+05:30	2022-01-21 22:51:47.152776+05:30	3	14	\N	\N	\N	\N
49	Completed	https://www.instagram.com/__sasi__smart__7/p/CZGjsqmP2HR/?utm_medium=copy_link	250	20	2022-01-24 12:22:42.274229+05:30	2022-01-24 12:07:23.836029+05:30	5	14	\N	\N	\N	\N
36	Completed	https://www.instagram.com/p/CY5LWVKPSdV/?utm_medium=copy_link	500	40	2022-01-22 17:41:03.108953+05:30	2022-01-21 19:58:02.253361+05:30	5	14	\N	\N	\N	\N
37	Completed	https://www.instagram.com/p/CY0BW5QPDl-/?utm_medium=copy_link	500	40	2022-01-22 17:41:18.131774+05:30	2022-01-21 19:58:52.048084+05:30	5	14	\N	\N	\N	\N
46	Completed	https://instagram.com/srinivas_tammisetti?utm_medium=copy_link	300	30	2022-01-23 20:48:02.04537+05:30	2022-01-23 20:07:21.939023+05:30	3	14	\N	\N	\N	\N
42	Completed	https://instagram.com/broken__life__120?utm_medium=copy_link	900	90	2022-01-22 20:51:04.9756+05:30	2022-01-22 19:50:47.720576+05:30	3	14	\N	\N	\N	\N
43	Completed	https://instagram.com/_error______xo?utm_medium=copy_link	210	21	2022-01-22 23:06:24.490456+05:30	2022-01-22 21:42:53.642393+05:30	3	14	\N	\N	\N	\N
48	Completed	https://www.instagram.com/reel/CT0tO-8pCKs/?utm_medium=copy_link	1000	10	2022-01-24 10:41:01.369129+05:30	2022-01-24 06:04:44.390938+05:30	4	35	\N	\N	\N	\N
52	Completed	https://www.instagram.com/reel/CT0tO-8pCKs/?utm_medium=copy_link	1000	10	2022-01-24 16:37:51.332809+05:30	2022-01-24 16:19:20.601066+05:30	4	35	\N	\N	\N	\N
59	Completed	https://instagram.com/sunny_official___1?utm_medium=copy_link	500	65	2022-01-25 20:08:25.112619+05:30	2022-01-25 13:37:46.443554+05:30	1	14	\N	\N	\N	\N
60	Completed	https://www.instagram.com/reel/CZJ7nMkFBev/?utm_medium=copy_link	1000	10	2022-01-25 20:39:04.528693+05:30	2022-01-25 19:20:41.557625+05:30	4	22	\N	\N	\N	\N
61	Completed	https://www.instagram.com/gangwaar_307/reel/CZKJw3ShWMd/?utm_medium=copy_link	1000	10	2022-01-25 21:42:27.082504+05:30	2022-01-25 21:34:56.030195+05:30	4	35	\N	\N	\N	\N
62	Completed	https://www.instagram.com/p/B8l4mQQA571/?utm_source=ig_web_copy_link	50	4	2022-01-25 22:33:54.639545+05:30	2022-01-25 21:44:27.172322+05:30	5	1	6301220	Sneaker	\N	\N
64	Completed	https://www.instagram.com/reel/CZL3f0EF5yZ/?utm_medium=copy_link	300	18	2022-01-26 16:58:15.41014+05:30	2022-01-26 13:21:03.321786+05:30	31	3	6309684	Sneaker	\N	\N
63	Completed	https://www.instagram.com/reel/CZL3f0EF5yZ/?utm_medium=copy_link	5000	40	2022-01-26 16:58:14.790035+05:30	2022-01-26 13:19:44.763574+05:30	34	3	6309670	Sneaker	\N	\N
89	Completed	https://www.instagram.com/reel/CZXGHlthKh_/?utm_medium=copy_link	1200	12	2022-01-31 05:28:10.267469+05:30	2022-01-31 01:26:16.534458+05:30	4	35	6380686	Sneaker	\N	\N
88	Processing	https://www.instagram.com/reel/CZXGHlthKh_/?utm_medium=copy_link	100	8	2022-01-31 16:09:53.765274+05:30	2022-01-31 01:21:27.217292+05:30	3	35	\N	\N	\N	\N
66	Completed	https://www.instagram.com/reel/CZL3f0EF5yZ/?utm_medium=copy_link	500	30	2022-01-26 17:58:53.117715+05:30	2022-01-26 16:58:51.933985+05:30	31	3	6312398	Sneaker	\N	\N
65	Completed	https://www.instagram.com/reel/CZL3f0EF5yZ/?utm_medium=copy_link	5000	40	2022-01-26 18:14:17.41724+05:30	2022-01-26 16:57:59.33678+05:30	34	3	6312389	Sneaker	\N	\N
74	Completed	https://www.instagram.com/reel/CUTmfXeolf0/?utm_medium=copy_link	2000	20	2022-01-27 18:27:14.353409+05:30	2022-01-27 15:03:42.620602+05:30	4	35	6326393	Sneaker	\N	\N
69	Cancelled	https://www.instagram.com/reel/CZL3f0EF5yZ/?utm_medium=copy_link	200	12	2022-01-26 20:41:40.442309+05:30	2022-01-26 20:07:19.393262+05:30	31	3	6314957	Sneaker	\N	\N
82	Completed	https://www.instagram.com/reel/CZMqlLeBzLh/?utm_medium=copy_link	1000	10	2022-01-29 20:01:53.809477+05:30	2022-01-29 16:56:33.276277+05:30	4	35	6358516	Sneaker	\N	\N
90	In progress	https://instagram.com/__h.e.a.r.t_t.ic.k.e.r__?utm_medium=copy_link	500	65	2022-01-31 22:08:26.320331+05:30	2022-01-31 22:00:36.851062+05:30	1	14	\N	\N	\N	\N
92	Completed	https://www.instagram.com/p/B-Y_XmsnOdP/?utm_medium=copy_link	500	30	2022-02-22 17:59:51.001052+05:30	2022-02-01 13:13:29.449573+05:30	31	42	6403389	Sneaker	214	\N
78	Completed	https://www.instagram.com/reel/CZKNwuoLFeT/?utm_medium=copy_link	500	5	2022-01-28 12:26:41.677121+05:30	2022-01-28 11:00:34.039154+05:30	4	45	6338528	Sneaker	\N	\N
79	Completed	https://instagram.com/mr._avinash._naidu?utm_medium=copy_link	500	65	2022-01-29 09:18:58.821776+05:30	2022-01-28 20:35:27.373829+05:30	1	14	\N	\N	\N	\N
70	Completed	https://www.instagram.com/punam_ramawat_35/reel/CZMbheuIfNz/?utm_medium=copy_link	200	16	2022-01-27 12:27:08.551912+05:30	2022-01-26 21:05:39.712759+05:30	5	1	6315768	Sneaker	\N	\N
71	Completed	https://www.instagram.com/reel/CZL3f0EF5yZ/?utm_medium=copy_link	9000	72	2022-01-27 12:27:09.055964+05:30	2022-01-26 21:06:48.386104+05:30	34	1	6315784	Sneaker	\N	\N
72	Completed	https://www.instagram.com/reel/CZL3f0EF5yZ/?utm_medium=copy_link	200	16	2022-01-27 12:27:09.328432+05:30	2022-01-26 21:07:34.515705+05:30	5	1	6315799	Sneaker	\N	\N
80	Processing	https://www.instagram.com/reel/CZKNwuoLFeT/?utm_medium=copy_link	500	5	2022-01-29 11:49:06.937628+05:30	2022-01-29 11:49:06.420182+05:30	4	45	6354526	Sneaker	\N	\N
73	Completed	https://instagram.com/appa_love_u_1?utm_medium=copy_link	200	20	2022-01-27 14:43:44.55444+05:30	2022-01-27 14:06:17.728124+05:30	30	41	\N	\N	\N	\N
75	Completed	https://www.instagram.com/reel/CVIJGCboOtA/?utm_medium=copy_link	2000	20	2022-01-29 15:21:00.108568+05:30	2022-01-27 18:55:00.479927+05:30	4	35	6329306	Sneaker	\N	\N
76	Completed	https://www.instagram.com/reel/CZLNxL3hk_s/?utm_medium=copy_link	1000	10	2022-01-29 15:21:00.60792+05:30	2022-01-27 19:03:03.1766+05:30	4	35	6329465	Sneaker	\N	\N
85	Completed	https://www.instagram.com/p/CZE6PZQvyfc/?utm_medium=copy_link	1000	60	2022-02-22 17:59:51.4091+05:30	2022-01-29 20:44:03.247025+05:30	31	42	6361650	Sneaker	86	\N
93	Completed	https://www.instagram.com/p/B-4R-nen_IL/?utm_medium=copy_link	500	30	2022-02-22 17:59:52.181212+05:30	2022-02-01 13:14:49.440798+05:30	31	42	6403410	Sneaker	197	\N
94	Completed	https://www.instagram.com/p/CA69j9knpXV/?utm_medium=copy_link	500	30	2022-02-22 17:59:52.955895+05:30	2022-02-01 13:16:14.809518+05:30	31	42	6403433	Sneaker	187	\N
77	Completed	https://www.instagram.com/p/CXfS2TtJYqg/?utm_medium=copy_link	50	3	2022-01-28 09:55:04.956121+05:30	2022-01-27 19:09:22.406356+05:30	31	44	6329541	Sneaker	\N	\N
86	Completed	https://instagram.com/_praneeth__kumar__?utm_medium=copy_link	500	65	2022-01-30 10:14:58.847552+05:30	2022-01-29 22:11:09.750061+05:30	1	14	\N	\N	\N	\N
87	Completed	https://www.instagram.com/reel/CZVjP1Rh-60/?utm_medium=copy_link	1000	10	2022-01-30 22:15:58.301886+05:30	2022-01-30 08:20:21.877193+05:30	4	35	6367447	Sneaker	\N	\N
81	Completed	https://www.instagram.com/reel/CZTm-Ozhv-l/?utm_medium=copy_link	1000	10	2022-01-29 16:43:07.494284+05:30	2022-01-29 15:21:35.804298+05:30	4	35	6357355	Sneaker	\N	\N
95	Completed	https://www.instagram.com/p/CK1ezels58F/?utm_medium=copy_link	500	30	2022-02-22 17:59:53.736072+05:30	2022-02-01 13:17:12.30804+05:30	31	42	6403445	Sneaker	163	\N
99	Completed	https://www.instagram.com/p/CPqCryhDTEC/?utm_medium=copy_link	500	30	2022-02-22 17:59:54.498741+05:30	2022-02-01 13:27:42.843464+05:30	31	42	6403599	Sneaker	146	\N
96	Completed	https://www.instagram.com/p/CMHkTRwsrG1/?utm_medium=copy_link	500	30	2022-02-22 17:59:54.908858+05:30	2022-02-01 13:20:28.531505+05:30	31	42	6403488	Sneaker	161	\N
97	Completed	https://www.instagram.com/p/CMZmTmEsyyO/?utm_medium=copy_link	500	30	2022-02-22 17:59:55.647463+05:30	2022-02-01 13:23:42.269396+05:30	31	42	6403536	Sneaker	177	\N
98	Completed	https://www.instagram.com/p/CPDFtEtstoy/?utm_medium=copy_link	500	30	2022-02-22 17:59:56.080165+05:30	2022-02-01 13:25:54.908643+05:30	31	42	6403574	Sneaker	157	\N
100	Completed	https://www.instagram.com/p/CUpCLjOP_fN/?utm_medium=copy_link	500	30	2022-02-22 17:59:56.537826+05:30	2022-02-01 13:28:23.07919+05:30	31	42	6403610	Sneaker	88	\N
101	Completed	https://www.instagram.com/p/CWC0cL3MT37/?utm_medium=copy_link	500	30	2022-02-22 17:59:56.953589+05:30	2022-02-01 13:29:00.901288+05:30	31	42	6403618	Sneaker	101	\N
102	Completed	https://www.instagram.com/reel/CYgoKUcBnTd/?utm_medium=copy_link	500	30	2022-02-22 17:59:57.748792+05:30	2022-02-01 13:29:57.107268+05:30	31	42	6403634	Sneaker	87	\N
104	Completed	https://www.instagram.com/p/CZg5IKcJ4bI/?utm_medium=copy_link	100	6	2022-02-22 17:59:58.176092+05:30	2022-02-03 17:26:27.603747+05:30	31	42	6441004	Sneaker	3	\N
103	In progress	https://instagram.com/khushi_2008_sharma?utm_medium=copy_link	1000	80	2022-02-03 12:00:19.116534+05:30	2022-02-03 10:33:17.685148+05:30	3	44	\N	\N	\N	\N
106	Completed	https://www.instagram.com/p/CZg5IKcJ4bI/?utm_medium=copy_link	100	6	2022-02-22 17:59:58.597162+05:30	2022-02-03 18:49:16.716259+05:30	31	42	6442094	Sneaker	120	\N
107	Completed	https://www.instagram.com/p/CI1HnEil7Gc/?utm_medium=copy_link	200	12	2022-02-22 17:59:59.34512+05:30	2022-02-03 19:28:23.297604+05:30	31	42	6442627	Sneaker	116	\N
105	Completed	https://instagram.com/preet____ak_47?utm_medium=copy_link	100	8	2022-02-03 19:26:18.292722+05:30	2022-02-03 18:42:47.698128+05:30	3	42	\N	\N	\N	\N
110	Completed	https://instagram.com/prince_vicky_2345?utm_medium=copy_link	100	13	2022-02-22 18:00:00.007795+05:30	2022-02-03 21:29:19.559272+05:30	1	42	253093	sasta	107	\N
293	Completed	https://instagram.com/_oye__rocky__?utm_medium=copy_link	1000	35	2022-03-05 08:20:45.029855+05:30	2022-03-05 00:22:53.737182+05:30	46	14	129137	sasta	1928	\N
109	Completed	https://instagram.com/odia.toka.papun?utm_medium=copy_link	200	26	2022-02-06 20:07:13.216797+05:30	2022-02-03 20:05:52.851786+05:30	1	3	252903	sasta	2617	\N
91	Completed	https://www.instagram.com/p/B-Y_XmsnOdP/?utm_medium=copy_link	500	30	2022-02-22 17:59:50.203194+05:30	2022-02-01 13:13:28.436506+05:30	31	42	6403388	Sneaker	214	\N
111	Completed	https://instagram.com/kanchii_5_9?utm_medium=copy_link	100	13	2022-02-22 18:00:00.581841+05:30	2022-02-03 23:28:42.303406+05:30	1	42	253336	sasta	3446	\N
112	Completed	https://instagram.com/kanchii_5_9?utm_medium=copy_link	1000	130	2022-02-22 18:00:01.155173+05:30	2022-02-04 00:07:42.200577+05:30	1	42	253390	sasta	3549	\N
115	Completed	https://instagram.com/im_prince_dass_?utm_medium=copy_link	100	13	2022-02-22 18:00:02.848458+05:30	2022-02-05 22:38:36.112157+05:30	1	42	256279	sasta	1208	\N
116	Canceled	https://instagram.com/killer_boy_kumar_2002_april_14?utm_medium=copy_link	100	13	2022-02-22 18:00:03.430568+05:30	2022-02-05 22:50:34.293869+05:30	1	42	256303	sasta	-1	\N
120	Completed	https://instagram.com/hitech_city_ka_hero?utm_medium=copy_link	100	13	2022-02-22 18:00:04.044707+05:30	2022-02-06 15:02:50.481317+05:30	1	42	257238	sasta	1119	\N
139	Completed	https://www.instagram.com/tv/CZpDyb-Kfx6/?utm_medium=copy_link	1000	10	2022-02-07 16:11:35.964871+05:30	2022-02-07 16:04:27.624439+05:30	4	49	6502435	Sneaker	162	\N
146	Canceled	https://www.instagram.com/p/CYKHeV3v9LuR7yHVEBtmZuObGJeOKuvoxtz44A0/?utm_medium=copy_link	500	9	2022-02-10 19:27:42.587276+05:30	2022-02-10 17:12:31.425895+05:30	61	14	264375	sasta	\N	\N
119	Pending	https://t.me/freefollowerslikeshare	100	15	2022-02-06 14:28:37.517232+05:30	2022-02-06 14:28:37.517253+05:30	7	49	\N	\N	\N	\N
117	Completed	https://www.instagram.com/tv/CZi8GotjMwR/?utm_source=ig_web_copy_link	500	30	2022-02-06 14:31:59.236909+05:30	2022-02-06 13:05:37.755852+05:30	31	49	6484611	Sneaker	18	\N
121	Completed	https://instagram.com/prince_vicky_2345?utm_medium=copy_link	100	13	2022-02-22 18:00:04.624743+05:30	2022-02-06 15:11:12.627337+05:30	1	42	257249	sasta	211	\N
123	Canceled	https://instagram.com/killer_boy_kumar_2002_april_14?utm_medium=copy_link	100	13	2022-02-22 18:00:05.20828+05:30	2022-02-06 18:39:52.478521+05:30	1	42	257526	sasta	-1	\N
122	In progress	https://instagram.com/prince_vicky_2345?utm_medium=copy_link	100	13	2022-02-06 15:27:45.563414+05:30	2022-02-06 15:21:40.851253+05:30	1	42	\N	\N	\N	\N
126	Completed	https://instagram.com/_ramesh_uk_01_?utm_medium=copy_link	100	13	2022-02-22 18:00:05.779846+05:30	2022-02-06 22:52:50.84834+05:30	1	42	257977	sasta	427	\N
108	Completed	https://www.instagram.com/p/CZhJEeEhEGz/?utm_medium=copy_link	100	6	2022-02-06 20:07:12.494888+05:30	2022-02-03 19:41:22.824932+05:30	31	3	6442815	Sneaker	11	\N
124	In progress	https://instagram.com/its_mr_rahul_8824?utm_medium=copy_link	100	8	2022-02-06 20:30:59.975204+05:30	2022-02-06 20:28:51.822038+05:30	3	49	\N	\N	\N	\N
125	In progress	https://instagram.com/ginni00336?utm_medium=copy_link	500	40	2022-02-06 22:14:26.987901+05:30	2022-02-06 21:58:01.83974+05:30	3	49	\N	\N	\N	\N
128	Completed	https://instagram.com/sahil.khatri.716533?utm_medium=copy_link	100	13	2022-02-22 18:00:06.354064+05:30	2022-02-06 23:13:30.069332+05:30	1	42	258011	sasta	1088	\N
129	Completed	https://instagram.com/m_malik_officiel?utm_medium=copy_link	1000	130	2022-02-22 18:00:06.927039+05:30	2022-02-07 01:17:11.547799+05:30	1	42	258194	sasta	3408	\N
127	In progress	https://instagram.com/_ramesh_uk_01_?utm_medium=copy_link	1000	130	2022-02-06 23:35:09.659112+05:30	2022-02-06 23:04:52.435716+05:30	1	42	\N	\N	\N	\N
288	In progress	https://instagram.com/zhigh_bgmi?utm_medium=copy_link	5000	200	2022-03-03 15:05:21.473798+05:30	2022-03-03 14:27:31.474497+05:30	73	102	\N	\N	\N	\N
130	Pending	https://instagram.com/rajpoot_king666?utm_medium=copy_link	20	1.6	2022-02-07 13:46:24.340605+05:30	2022-02-07 13:46:24.340628+05:30	3	49	\N	\N	\N	\N
134	Completed	https://www.instagram.com/p/CZhd3-uPHjO/?utm_medium=copy_link	50	3	2022-02-07 15:40:15.771574+05:30	2022-02-07 15:16:16.120476+05:30	31	49	6501864	Sneaker	19	\N
131	Completed	https://instagram.com/rajpoot_king666?utm_medium=copy_link	20	2.6	2022-02-07 14:58:29.638641+05:30	2022-02-07 13:55:32.290355+05:30	1	49	258858	sasta	462	\N
132	Completed	https://www.instagram.com/p/CRkrhEaDcNM/?utm_medium=copy_link	100	6	2022-02-07 14:58:30.322844+05:30	2022-02-07 13:57:53.119021+05:30	31	49	6500932	Sneaker	173	\N
138	Completed	https://www.instagram.com/reel/CZnZ3X5q7CA/?utm_medium=copy_link	100	6	2022-02-07 20:07:54.317756+05:30	2022-02-07 15:56:20.646547+05:30	31	49	6502355	Sneaker	34	\N
140	Completed	https://www.instagram.com/tv/CZUjiJFqmd3/?utm_medium=copy_link	1000	10	2022-02-07 20:07:54.591008+05:30	2022-02-07 16:11:25.251559+05:30	4	49	6502530	Sneaker	272	\N
141	In progress	https://www.instagram.com/reel/CXYE_y0rQDj/?utm_medium=copy_link	1500	15	2022-02-07 20:45:32.525214+05:30	2022-02-07 20:05:20.354699+05:30	4	49	6505803	Sneaker	0	\N
142	Pending	https://instagram.com/babby_bold_18?utm_medium=copy_link	100	3.5	2022-02-09 17:13:03.877581+05:30	2022-02-09 17:13:03.877602+05:30	46	49	\N	\N	\N	\N
133	Completed	https://instagram.com/its_mr_rahul_8824?utm_medium=copy_link	300	39	2022-02-07 15:31:01.354343+05:30	2022-02-07 14:57:51.035812+05:30	1	49	258912	sasta	1622	\N
135	Completed	https://www.instagram.com/p/CW6Bf3lPC_2/?utm_medium=copy_link	100	6	2022-02-07 15:56:29.418236+05:30	2022-02-07 15:30:56.889686+05:30	31	49	6502027	Sneaker	64	\N
136	Completed	https://www.instagram.com/p/CZB1nJrPIkH/?utm_medium=copy_link	300	18	2022-02-07 15:56:30.33001+05:30	2022-02-07 15:40:07.976567+05:30	31	49	6502151	Sneaker	54	\N
149	In progress	https://instagram.com/dhindsahere?utm_medium=copy_link	240	99.6	2022-02-10 19:55:32.771911+05:30	2022-02-10 19:54:58.444685+05:30	65	63	6551711	Sneaker	\N	\N
137	Completed	https://www.instagram.com/tv/CZpDyb-Kfx6/?utm_medium=copy_link	500	30	2022-02-07 16:11:34.344256+05:30	2022-02-07 15:48:16.856471+05:30	31	49	6502253	Sneaker	39	\N
147	Cancelled	https://instagram.com/dhindsahere?utm_medium=copy_link	1000	180	2022-02-10 19:03:51.96626+05:30	2022-02-10 18:48:21.604202+05:30	35	63	\N	\N	\N	\N
144	Completed	https://www.instagram.com/p/CZmo4Aovd1a/?utm_medium=copy_link	250	4.5	2022-02-10 19:27:41.015444+05:30	2022-02-10 17:07:56.543716+05:30	61	14	264368	sasta	119	\N
145	Completed	https://www.instagram.com/p/CZn_2wOv41w/?utm_medium=copy_link	250	4.5	2022-02-10 19:27:41.801557+05:30	2022-02-10 17:09:11.761704+05:30	61	14	264369	sasta	88	\N
150	Processing	https://www.instagram.com/reel/CZrIsbaqimE/?utm_medium=copy_link	13400	80.4	2022-02-10 20:01:33.607447+05:30	2022-02-10 20:01:32.83052+05:30	60	63	264672	sasta	\N	\N
153	In progress	https://instagram.com/prince_vicky_2345?utm_medium=copy_link	20	2.7	2022-02-10 22:36:26.002736+05:30	2022-02-10 22:35:20.776758+05:30	39	70	\N	\N	\N	\N
151	In progress	https://www.instagram.com/drsharat_maxface/	800	240	2022-02-10 22:21:51.770824+05:30	2022-02-10 20:53:45.866481+05:30	41	61	\N	\N	\N	\N
148	Completed	https://www.instagram.com/reel/CZxyoMXh3E8/?utm_medium=copy_link	10000	100	2022-02-10 22:29:27.720475+05:30	2022-02-10 18:54:15.175349+05:30	4	3	6550932	Sneaker	13608	\N
152	Completed	https://instagram.com/manish_palsaniya_barwali_077?utm_medium=copy_link	100	12.5	2022-02-10 22:29:28.554284+05:30	2022-02-10 21:58:34.971751+05:30	38	3	265049	sasta	1025	\N
154	In progress	https://instagram.com/prince_vicky_2345?utm_medium=copy_link	150	20.25	2022-02-10 22:49:20.371835+05:30	2022-02-10 22:45:47.347988+05:30	39	70	\N	\N	\N	\N
155	Processing	https://instagram.com/prince_vicky_2345?utm_medium=copy_link	50	6.75	2022-02-10 23:05:35.758964+05:30	2022-02-10 22:54:21.465678+05:30	39	70	\N	\N	\N	\N
143	In progress	https://instagram.com/dayakar_143_?utm_medium=copy_link	500	17.5	2022-02-13 00:49:40.86631+05:30	2022-02-10 17:05:50.037169+05:30	46	14	\N	\N	\N	\N
156	Completed	https://instagram.com/prince_vicky_2345?utm_medium=copy_link	60	7.5	2022-02-11 21:24:25.494911+05:30	2022-02-10 23:06:15.118347+05:30	38	3	265166	sasta	438	\N
113	Completed	https://www.instagram.com/p/CZjqPphPaiG/?utm_medium=copy_link	500	30	2022-02-22 18:00:01.698398+05:30	2022-02-04 19:06:04.23248+05:30	31	42	6458093	Sneaker	2	\N
114	Completed	https://instagram.com/sheik_zeeshu?utm_medium=copy_link	100	13	2022-02-22 18:00:02.272406+05:30	2022-02-05 22:22:59.100808+05:30	1	42	256249	sasta	479	\N
157	Completed	https://www.instagram.com/tv/CZ1v1gDoQbn/?utm_medium=copy_link	550	6.6	2022-02-11 21:24:26.121844+05:30	2022-02-11 20:45:17.819095+05:30	63	3	266396	sasta	19	\N
167	Completed	https://instagram.com/gokul_achuz_?utm_medium=copy_link	50	6	2022-02-16 19:34:13.188846+05:30	2022-02-15 10:40:20.840039+05:30	30	90	271175	sasta	1292	\N
158	Cancelled	https://www.instagram.com/tv/CZ1v1gDoQbn/?utm_medium=copy_link	1100	11	2022-02-12 13:25:22.774927+05:30	2022-02-11 21:24:54.558063+05:30	4	3	6568279	Sneaker	\N	\N
168	Completed	https://instagram.com/adhiithyan_adhi?utm_medium=copy_link	50	6	2022-02-16 19:34:13.762544+05:30	2022-02-15 10:46:22.947021+05:30	30	90	271189	sasta	167	\N
169	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	200	24	2022-02-16 19:34:14.335622+05:30	2022-02-15 11:49:26.053671+05:30	30	90	271292	sasta	2451	\N
176	Pending	https://instagram.com/r_e_n_j_i_t_h__a_c_h_u_z718?utm_medium=copy_link	300	37.5	2022-02-15 16:57:18.720617+05:30	2022-02-15 16:57:18.720636+05:30	38	90	\N	\N	\N	\N
171	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	100	41.5	2022-02-16 19:34:14.891549+05:30	2022-02-15 12:31:47.861092+05:30	65	90	6622961	Sneaker	2653	\N
162	In progress	https://instagram.com/__sasi__smart__7?utm_medium=copy_link	250	8.75	2022-02-13 14:21:42.898396+05:30	2022-02-13 09:45:54.714577+05:30	46	14	\N	\N	\N	\N
160	Completed	https://www.instagram.com/reel/CZ4H9-eg8pQ/?utm_medium=copy_link	200	3.2	2022-02-14 20:19:08.603743+05:30	2022-02-13 03:55:55.771273+05:30	61	3	268007	sasta	114	\N
161	Completed	https://www.instagram.com/reel/CZ4H9-eg8pQ/?utm_medium=copy_link	2000	20	2022-02-14 20:19:09.40634+05:30	2022-02-13 03:56:21.006573+05:30	4	3	6587024	Sneaker	263	\N
178	Pending	https://instagram.com/r_e_n_j_i_t_h__a_c_h_u_z718?utm_medium=copy_link	100	12.5	2022-02-15 17:24:03.854384+05:30	2022-02-15 17:24:03.854406+05:30	38	90	\N	\N	\N	\N
186	Completed	https://instagram.com/_mr_red_bull_93_?utm_medium=copy_link	50	6	2022-02-15 19:03:33.460053+05:30	2022-02-15 18:18:40.657754+05:30	30	90	\N	\N	\N	\N
172	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	100	41.5	2022-02-16 19:34:15.388769+05:30	2022-02-15 12:32:40.215815+05:30	65	90	6622971	Sneaker	2764	\N
188	Completed	https://www.instagram.com/p/CZ__PgTPdfx/?utm_medium=copy_link	1000	38	2022-02-16 19:34:15.984547+05:30	2022-02-15 19:12:36.800716+05:30	5	90	271984	sasta	1072	\N
189	Completed	https://www.instagram.com/p/CZ__PgTPdfx/?utm_medium=copy_link	100	3.8	2022-02-16 19:34:16.597033+05:30	2022-02-15 19:17:46.501108+05:30	5	90	271992	sasta	2108	\N
191	Processing	https://instagram.com/sreelu______sree?utm_medium=copy_link	200	25	2022-02-16 19:51:09.142019+05:30	2022-02-16 19:51:08.406669+05:30	38	90	273702	sasta	\N	\N
286	Completed	https://instagram.com/she_call_me_as_idiot?utm_medium=copy_link	500	20	2022-03-03 11:21:09.210428+05:30	2022-03-02 23:56:46.274645+05:30	73	102	124674	sasta	555	\N
190	Cancelled	https://www.instagram.com/p/CZ__PgTPdfx/?utm_medium=copy_link	100	3.8	2022-02-16 19:56:41.950638+05:30	2022-02-15 19:18:12.453579+05:30	5	90	271994	sasta	\N	\N
185	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=	50	6.25	2022-02-15 19:03:42.238774+05:30	2022-02-15 18:16:44.878003+05:30	38	90	\N	\N	\N	\N
163	Completed	https://instagram.com/bipin_bhadarka?utm_medium=copy_link	1100	121	2022-02-15 17:28:06.115211+05:30	2022-02-14 20:20:35.177324+05:30	40	3	270496	sasta	13242	\N
179	Completed	https://www.instagram.com/reel/CZ_zr4FAAPX/?utm_medium=copy_link	5000	40	2022-02-15 18:08:43.537384+05:30	2022-02-15 17:27:39.532351+05:30	34	3	271803	sasta	4	\N
181	Completed	https://www.instagram.com/reel/CZ_zr4FAAPX/?utm_medium=copy_link	2000	20	2022-02-15 18:08:44.171154+05:30	2022-02-15 17:30:07.191547+05:30	4	3	271809	sasta	4876	\N
180	Completed	https://www.instagram.com/reel/CZ_zr4FAAPX/?utm_medium=copy_link	300	4.8	2022-02-15 18:08:44.760798+05:30	2022-02-15 17:28:01.253533+05:30	61	3	271805	sasta	2	\N
184	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	50	6	2022-02-15 19:03:53.632974+05:30	2022-02-15 17:49:27.163895+05:30	30	90	\N	\N	\N	\N
183	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	100	12.5	2022-02-15 19:04:04.314361+05:30	2022-02-15 17:39:07.566739+05:30	38	90	\N	\N	\N	\N
182	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	100	12.5	2022-02-15 19:04:16.799294+05:30	2022-02-15 17:34:31.669554+05:30	38	90	\N	\N	\N	\N
173	Completed	https://instagram.com/gokul_achuz_?utm_medium=copy_link	50	6	2022-02-16 19:34:09.16611+05:30	2022-02-15 12:35:46.543372+05:30	30	90	271358	sasta	1346	\N
174	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	100	12.5	2022-02-16 19:34:09.741868+05:30	2022-02-15 15:04:20.047558+05:30	38	90	271574	sasta	2880	\N
175	Completed	https://instagram.com/r_e_n_j_i_t_h__a_c_h_u_z718?utm_medium=copy_link	200	25	2022-02-16 19:34:10.315996+05:30	2022-02-15 16:54:19.455968+05:30	38	90	271751	sasta	1520	\N
177	Completed	https://instagram.com/r_e_n_j_i_t_h__a_c_h_u_z718?utm_medium=copy_link	300	37.5	2022-02-16 19:34:10.888273+05:30	2022-02-15 17:16:43.574161+05:30	38	90	271784	sasta	1722	\N
198	Pending	https://www.instagram.com/p/CYovJ9yvbeg/?utm_medium=copy_link	200	3	2022-02-17 17:23:41.251818+05:30	2022-02-17 17:23:35.714813+05:30	66	3	275189	sasta	\N	\N
194	Processing	https://www.instagram.com/p/CWQZL4dPa85/?utm_medium=copy_link	500	19	2022-02-16 22:49:05.932491+05:30	2022-02-16 22:49:05.207488+05:30	5	90	274014	sasta	\N	\N
193	Completed	https://www.instagram.com/p/CaCaemxvmWS/?utm_medium=copy_link	500	8	2022-02-17 08:54:46.349601+05:30	2022-02-16 19:59:12.728129+05:30	61	14	273710	sasta	88	\N
164	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	100	12	2022-02-16 19:34:11.465591+05:30	2022-02-14 22:18:19.276123+05:30	30	90	270777	sasta	2355	\N
165	Completed	https://instagram.com/r_e_n_j_i_t_h__a_c_h_u_z718?utm_medium=copy_link	100	12	2022-02-16 19:34:12.039639+05:30	2022-02-14 22:29:43.569167+05:30	30	90	270804	sasta	1439	\N
166	Completed	https://instagram.com/sreelu______sree?utm_medium=copy_link	100	12	2022-02-16 19:34:12.615543+05:30	2022-02-14 22:59:50.423789+05:30	30	90	270843	sasta	315	\N
196	Processing	https://instagram.com/__sky__prince__?utm_medium=copy_link	400	50	2022-02-17 13:50:01.933536+05:30	2022-02-17 13:50:01.074948+05:30	38	90	274892	sasta	\N	\N
192	Completed	https://instagram.com/_oye__rocky__?utm_medium=copy_link	800	28	2022-02-17 08:54:45.737615+05:30	2022-02-16 19:58:31.600747+05:30	46	14	273707	sasta	1298	\N
290	Processing	https://youtu.be/y8T9Nw5js1Y	1000	460	2022-03-04 00:50:59.109825+05:30	2022-03-04 00:46:46.839385+05:30	27	102	\N	\N	\N	\N
195	Completed	https://www.instagram.com/p/CYp8UBxvujM/?utm_medium=copy_link	400	6.4	2022-02-17 16:28:11.843831+05:30	2022-02-17 08:54:25.024588+05:30	61	14	274419	sasta	163	\N
294	In progress	https://instagram.com/_oye__rocky__?utm_medium=copy_link	500	17.5	2022-03-05 00:27:25.980291+05:30	2022-03-05 00:23:08.812396+05:30	46	14	\N	\N	\N	\N
187	Completed	https://www.instagram.com/reel/CZ_zr4FAAPX/?utm_medium=copy_link	4000	32	2022-02-17 17:23:40.661883+05:30	2022-02-15 18:45:58.410791+05:30	34	3	271924	sasta	6981	\N
159	Cancelled	https://www.instagram.com/p/CZdvp8PPfzvRXH0L7XxPmxqL5eCvt0GRJNroSc0/?utm_medium=copy_link	500	8	2022-02-19 12:40:46.665005+05:30	2022-02-12 23:40:23.240241+05:30	61	14	267874	sasta	\N	\N
300	Partial	https://www.instagram.com/p/CPYBi00Hfh4/?utm_medium=copy_link	500	6.5	2022-03-18 22:42:25.112075+05:30	2022-03-05 22:51:18.245007+05:30	61	14	131233	sasta	77	\N
203	Completed	https://instagram.com/real_hearts_king_?utm_medium=copy_link	200	24	2022-02-22 18:00:08.083873+05:30	2022-02-18 16:07:21.41504+05:30	30	42	276613	sasta	841	\N
204	Completed	https://instagram.com/akash_pandit_8?utm_medium=copy_link	100	12	2022-02-22 18:00:08.657276+05:30	2022-02-19 17:47:07.54909+05:30	30	42	278228	sasta	886	\N
285	Completed	https://instagram.com/chauhan_anurag_1406?utm_medium=copy_link	1000	40	2022-03-03 11:21:09.794266+05:30	2022-03-02 22:48:06.635355+05:30	73	102	124569	sasta	139	\N
206	Processing	https://instagram.com/prince_vicky_2345?utm_medium=copy_link	80	9.6	2022-02-19 22:47:34.78102+05:30	2022-02-19 22:47:34.040093+05:30	30	70	278714	sasta	\N	\N
205	Completed	https://www.instagram.com/reel/CaFfBswDI8F/?utm_medium=copy_link	100	3.8	2022-02-22 18:00:09.282962+05:30	2022-02-19 18:06:52.368512+05:30	5	42	278255	sasta	127	\N
211	Completed	https://instagram.com/gaurav.officlal.09?utm_medium=copy_link	100	12	2022-02-22 18:00:09.855993+05:30	2022-02-20 19:06:45.679701+05:30	30	42	279774	sasta	386	\N
210	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	65	8.125	2022-02-20 15:04:21.151641+05:30	2022-02-19 23:12:37.809869+05:30	38	90	278755	sasta	\N	\N
209	Cancelled	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	3	0.375	2022-02-20 15:04:29.832899+05:30	2022-02-19 23:12:14.478071+05:30	38	90	\N	\N	\N	\N
208	Completed	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	10	1.2	2022-02-20 15:05:26.246228+05:30	2022-02-19 23:11:59.584697+05:30	30	90	278741	sasta	\N	\N
207	In progress	https://instagram.com/_the_mustard_yellow_?utm_medium=copy_link	200	25	2022-02-20 15:05:51.51364+05:30	2022-02-19 23:11:46.691497+05:30	38	90	\N	\N	\N	\N
263	Canceled	https://www.instagram.com/p/CYN7MWTPVsWqD3KNTpAhvjm4i0opIwbCl5GUKc0/?utm_medium=copy_link	500	6.5	2022-03-05 00:23:21.187934+05:30	2022-02-26 22:22:37.202715+05:30	61	14	115606	\N	\N	\N
227	Processing	https://instagram.com/_ishi_rajput_?utm_medium=copy_link	100	12	2022-02-22 18:02:05.710873+05:30	2022-02-22 18:02:04.973874+05:30	30	42	283310	sasta	\N	\N
212	Completed	https://www.instagram.com/reel/CS9joU5A6Wl/?utm_medium=copy_link	125	1.875	2022-02-22 18:00:10.470153+05:30	2022-02-20 19:16:31.670013+05:30	66	42	279791	sasta	147	\N
214	In progress	https://instagram.com/somyaajmera407?utm_medium=copy_link	1000	33	2022-02-20 19:29:02.732309+05:30	2022-02-20 19:22:54.945561+05:30	47	109	279804	sasta	\N	\N
228	Processing	https://www.instagram.com/p/CaR6CwPgXU5/?utm_medium=copy_link	300	4.5	2022-02-22 18:11:05.397859+05:30	2022-02-22 18:11:04.630352+05:30	66	42	283319	sasta	\N	\N
218	Completed	https://www.instagram.com/reel/CaPmqr7gF80/?utm_medium=copy_link	1000	3	2022-02-21 23:44:00.295494+05:30	2022-02-21 20:52:04.342127+05:30	60	114	281616	sasta	33	\N
213	Completed	https://www.instagram.com/p/CaLmqjwPpfa/?utm_medium=copy_link	125	1.875	2022-02-22 18:00:11.042233+05:30	2022-02-20 19:17:28.532756+05:30	66	42	279795	sasta	20	\N
215	Completed	https://www.instagram.com/p/CYWSRs3g387/?utm_medium=copy_link	100	1.5	2022-02-22 18:00:11.623827+05:30	2022-02-21 18:03:30.041552+05:30	66	42	281335	sasta	48	\N
219	Completed	https://www.instagram.com/reel/CaPmqr7gF80/?utm_medium=copy_link	50	0.75	2022-02-21 23:44:00.871949+05:30	2022-02-21 20:52:58.258887+05:30	66	114	281620	sasta	20	\N
216	Completed	https://www.instagram.com/p/CZrcBWgvQfy/?utm_medium=copy_link	100	1.5	2022-02-22 18:00:12.223327+05:30	2022-02-21 18:05:03.099543+05:30	66	42	281338	sasta	62	\N
217	Completed	https://www.instagram.com/p/CYK5HG_Jhty/?utm_medium=copy_link	100	1.5	2022-02-22 18:00:12.795922+05:30	2022-02-21 18:07:39.339274+05:30	66	42	281341	sasta	123	\N
220	Pending	https://www.instagram.com/reel/CaPmqr7gF80/?utm_medium=copy_link	2000	6	2022-02-21 23:46:03.885937+05:30	2022-02-21 23:45:49.702102+05:30	60	114	281993	sasta	\N	\N
221	Pending	https://www.instagram.com/reel/CaPmqr7gF80/?utm_medium=copy_link	2000	6	2022-02-21 23:46:04.459299+05:30	2022-02-21 23:45:50.915241+05:30	60	114	281994	sasta	\N	\N
222	Processing	https://www.instagram.com/reel/CaPmqr7gF80/?utm_medium=copy_link	200	7.6	2022-02-21 23:46:45.479429+05:30	2022-02-21 23:46:44.878915+05:30	5	114	281995	sasta	\N	\N
229	Processing	https://www.instagram.com/p/CaR6CwPgXU5/?utm_medium=copy_link	100	1.5	2022-02-22 18:17:13.141709+05:30	2022-02-22 18:17:12.387812+05:30	66	42	283328	sasta	\N	\N
258	Canceled	https://www.instagram.com/p/CaQnSF8vE6sIqYxBoc5Br-hmj0AjKqmkEb9xWg0/?utm_medium=copy_link	500	6.5	2022-03-05 00:23:21.770185+05:30	2022-02-26 22:15:57.048029+05:30	61	14	115599	\N	\N	\N
259	Canceled	https://www.instagram.com/p/CaPpyytPg01iQ1_JuF7Qv_zQnSpa3_FlFXL2XY0/?utm_medium=copy_link	500	6.5	2022-03-05 00:23:22.3561+05:30	2022-02-26 22:17:36.702918+05:30	61	14	115600	\N	\N	\N
260	Canceled	https://www.instagram.com/p/CaTUtsUvUtNOenCoaLuSab6vdBt-CfPaFIbZYQ0/?utm_medium=copy_link	500	6.5	2022-03-05 00:23:22.941106+05:30	2022-02-26 22:19:26.699415+05:30	61	14	115603	\N	\N	\N
261	Canceled	https://www.instagram.com/p/CY1Lq5RPEc8ydG7u3vj5h0T_7zmjQXuEsfAIpE0/?utm_medium=copy_link	500	6.5	2022-03-05 00:23:23.525354+05:30	2022-02-26 22:20:42.935755+05:30	61	14	115604	\N	\N	\N
262	Canceled	https://www.instagram.com/p/CYs9UZ5Pnp_P23btgBa5WyLNc6-tKDCrY4LYrc0/?utm_medium=copy_link	500	6.5	2022-03-05 00:23:24.14174+05:30	2022-02-26 22:21:27.477096+05:30	61	14	115605	\N	\N	\N
202	Completed	https://www.instagram.com/p/CaEF-mzp43Q/?utm_medium=copy_link	100	3.8	2022-02-22 18:00:07.511162+05:30	2022-02-17 23:08:52.293556+05:30	5	42	275655	sasta	46	\N
223	Completed	https://www.instagram.com/p/CaRcE-oJJ9a/?utm_medium=copy_link	100	1.5	2022-02-22 18:00:13.369711+05:30	2022-02-22 14:53:48.428172+05:30	66	42	282995	sasta	12	\N
224	Completed	https://www.instagram.com/reel/CaPhvB1pB5G/?utm_medium=copy_link	200	0.6	2022-02-22 18:00:13.941242+05:30	2022-02-22 14:59:05.574666+05:30	60	42	283023	sasta	63	\N
291	In progress	https://youtu.be/a0DqjiXJV0w	1000	460	2022-03-05 00:29:43.458992+05:30	2022-03-04 13:12:13.309634+05:30	27	102	\N	\N	\N	\N
295	Pending	https://instagram.com/ravindra_darling_1223?utm_medium=copy_link	1000	35	2022-03-05 00:31:33.582989+05:30	2022-03-05 00:31:33.583007+05:30	46	14	\N	\N	\N	\N
303	Completed	https://www.instagram.com/p/CadxgGOP5RH/?utm_medium=copy_link	500	6.5	2022-03-06 12:52:44.573472+05:30	2022-03-05 22:52:33.45081+05:30	61	14	131239	sasta	82	\N
297	Completed	https://www.instagram.com/p/CU2c8BXvPwe/?utm_medium=copy_link	500	6.5	2022-03-06 12:52:45.156066+05:30	2022-03-05 22:49:54.612431+05:30	61	14	131224	sasta	87	\N
250	Completed	https://instagram.com/ahanasheikh730?utm_medium=copy_link	786	98.25	2022-02-26 14:49:28.50399+05:30	2022-02-26 12:42:30.229226+05:30	38	139	114234	\N	\N	\N
298	Completed	https://www.instagram.com/p/CVDdxNJvKrS/?utm_medium=copy_link	500	6.5	2022-03-06 12:52:45.740628+05:30	2022-03-05 22:50:20.100419+05:30	61	14	131227	sasta	73	\N
310	Completed	https://instagram.com/pranav_d_official_	100	12.5	2022-03-18 22:42:25.64494+05:30	2022-03-06 12:52:31.228626+05:30	38	14	132348	The Royal SMM	522	\N
588	Completed	https://t.me/Shopnery	100	20	2022-09-02 00:03:57.584234+05:30	2022-08-25 15:36:39.762849+05:30	8	234	\N	\N	\N	\N
246	Completed	https://www.instagram.com/p/CWBVuf3vQPb/?utm_medium=copy_link	500	6.5	2022-02-26 21:34:30.443431+05:30	2022-02-25 14:51:48.066021+05:30	61	14	\N	\N	\N	\N
264	Processing	https://www.instagram.com/p/CVHPaK5Pk1RzPoMQlxtksgf7qLsDg9Deqz-1AM0/?utm_medium=copy_link	500	6.5	2022-02-26 22:41:30.580223+05:30	2022-02-26 22:23:00.693386+05:30	61	14	\N	\N	\N	\N
287	Completed	https://instagram.com/sanam_quote_club?utm_medium=copy_link	1000	35	2022-03-20 08:45:30.860549+05:30	2022-03-03 09:28:20.465443+05:30	46	144	125093	sasta	1060	\N
282	Completed	https://www.instagram.com/reel/CZ7F9JEgCXB/?utm_medium=copy_link	1000	8	2022-03-03 09:35:35.359052+05:30	2022-03-02 19:56:23.709938+05:30	59	144	124162	sasta	1274	\N
270	Completed	https://www.instagram.com/krishnajhapate	100	12.5	2022-02-27 23:45:08.65186+05:30	2022-02-27 23:21:43.735058+05:30	38	1	117974	sasta	289	\N
273	In progress	https://youtu.be/y8T9Nw5js1Y	1000	460	2022-02-28 17:35:29.013113+05:30	2022-02-28 17:31:16.049001+05:30	27	102	\N	\N	\N	\N
283	Partial	https://instagram.com/sagar_x30?utm_medium=copy_link	100	3.3	2022-03-20 09:01:06.424555+05:30	2022-03-02 20:13:43.110772+05:30	47	144	124201	sasta	1632	\N
343	Completed	https://instagram.com/c_h_a_n_d_a_n_05_	100	8	2022-03-21 19:15:37.665351+05:30	2022-03-14 09:45:05.417682+05:30	77	3	152346	The Royal SMM	234	\N
314	In progress	https://instagram.com/eyedropsanamphotography?utm_medium=copy_link	100	12	2022-03-08 13:07:23.794723+05:30	2022-03-07 22:50:39.892667+05:30	30	144	\N	\N	\N	\N
279	Processing	https://instagram.com/prince_vicky_2345?utm_medium=copy_link	380	47.5	2022-03-01 10:14:39.376258+05:30	2022-03-01 10:14:38.66835+05:30	38	70	120620	sasta	\N	\N
313	In progress	https://instagram.com/sanam_quote_club	100	12	2022-03-08 13:08:05.821511+05:30	2022-03-07 18:44:02.664218+05:30	30	144	\N	\N	\N	\N
316	In progress	https://www.instagram.com/p/Cav56-zlYkk/?utm_medium=copy_link	100	3.8	2022-03-08 15:19:00.291288+05:30	2022-03-08 15:14:24.127988+05:30	5	146	\N	\N	\N	\N
315	In progress	https://www.instagram.com/p/Cav56-zlYkk/?utm_medium=copy_link	200	2.6	2022-03-08 15:19:13.619612+05:30	2022-03-08 14:46:56.750371+05:30	61	146	\N	\N	\N	\N
292	Canceled	https://instagram.com/ravindra_darling_1223?utm_medium=copy_link	1000	13	2022-03-05 08:20:45.620419+05:30	2022-03-05 00:20:40.472203+05:30	61	14	129135	sasta	\N	\N
281	In progress	https://youtu.be/KuMffVVNUU4	1000	460	2022-03-02 13:55:34.213548+05:30	2022-03-02 13:38:53.294908+05:30	27	102	\N	\N	\N	\N
296	Pending	https://youtu.be/y8T9Nw5js1Y	300	138	2022-03-05 22:57:50.659684+05:30	2022-03-05 19:46:51.014003+05:30	27	102	\N	\N	\N	\N
309	Completed	https://www.instagram.com/p/B8l4mQQA571/	10	0.1	2022-03-06 10:05:33.07714+05:30	2022-03-06 10:03:56.320387+05:30	32	144	\N	\N	\N	\N
301	Completed	https://www.instagram.com/p/COzomsoHima/?utm_medium=copy_link	500	6.5	2022-03-06 12:52:43.966648+05:30	2022-03-05 22:51:42.210265+05:30	61	14	131235	sasta	84	\N
299	Completed	https://www.instagram.com/p/CVB-EafvZ3V/?utm_medium=copy_link	500	6.5	2022-03-06 12:52:46.907341+05:30	2022-03-05 22:50:45.61776+05:30	61	14	131229	sasta	74	\N
302	Completed	https://www.instagram.com/p/CadgpxDPlHL/?utm_medium=copy_link	500	6.5	2022-03-06 12:52:47.490515+05:30	2022-03-05 22:52:05.707802+05:30	61	14	131238	sasta	60	\N
304	Completed	https://www.instagram.com/p/Cae6VGXvp60/?utm_medium=copy_link	400	5.2	2022-03-06 12:52:48.075611+05:30	2022-03-05 22:54:27.4014+05:30	61	14	131246	sasta	65	\N
326	Processing	https://instagram.com/ig_ayush78?utm_medium=copy_link	1000	42	2022-03-08 22:03:53.389753+05:30	2022-03-08 21:41:06.863175+05:30	74	102	\N	\N	\N	\N
325	In progress	https://www.instagram.com/p/CPsXVpjnMvo/?utm_medium=copy_link	400	5.2	2022-03-08 22:10:20.964019+05:30	2022-03-08 21:36:08.913314+05:30	61	14	\N	\N	\N	\N
318	In progress	https://www.instagram.com/p/CVGMoDjvL4u/?utm_medium=copy_link	400	5.2	2022-03-08 22:13:15.278767+05:30	2022-03-08 20:37:02.202089+05:30	61	14	\N	\N	\N	\N
324	In progress	https://www.instagram.com/p/CP01LPCnmFQ/?utm_medium=copy_link	400	5.2	2022-03-08 22:10:46.784174+05:30	2022-03-08 21:35:38.648709+05:30	61	14	\N	\N	\N	\N
323	In progress	https://www.instagram.com/p/CP5_r65H7_z/?utm_medium=copy_link	450	5.85	2022-03-08 22:11:04.142907+05:30	2022-03-08 21:35:12.440517+05:30	61	14	\N	\N	\N	\N
322	In progress	https://www.instagram.com/p/CTH0KrtFDb4/?utm_medium=copy_link	500	6.5	2022-03-08 22:11:22.128858+05:30	2022-03-08 21:34:42.332593+05:30	61	14	\N	\N	\N	\N
321	In progress	https://www.instagram.com/p/CTccGWqFJYk/?utm_medium=copy_link	420	5.46	2022-03-08 22:11:42.652868+05:30	2022-03-08 20:38:36.864564+05:30	61	14	\N	\N	\N	\N
320	In progress	https://www.instagram.com/p/CU6bpOtP19B/?utm_medium=copy_link	400	5.2	2022-03-08 22:12:06.20239+05:30	2022-03-08 20:38:00.155332+05:30	61	14	\N	\N	\N	\N
319	In progress	https://www.instagram.com/p/CU_11uvvITN/?utm_medium=copy_link	420	5.46	2022-03-08 22:12:28.947242+05:30	2022-03-08 20:37:30.804403+05:30	61	14	\N	\N	\N	\N
317	In progress	https://www.instagram.com/p/CazgT-6PGia/?utm_medium=copy_link	500	6.5	2022-03-08 22:12:43.830872+05:30	2022-03-08 20:34:48.516969+05:30	61	14	\N	\N	\N	\N
327	In progress	https://instagram.com/mr_nar_cos_?utm_medium=copy_link	300	34.5	2022-03-09 08:27:40.060272+05:30	2022-03-08 22:40:33.814072+05:30	42	147	\N	\N	\N	\N
328	Pending	https://instagram.com/jai_shree_ram_kattar_hindu11	1000	62	2022-03-09 09:11:28.697999+05:30	2022-03-09 09:11:28.698018+05:30	74	144	\N	\N	\N	\N
331	In progress	https://instagram.com/honey.officiall_786?utm_medium=copy_link	100	9	2022-03-09 11:50:59.066565+05:30	2022-03-09 11:49:08.543299+05:30	76	129	\N	\N	\N	\N
330	In progress	https://instagram.com/sombirboora122?utm_medium=copy_link	100	9	2022-03-09 11:52:42.341932+05:30	2022-03-09 11:44:11.575977+05:30	76	129	\N	\N	\N	\N
329	In progress	https://instagram.com/urs____comrade?utm_medium=copy_link	250	8.75	2022-03-09 15:15:46.092344+05:30	2022-03-09 10:34:05.139247+05:30	46	14	\N	\N	\N	\N
332	In progress	https://instagram.com/tyagibhavi456?utm_medium=copy_link	200	7	2022-03-11 21:54:57.978894+05:30	2022-03-11 12:13:27.697373+05:30	46	146	\N	\N	\N	\N
335	In progress	https://www.instagram.com/reel/CazoLGzjANM/?utm_medium=copy_link	100	3.8	2022-03-13 09:53:50.923365+05:30	2022-03-11 16:44:20.205738+05:30	5	146	\N	\N	\N	\N
333	In progress	https://instagram.com/tyagibhavi456?utm_medium=copy_link	50	6	2022-03-13 09:54:06.796326+05:30	2022-03-11 15:13:39.086863+05:30	30	146	\N	\N	\N	\N
337	Completed	https://instagram.com/rickiebhatt_actor_poet_tr?utm_medium=copy_link	1000	135	2022-03-13 09:52:49.215853+05:30	2022-03-11 22:19:26.02631+05:30	39	144	\N	\N	\N	\N
336	Completed	https://www.instagram.com/reel/Ca64CXeJY7X/?utm_medium=copy_link	500	12.5	2022-03-13 09:52:58.152949+05:30	2022-03-11 21:54:57.047153+05:30	79	129	\N	\N	\N	\N
334	In progress	https://www.instagram.com/p/CaPI-FuvY5h/?utm_medium=copy_link	20	2.4	2022-03-13 09:54:47.884534+05:30	2022-03-11 16:32:20.269616+05:30	30	146	\N	\N	\N	\N
345	In progress	https://instagram.com/gupta__chanchal?utm_medium=copy_link	400	48	2022-03-14 18:03:31.916862+05:30	2022-03-14 12:12:51.016502+05:30	30	146	152795	\N	\N	\N
340	Pending	https://www.instagram.com/p/B8l4mQQA571/?utm_source=ig_web_copy_link	10	0.13	2022-03-13 10:21:37.045952+05:30	2022-03-13 10:21:37.04597+05:30	61	1	\N	\N	\N	\N
311	Partial	https://instagram.com/_the_mustard_yellow_	100	12.5	2022-03-13 14:44:44.538933+05:30	2022-03-06 21:22:19.779588+05:30	38	147	133566	The Royal SMM	\N	\N
341	In progress	https://instagram.com/r_e_n_j_i_t_h__a_c_h_u_z718?utm_medium=copy_link	1000	120	2022-03-13 15:07:27.975277+05:30	2022-03-13 15:01:28.405675+05:30	30	147	\N	\N	\N	\N
342	Processing	https://instagram.com/mr_nar_cos_	500	62.5	2022-03-13 17:46:08.586813+05:30	2022-03-13 17:46:07.850622+05:30	38	147	150971	The Royal SMM	\N	\N
312	Completed	https://instagram.com/ig_satyam___	500	20	2022-03-17 16:41:44.982739+05:30	2022-03-07 11:34:43.575184+05:30	73	102	134571	The Royal SMM	108	\N
339	Completed	https://www.instagram.com/p/B8l4mQQA571/	100	1.3	2022-03-14 18:00:55.901819+05:30	2022-03-13 10:19:21.730005+05:30	61	1	149587	The Royal SMM	420	\N
347	Processing	https://instagram.com/eay_machaa	100	9	2022-03-14 15:07:33.007063+05:30	2022-03-14 15:07:32.312872+05:30	76	42	153140	The Royal SMM	\N	\N
369	In progress	https://instagram.com/soul_of_love_23k?igshid=YmMyMTA2M2Y=	1000	125	2022-04-19 21:09:55.049323+05:30	2022-04-19 21:02:45.854673+05:30	38	147	\N	\N	\N	\N
348	Processing	https://www.instagram.com/p/B8l4mQQA571/	10	0.13	2022-03-14 18:00:56.420842+05:30	2022-03-14 18:00:51.05142+05:30	61	1	153500	The Royal SMM	\N	\N
346	In progress	https://www.instagram.com/reel/CbC6bJXKJRg/?utm_medium=copy_link	1500	15	2022-03-14 18:03:13.585507+05:30	2022-03-14 14:39:46.441575+05:30	4	146	153190	\N	\N	\N
344	In progress	https://www.instagram.com/reel/CbC6bJXKJRg/?utm_medium=copy_link	300	11.4	2022-03-14 18:03:48.414845+05:30	2022-03-14 11:09:11.567741+05:30	5	146	152835	\N	\N	\N
368	In progress	https://instagram.com/soul_of_love_23k?igshid=YmMyMTA2M2Y=	600	75	2022-04-19 21:11:27.604971+05:30	2022-04-19 19:56:06.804265+05:30	38	147	\N	\N	\N	\N
349	Completed	https://instagram.com/procloud6895	500	21	2022-03-17 16:41:45.494586+05:30	2022-03-16 22:46:04.225628+05:30	74	102	158452	The Royal SMM	21	\N
350	In progress	https://www.instagram.com/p/CbQG29VvFVD/	500	6.5	2022-03-18 22:42:26.177196+05:30	2022-03-18 22:20:35.57266+05:30	61	14	162618	The Royal SMM	0	\N
351	Processing	https://www.instagram.com/reel/CbSQAAzDlEh/	300	3.9	2022-03-19 17:58:21.450418+05:30	2022-03-19 17:58:20.744874+05:30	61	14	163942	The Royal SMM	\N	\N
352	In progress	https://instagram.com/artist_pushpendra_pal?utm_medium=copy_link	222	29.97	2022-03-20 10:52:43.028236+05:30	2022-03-20 08:33:42.938363+05:30	39	144	\N	\N	\N	\N
356	In progress	https://www.instagram.com/p/CbcRE6RPMiv/?utm_medium=copy_link	500	6.5	2022-03-24 22:41:02.897986+05:30	2022-03-24 22:02:34.619567+05:30	61	14	\N	\N	\N	\N
358	Pending	https://www.instagram.com/reel/Cb4dARmFAeq/?utm_medium=copy_link	200	2.6	2022-04-03 15:51:13.279575+05:30	2022-04-03 15:51:13.279593+05:30	61	14	\N	\N	\N	\N
360	Pending	https://instagram.com/shrinivas.rathore?utm_medium=copy_link	160	17.6	2022-04-06 09:27:18.520284+05:30	2022-04-06 09:27:18.5203+05:30	40	162	\N	\N	\N	\N
361	Pending	https://instagram.com/shrinivas.rathore?utm_medium=copy_link	20	2.2	2022-04-06 09:30:24.583638+05:30	2022-04-06 09:30:24.583657+05:30	40	162	\N	\N	\N	\N
362	In progress	https://www.instagram.com/reel/CcFI58_g2Tl6D_q8aeL7Ynm8PwKwZRVsKVau9s0/?igshid=YmMyMTA2M2Y=	2000	20	2022-04-08 22:36:05.31746+05:30	2022-04-08 22:26:31.390413+05:30	4	160	\N	\N	\N	\N
364	Pending	https://www.instagram.com/reel/CcGRjrOK4aK/?igshid=YmMyMTA2M2Y=	500	5	2022-04-09 13:41:16.764925+05:30	2022-04-09 13:41:16.764944+05:30	4	14	\N	\N	\N	\N
365	Pending	https://www.instagram.com/reel/CcGRjrOK4aK/?igshid=YmMyMTA2M2Y=	500	6.5	2022-04-09 13:42:09.864907+05:30	2022-04-09 13:42:09.864924+05:30	61	14	\N	\N	\N	\N
363	In progress	https://www.instagram.com/reel/CcFI58_g2Tl6D_q8aeL7Ynm8PwKwZRVsKVau9s0/?igshid=YmMyMTA2M2Y=	2000	26	2022-04-09 22:03:57.022309+05:30	2022-04-09 11:06:24.040454+05:30	61	160	\N	\N	\N	\N
370	In progress	https://instagram.com/v4__girl__?igshid=YmMyMTA2M2Y=	400	50	2022-04-23 14:58:18.856621+05:30	2022-04-23 13:13:25.948709+05:30	38	147	\N	\N	\N	\N
371	In progress	https://instagram.com/v4__girl__?igshid=YmMyMTA2M2Y=	250	27.5	2022-04-23 14:58:54.454189+05:30	2022-04-23 14:00:34.053093+05:30	40	147	\N	\N	\N	\N
372	In progress	https://www.instagram.com/p/CcslHdchd1y/?igshid=YmMyMTA2M2Y=	1000	13	2022-04-27 21:24:53.390999+05:30	2022-04-26 13:11:35.26299+05:30	61	167	\N	\N	\N	\N
376	Cancelled	https://www.instagram.com/p/CeomL9DvNAY/?igshid=YmMyMTA2M2Y=	1000	18	2022-06-11 00:46:25.830308+05:30	2022-06-11 00:14:34.201997+05:30	80	171	\N	\N	\N	\N
378	Cancelled	https://instagram.com/sugarheart_sakshii?igshid=YmMyMTA2M2Y=	1950	263.25	2022-06-11 00:46:35.842367+05:30	2022-06-11 00:16:53.621607+05:30	39	171	\N	\N	\N	\N
373	Completed	https://www.instagram.com/p/Ceaa0-EPTOA/?igshid=YmMyMTA2M2Y=	2000	76	2022-06-10 15:34:09.393591+05:30	2022-06-05 13:17:22.395283+05:30	5	171	\N	\N	\N	\N
374	Completed	https://www.instagram.com/p/CeYKhGovRqM/?igshid=YmMyMTA2M2Y=	40	3.2	2022-06-10 15:34:23.611885+05:30	2022-06-05 13:21:55.819721+05:30	77	171	\N	\N	\N	\N
377	Cancelled	https://www.instagram.com/p/CeomL9DvNAY/?igshid=YmMyMTA2M2Y=	1000	18	2022-06-11 00:46:45.703747+05:30	2022-06-11 00:15:07.746749+05:30	80	171	\N	\N	\N	\N
375	Completed	https://www.instagram.com/p/CenNXhcvsPJ/?igshid=YmMyMTA2M2Y=	1040	39.52	2022-06-11 00:39:34.753405+05:30	2022-06-10 15:40:53.128003+05:30	5	171	\N	\N	\N	\N
385	Completed	https://instagram.com/stories/__sonu_xoxo_/2858497240165689572?utm_source=ig_story_item_share&igshid=MDJmNzVkMjY=	1200	12	2022-06-12 15:42:22.047762+05:30	2022-06-12 02:01:24.802306+05:30	32	171	\N	\N	\N	\N
379	Completed	https://instagram.com/sugarheart_sakshii?igshid=YmMyMTA2M2Y=	1700	136	2022-06-11 11:29:46.003459+05:30	2022-06-11 00:47:56.342576+05:30	77	171	\N	\N	\N	\N
380	Completed	https://www.instagram.com/p/CeomL9DvNAY/?igshid=YmMyMTA2M2Y=	1500	18	2022-06-11 11:29:59.23946+05:30	2022-06-11 02:08:44.211318+05:30	66	171	\N	\N	\N	\N
386	Processing	https://instagram.com/pradeep.sharma9767?igshid=YmMyMTA2M2Y=	300	15	2022-06-12 15:42:44.775634+05:30	2022-06-12 15:38:31.182328+05:30	76	171	\N	\N	\N	\N
381	Completed	https://instagram.com/sugarheart_sakshii?igshid=YmMyMTA2M2Y=	2000	100	2022-06-12 01:37:49.93086+05:30	2022-06-11 22:52:53.09061+05:30	76	171	\N	\N	\N	\N
382	Completed	https://instagram.com/__sonu_xoxo_?igshid=YmMyMTA2M2Y=	2000	100	2022-06-12 01:38:00.794997+05:30	2022-06-11 22:53:36.430292+05:30	76	171	\N	\N	\N	\N
383	Completed	https://www.instagram.com/p/CeraKLzPkq1/?igshid=YmMyMTA2M2Y=	800	12	2022-06-12 15:42:12.133087+05:30	2022-06-12 01:56:01.65653+05:30	88	171	\N	\N	\N	\N
384	Completed	https://www.instagram.com/p/CenNXhcvsPJ/?igshid=YmMyMTA2M2Y=	50	7	2022-06-12 15:42:32.283791+05:30	2022-06-12 01:58:06.586422+05:30	86	171	\N	\N	\N	\N
387	Processing	https://instagram.com/pradeep.sharma9767?igshid=YmMyMTA2M2Y=	199	9.95	2022-06-12 16:01:13.054731+05:30	2022-06-12 15:57:46.596586+05:30	76	171	\N	\N	\N	\N
388	Processing	https://instagram.com/pradeep.sharma9767?igshid=YmMyMTA2M2Y=	1000	50	2022-06-12 16:24:05.226959+05:30	2022-06-12 16:22:48.222911+05:30	76	171	\N	\N	\N	\N
389	Processing	https://instagram.com/__sonu_xoxo_?igshid=YmMyMTA2M2Y=	1000	50	2022-06-12 16:24:48.590443+05:30	2022-06-12 16:23:29.592544+05:30	76	171	\N	\N	\N	\N
397	Pending	https://www.instagram.com/p/B8l4mQQA571/?utm_source=ig_web_copy_link	10	0.12	2022-06-12 18:43:36.651065+05:30	2022-06-12 18:43:36.651083+05:30	66	172	\N	\N	\N	\N
398	Pending	https://www.instagram.com/p/B8l4mQQA571/?utm_source=ig_web_copy_link	10	0.38	2022-06-12 19:06:39.907185+05:30	2022-06-12 19:06:39.907202+05:30	5	172	\N	\N	\N	\N
399	Pending	https://www.instagram.com/p/Cdi-HBUt_u5/?igshid=YmMyMTA2M2Y=	10	0.12	2022-06-12 19:07:27.314122+05:30	2022-06-12 19:07:27.314138+05:30	79	3	\N	\N	\N	\N
400	Pending	https://www.instagram.com/p/Cdi-HBUt_u5/?igshid=YmMyMTA2M2Y=	10	0.12	2022-06-12 19:07:41.18759+05:30	2022-06-12 19:07:41.187606+05:30	79	3	\N	\N	\N	\N
402	Pending	https://www.instagram.com/p/Cdi-HBUt_u5/?igshid=YmMyMTA2M2Y=	10	0.12	2022-06-12 19:08:33.001959+05:30	2022-06-12 19:08:33.00198+05:30	79	3	\N	\N	\N	\N
403	Pending	https://www.instagram.com/p/Cdi-HBUt_u5/?igshid=YmMyMTA2M2Y=	10	0.12	2022-06-12 19:08:42.24885+05:30	2022-06-12 19:08:42.248868+05:30	79	3	\N	\N	\N	\N
404	Pending	https://www.instagram.com/p/Cdi-HBUt_u5/?igshid=YmMyMTA2M2Y=	10	0.12	2022-06-12 19:08:45.5541+05:30	2022-06-12 19:08:45.554117+05:30	79	3	\N	\N	\N	\N
405	Pending	https://www.instagram.com/p/Cdi-HBUt_u5/?igshid=YmMyMTA2M2Y=	10	0.12	2022-06-12 19:08:50.715047+05:30	2022-06-12 19:08:50.715064+05:30	79	3	\N	\N	\N	\N
423	Completed	https://www.instagram.com/p/CfONvfHrvvi/	2000	30	2022-06-28 19:05:38.028411+05:30	2022-06-25 14:53:58.675379+05:30	88	174	414684	The Royal SMM	18	\N
414	Cancelled	https://instagram.com/sayad_ayan_uddin	3000	45	2022-06-14 12:44:30.611808+05:30	2022-06-14 09:18:01.762522+05:30	88	174	361056	The Royal SMM	\N	\N
417	Pending	https://www.instagram.com/reel/CetdnfxldTk/?igshid=YmMyMTA2M2Y=	1000	38	2022-06-15 14:09:26.395722+05:30	2022-06-15 14:09:26.395742+05:30	5	176	\N	\N	\N	\N
416	Completed	https://instagram.com/sayad_ayan_uddin	1000	80	2022-06-15 14:11:26.25474+05:30	2022-06-14 12:17:40.522386+05:30	77	174	361396	The Royal SMM	22492	\N
424	Completed	https://www.instagram.com/reel/CfWX2M8lt2r/	1000	3	2022-06-28 19:54:25.733407+05:30	2022-06-28 19:07:37.67531+05:30	89	174	424284	The Royal SMM	69	\N
427	Completed	https://www.instagram.com/reel/CfWX2M8lt2r/	2510	7.53	2022-06-28 22:33:38.543611+05:30	2022-06-28 21:28:12.064709+05:30	89	174	424728	The Royal SMM	2247	\N
401	Completed	https://www.instagram.com/p/B8l4mQQA571/	10	0.12	2022-06-13 10:00:21.604603+05:30	2022-06-12 19:08:08.867276+05:30	66	172	356318	The Royal SMM	531	\N
415	Completed	https://www.instagram.com/p/CexSZlVLHja/	2200	33	2022-06-14 12:14:45.995157+05:30	2022-06-14 09:29:41.981987+05:30	88	174	361068	The Royal SMM	22	\N
433	Processing	https://instagram.com/_love_simar_?igshid=YmMyMTA2M2Y=	800	49.6	2022-07-04 13:40:26.957583+05:30	2022-07-04 01:48:08.564641+05:30	74	181	\N	\N	\N	\N
413	Completed	https://www.instagram.com/reel/CeuuOkeoVbY/	200	2.4	2022-06-17 12:02:59.747466+05:30	2022-06-13 13:22:13.761788+05:30	66	45	358823	The Royal SMM	12	\N
420	Completed	https://www.instagram.com/p/Ce3qjN7oeME/	100	1.2	2022-06-17 13:27:56.260081+05:30	2022-06-17 11:59:59.034472+05:30	66	45	380063	The Royal SMM	23	\N
418	Completed	https://www.instagram.com/p/Ce0cJZ0rIun/	6000	90	2022-06-21 13:17:08.405624+05:30	2022-06-15 14:11:13.74537+05:30	88	174	364439	The Royal SMM	9	\N
412	Completed	https://www.instagram.com/reel/CeuuOkeoVbY/	1000	3	2022-06-13 13:22:33.823938+05:30	2022-06-13 12:19:07.981002+05:30	60	45	358620	The Royal SMM	58	\N
425	Completed	https://www.instagram.com/reel/CfWX2M8lt2r/	100	1.2	2022-06-28 22:33:39.593881+05:30	2022-06-28 19:20:13.518091+05:30	79	174	424304	The Royal SMM	34	\N
428	Completed	https://www.instagram.com/reel/CfWX2M8lt2r/	920	11.04	2022-07-01 10:49:16.761223+05:30	2022-06-28 21:45:55.197089+05:30	79	174	424774	The Royal SMM	167	\N
426	Completed	https://www.instagram.com/reel/CfWX2M8lt2r/	1000	3	2022-06-28 22:33:40.640768+05:30	2022-06-28 19:56:35.120615+05:30	89	174	424413	The Royal SMM	1175	\N
429	Completed	https://www.instagram.com/p/Cfa9SmVLtsJ/	1000	12	2022-07-01 10:49:17.325442+05:30	2022-06-30 13:09:12.635624+05:30	79	174	428355	The Royal SMM	4	\N
421	Completed	https://www.instagram.com/p/CfMJPuiFdnp/	450	8.1	2022-06-25 12:53:12.214571+05:30	2022-06-24 19:56:36.166461+05:30	80	181	412580	The Royal SMM	0	\N
422	Completed	https://www.instagram.com/p/CfLmsOJvdVW/	500	7.5	2022-06-25 12:53:12.727126+05:30	2022-06-24 19:57:27.40767+05:30	88	181	412585	The Royal SMM	10	\N
430	Completed	https://instagram.com/official_insta_chahal?igshid=YmMyMTA2M2Y=	250	15	2022-07-03 15:23:55.295452+05:30	2022-07-03 13:48:21.635652+05:30	73	181	\N	\N	\N	\N
431	Completed	https://instagram.com/official_insta_chahal?igshid=YmMyMTA2M2Y=	270	16.2	2022-07-03 15:24:02.151916+05:30	2022-07-03 13:58:50.506855+05:30	73	181	\N	\N	\N	\N
438	Completed	https://www.instagram.com/p/Cf0bqnjL6SY/?igshid=YmMyMTA2M2Y=	10000	120	2022-07-14 00:08:34.501509+05:30	2022-07-10 10:36:54.143244+05:30	79	174	453237	\N	0	\N
437	Completed	https://www.instagram.com/p/CftstwqLXRE/	150	1.8	2022-07-10 10:35:09.512598+05:30	2022-07-07 20:43:51.838042+05:30	79	174	447199	The Royal SMM	0	\N
419	Partial	https://www.instagram.com/p/Ce0cJZ0rIun/	25	2	2022-08-01 17:23:20.677527+05:30	2022-06-15 14:58:06.095177+05:30	77	174	364526	The Royal SMM	\N	\N
432	Completed	https://www.instagram.com/p/CfjAW3Or6Ow/?igshid=YmMyMTA2M2Y=	1166	13.992	2022-07-04 13:32:57.952647+05:30	2022-07-03 16:13:46.05474+05:30	79	174	\N	\N	\N	\N
436	Processing	https://instagram.com/neerajrajputofficial_?igshid=YmMyMTA2M2Y=	170	9.86	2022-07-06 19:30:27.685351+05:30	2022-07-06 12:02:03.492713+05:30	83	181	\N	\N	\N	\N
434	Completed	https://www.instagram.com/reel/CflvxyXFJe4/	8000	24	2022-07-04 21:54:52.336697+05:30	2022-07-04 17:46:03.340894+05:30	89	174	439625	The Royal SMM	273	\N
435	Completed	https://www.instagram.com/reel/CflvxyXFJe4/	2000	24	2022-07-06 19:30:39.141438+05:30	2022-07-04 21:50:10.241301+05:30	79	174	440330	The Royal SMM	0	\N
439	Completed	https://www.instagram.com/p/Cf9f468P9Jb/?igshid=YmMyMTA2M2Y=	2500	30	2022-07-16 08:41:59.782395+05:30	2022-07-13 23:03:46.783982+05:30	79	174	\N	\N	\N	\N
440	Processing	https://instagram.com/devil_krushna?igshid=YmMyMTA2M2Y=	2130	170.4	2022-07-16 16:52:50.347577+05:30	2022-07-16 15:14:35.327227+05:30	77	174	\N	\N	\N	\N
441	Completed	https://instagram.com/crazy_aniket_007	1000	80	2022-07-17 10:29:15.488139+05:30	2022-07-16 22:04:07.420222+05:30	77	174	467976	The Royal SMM	209	\N
445	Cancelled	https://www.instagram.com/reel/Cf1wCYJq1ve/?igshid=YmMyMTA2M2Y=	1000	35	2022-07-19 17:34:51.769701+05:30	2022-07-19 17:29:18.394045+05:30	75	185	\N	\N	\N	\N
442	Completed	https://www.instagram.com/reel/Cf1wCYJq1ve/	1000	3	2022-07-19 17:29:36.674225+05:30	2022-07-18 21:17:41.243755+05:30	89	185	497832	The Royal SMM	412	\N
443	Cancelled	https://instagram.com/robin_dhiman1	6000	18	2022-07-19 17:32:48.276075+05:30	2022-07-18 23:21:32.291078+05:30	89	186	498107	The Royal SMM	\N	\N
444	Cancelled	https://www.instagram.com/reel/Cf1wCYJq1ve/?igshid=YmMyMTA2M2Y=	1000	35	2022-07-19 17:35:01.148159+05:30	2022-07-19 17:28:12.611024+05:30	75	185	\N	\N	\N	\N
447	Completed	https://instagram.com/pariyar9950	1000	35	2022-07-19 19:13:14.679965+05:30	2022-07-19 17:36:34.428055+05:30	75	185	499577	The Royal SMM	90	\N
411	Completed	https://www.instagram.com/p/Cdi-HBUt_u5/	50	0.6	2022-08-04 17:22:26.963353+05:30	2022-06-12 19:17:12.135721+05:30	79	3	356342	The Royal SMM	98	\N
460	Processing	https://instagram.com/deepakdhiman8583	1000	30	2022-07-27 18:34:58.297766+05:30	2022-07-27 18:34:57.63648+05:30	75	186	519511	The Royal SMM	\N	\N
461	Processing	https://instagram.com/gunjan.dhiman.3538	1000	30	2022-07-31 21:45:57.488083+05:30	2022-07-31 21:45:56.760475+05:30	75	186	529711	The Royal SMM	\N	\N
458	Completed	https://www.instagram.com/reel/CgezO1UBHEm/	5000	15	2022-08-01 17:23:21.195367+05:30	2022-07-27 12:26:30.047957+05:30	89	174	518688	The Royal SMM	223	\N
462	Completed	https://www.instagram.com/reel/CgoWgR5D4t5/	2000	6	2022-08-01 22:29:57.459125+05:30	2022-08-01 17:25:27.751588+05:30	89	174	15363	The Royal SMM	\N	\N
450	Processing	https://instagram.com/sabir_boss_302_jaitpur_mp16?igshid=YmMyMTA2M2Y=	20000	600	2022-07-19 18:22:51.100813+05:30	2022-07-19 18:04:33.882269+05:30	75	185	\N	\N	\N	\N
448	Completed	https://instagram.com/gourav_chef	1000	35	2022-07-19 19:13:16.176289+05:30	2022-07-19 17:37:12.232059+05:30	75	185	499581	The Royal SMM	331	\N
463	Processing	https://www.instagram.com/p/CgtX3serX0n/	300	3.6	2022-08-02 11:53:25.129056+05:30	2022-08-02 11:53:24.512334+05:30	79	174	533162	The Royal SMM	\N	\N
451	Processing	https://www.instagram.com/p/Cf394GglesY/	500	4	2022-07-20 07:55:38.657332+05:30	2022-07-20 07:55:37.950685+05:30	124	185	500600	The Royal SMM	\N	\N
464	Processing	https://www.instagram.com/reel/CgwReeipxwO/	1000	3	2022-08-02 17:00:17.40883+05:30	2022-08-02 17:00:16.662587+05:30	89	174	533868	The Royal SMM	\N	\N
465	Pending	https://www.instagram.com/reel/CdfQ3leDiiq/?igshid=YmMyMTA2M2Y=	1000	3	2022-08-06 16:47:44.221134+05:30	2022-08-06 16:47:44.221151+05:30	60	191	\N	\N	\N	\N
466	Pending	https://www.instagram.com/reel/CgghAwplySC/?igshid=YmMyMTA2M2Y=	200	5.6	2022-08-07 11:10:17.104381+05:30	2022-08-07 11:10:17.1044+05:30	50	191	\N	\N	\N	\N
452	Completed	https://www.instagram.com/p/CgJx66zr0m8/	500	6	2022-07-23 12:01:41.413522+05:30	2022-07-20 18:20:11.172104+05:30	79	174	501742	The Royal SMM	103	\N
453	Completed	https://www.instagram.com/p/CgRBVQ2rj5G/	500	6	2022-07-23 12:01:41.957885+05:30	2022-07-21 15:22:03.285366+05:30	79	174	503737	The Royal SMM	43	\N
454	Completed	https://www.instagram.com/reel/CgRVrhjJyjd/	1000	3	2022-07-23 12:01:42.479415+05:30	2022-07-21 19:12:12.09128+05:30	89	174	504314	The Royal SMM	241	\N
455	Processing	https://www.instagram.com/p/CgUFq1krQ1E/?igshid=YmMyMTA2M2Y=	1000	12	2022-07-23 12:04:25.00158+05:30	2022-07-22 17:45:29.211481+05:30	79	174	\N	\N	\N	\N
457	Processing	https://www.instagram.com/reel/Cgdk-dYDUHH/	1000	3	2022-07-26 15:37:57.292561+05:30	2022-07-26 15:37:56.508132+05:30	60	45	516604	The Royal SMM	\N	\N
456	Completed	https://www.instagram.com/p/Cgavz6NPGG6/	1000	12	2022-07-27 12:22:37.697729+05:30	2022-07-25 07:41:01.797407+05:30	79	174	512862	The Royal SMM	2	\N
481	Pending	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	1000	10	2022-08-13 18:33:21.190199+05:30	2022-08-13 18:33:21.19023+05:30	4	210	\N	\N	\N	\N
459	Completed	https://www.instagram.com/reel/CgezO1UBHEm/	500	6	2022-07-27 13:26:26.684896+05:30	2022-07-27 12:26:51.812524+05:30	79	174	518689	The Royal SMM	70	\N
446	Completed	https://www.instagram.com/reel/CajaIQ5IMVz/	6000	18	2022-07-27 18:32:44.019719+05:30	2022-07-19 17:34:59.572569+05:30	89	186	499569	The Royal SMM	3301	\N
449	Completed	https://instagram.com/robin_dhiman1	1000	30	2022-07-27 18:32:44.565808+05:30	2022-07-19 17:57:45.041195+05:30	75	186	499640	The Royal SMM	2017	\N
474	Cancelled	https://www.instagram.com/reel/CgUR97wpETF/	200	7	2022-08-13 15:54:26.067822+05:30	2022-08-13 14:06:44.800841+05:30	46	210	565893	The Royal SMM	\N	\N
468	Completed	https://www.instagram.com/reel/Cg_aAyeFs-i/	1000	12	2022-08-09 14:09:41.573271+05:30	2022-08-09 12:13:41.543165+05:30	79	180	552745	The Royal SMM	214	\N
467	Completed	https://www.instagram.com/reel/Cg_aAyeFs-i/	10000	80	2022-08-09 20:45:35.692961+05:30	2022-08-09 12:12:19.592242+05:30	34	180	552740	The Royal SMM	1612	\N
469	Pending	https://www.instagram.com/reel/ChCkzkmOX_j/?igshid=YmMyMTA2M2Y=	1000	3	2022-08-09 22:27:31.946036+05:30	2022-08-09 22:27:31.946058+05:30	60	180	\N	\N	\N	\N
470	Pending	https://www.instagram.com/reel/ChCkzkmOX_j/?igshid=YmMyMTA2M2Y=	1000	38	2022-08-10 11:36:33.096931+05:30	2022-08-09 22:28:11.913998+05:30	5	180	\N	\N	\N	\N
471	Processing	https://www.instagram.com/reel/ChCkzkmOX_j/?igshid=YmMyMTA2M2Y=	9000	27	2022-08-10 11:36:51.676071+05:30	2022-08-09 22:30:09.365379+05:30	60	180	\N	\N	\N	\N
476	Cancelled	https://instagram.com/raja_junnu?igshid=YmMyMTA2M2Y=	900	9	2022-08-13 15:55:35.709794+05:30	2022-08-13 14:48:43.374161+05:30	4	210	\N	\N	\N	\N
472	Processing	https://www.instagram.com/reel/ChFNNlZFAfH/	8000	40	2022-08-10 21:00:48.728956+05:30	2022-08-10 21:00:25.552708+05:30	34	180	557366	The Royal SMM	\N	\N
473	Processing	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	1000	10	2022-08-13 15:56:01.217033+05:30	2022-08-13 13:45:37.109913+05:30	4	210	\N	\N	\N	\N
477	Pending	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	1000	10	2022-08-13 16:58:24.132693+05:30	2022-08-13 16:58:24.132713+05:30	4	210	\N	\N	\N	\N
485	Completed	https://instagram.com/_soham__chakraborty	1000	33	2022-08-14 15:40:30.894637+05:30	2022-08-14 15:05:40.717027+05:30	47	208	569218	The Royal SMM	336	\N
475	Completed	https://instagram.com/reyakhan301	100	3.5	2022-08-13 18:23:34.543999+05:30	2022-08-13 14:27:53.986006+05:30	46	210	565942	The Royal SMM	7	\N
478	Completed	https://instagram.com/raja_junnu	150	5.25	2022-08-13 18:23:35.129388+05:30	2022-08-13 17:04:42.277773+05:30	46	210	566292	The Royal SMM	14740	\N
479	Processing	https://instagram.com/afzal2077_rangrezz	1000	35	2022-08-13 18:26:21.860995+05:30	2022-08-13 18:26:21.093888+05:30	46	210	566494	The Royal SMM	\N	\N
480	Processing	https://instagram.com/raja_junnu	1000	35	2022-08-13 18:29:02.696447+05:30	2022-08-13 18:29:02.005549+05:30	46	210	566499	The Royal SMM	\N	\N
483	Processing	https://instagram.com/junnu_4uhh	1000	35	2022-08-14 08:38:16.312758+05:30	2022-08-14 08:38:15.619953+05:30	46	210	568311	The Royal SMM	\N	\N
484	Processing	https://instagram.com/junnu_4uhh	1000	35	2022-08-14 08:45:42.351966+05:30	2022-08-14 08:45:41.69513+05:30	46	210	568327	The Royal SMM	\N	\N
482	Completed	https://instagram.com/samratmukh2341	1000	33	2022-08-14 15:17:06.986008+05:30	2022-08-14 08:31:35.409784+05:30	47	208	568303	The Royal SMM	3434	\N
487	Processing	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	100	3.8	2022-08-14 16:06:27.905549+05:30	2022-08-14 15:59:06.46199+05:30	5	210	\N	\N	\N	\N
488	Pending	https://www.instagram.com/p/ChPKw3eJgcs/?igshid=YmMyMTA2M2Y=	1000	38	2022-08-14 16:18:39.824286+05:30	2022-08-14 16:18:39.824305+05:30	5	210	\N	\N	\N	\N
486	Processing	https://instagram.com/raja_junnu	1000	35	2022-08-14 16:06:14.81948+05:30	2022-08-14 15:57:42.612326+05:30	46	210	569377	The Royal SMM	\N	\N
489	Pending	https://www.instagram.com/p/ChPKw3eJgcs/?igshid=YmMyMTA2M2Y=	109	4.142	2022-08-14 16:19:17.470737+05:30	2022-08-14 16:19:17.470755+05:30	5	210	\N	\N	\N	\N
491	Cancelled	https://instagram.com/suryacircles_45?igshid=YmMyMTA2M2Y=	1000	58	2022-08-15 13:48:14.832453+05:30	2022-08-15 13:44:25.876192+05:30	83	217	\N	\N	\N	\N
492	Processing	https://instagram.com/suryacircles_45	1000	58	2022-08-15 13:49:38.013394+05:30	2022-08-15 13:49:04.440917+05:30	85	217	572780	The Royal SMM	\N	\N
490	Completed	https://instagram.com/krishnendu9159	1000	33	2022-08-16 20:06:30.684075+05:30	2022-08-15 12:26:37.978941+05:30	47	208	572505	The Royal SMM	196	\N
628	Completed	https://youtu.be/iYIutpTv9MM	1000	200	2022-08-27 23:02:30.87584+05:30	2022-08-27 15:39:06.334274+05:30	25	49	\N	\N	\N	\N
505	Completed	https://instagram.com/trish_andeep	2000	110	2022-08-20 20:11:51.200408+05:30	2022-08-19 09:47:39.552954+05:30	76	208	591605	The Royal SMM	\N	\N
528	Completed	https://instagram.com/splendor_lovers816	11	0.88	2022-09-02 16:20:36.456104+05:30	2022-08-22 08:05:52.505084+05:30	77	239	600969	The Royal SMM	1091	\N
510	Completed	https://www.instagram.com/reel/ChBxZF_JZOl/	500	10	2022-08-23 12:34:47.461516+05:30	2022-08-20 22:11:50.579092+05:30	133	3	596960	The Royal SMM	178	\N
513	Completed	https://instagram.com/its_kailash_m007	1000	38	2022-08-23 12:34:48.033989+05:30	2022-08-21 13:21:36.309749+05:30	128	3	598688	The Royal SMM	388	\N
511	Processing	https://instagram.com/sana__khan_097	500	20	2022-08-20 23:30:49.408916+05:30	2022-08-20 23:30:48.657309+05:30	125	238	597235	The Royal SMM	\N	\N
499	Completed	https://instagram.com/sanju_sain_oo7	1000	35	2022-08-18 13:24:18.151422+05:30	2022-08-18 13:16:03.199068+05:30	46	49	584297	The Royal SMM	5600	\N
498	Completed	https://instagram.com/trish_andeep	1000	60	2022-08-18 13:54:03.899604+05:30	2022-08-18 13:06:44.822878+05:30	73	208	584254	The Royal SMM	\N	\N
496	Completed	https://instagram.com/_soham__chakraborty	1000	60	2022-08-18 13:54:04.43807+05:30	2022-08-17 10:07:23.282425+05:30	73	208	580153	The Royal SMM	1050	\N
493	Completed	https://www.instagram.com/p/ChSWrT0B9sz/	750	9.75	2022-08-21 00:24:57.616041+05:30	2022-08-15 22:07:11.755339+05:30	61	219	574670	The Royal SMM	26	\N
501	Completed	https://instagram.com/trish_andeep	1000	60	2022-08-18 15:12:31.335064+05:30	2022-08-18 14:24:09.100914+05:30	73	208	589059	The Royal SMM	\N	\N
509	Completed	https://www.instagram.com/reel/ChBxZF_JZOl/	1000	7	2022-08-23 12:34:46.930274+05:30	2022-08-20 22:11:12.109183+05:30	132	3	596958	The Royal SMM	368	\N
507	Cancelled	https://www.instagram.com/reel/ChBxZF_JZOl/?igshid=YmMyMTA2M2Y=	500	10	2022-08-21 11:56:19.838116+05:30	2022-08-20 22:07:57.581239+05:30	133	3	\N	\N	\N	\N
508	Cancelled	https://www.instagram.com/reel/ChBxZF_JZOl/?igshid=YmMyMTA2M2Y=	1000	7	2022-08-21 11:56:32.664796+05:30	2022-08-20 22:08:21.870505+05:30	132	3	\N	\N	\N	\N
538	Completed	https://www.instagram.com/p/ChYqR3DPZGG/	50	0.6	2022-08-23 23:42:01.522603+05:30	2022-08-22 11:16:46.0889+05:30	79	234	601292	The Royal SMM	0	\N
520	Processing	https://instagram.com/chetan_kumawat_8094	200	12	2022-08-21 18:19:09.010835+05:30	2022-08-21 18:19:08.339519+05:30	73	245	599465	The Royal SMM	\N	\N
503	Completed	https://instagram.com/abhishek_vishnoii_292929	1000	35	2022-08-18 15:53:22.61461+05:30	2022-08-18 15:45:53.980446+05:30	46	49	589276	The Royal SMM	1128	\N
504	Processing	https://instagram.com/abhishek_vishnoii_292929?igshid=YmMyMTA2M2Y=	1000	35	2022-08-18 15:54:59.051354+05:30	2022-08-18 15:46:47.053416+05:30	46	49	\N	\N	\N	\N
494	Partial	https://instagram.com/yadavanuj72	700	56	2022-08-16 10:24:44.483941+05:30	2022-08-16 07:28:06.285056+05:30	77	220	575688	The Royal SMM	\N	\N
495	Partial	https://instagram.com/yadavanuj72	50	4	2022-08-16 10:24:45.139572+05:30	2022-08-16 08:47:58.020372+05:30	77	220	575850	The Royal SMM	\N	\N
515	Processing	https://instagram.com/addtyia	1000	40	2022-08-21 15:50:19.563367+05:30	2022-08-21 15:50:18.828451+05:30	125	238	599115	The Royal SMM	\N	\N
502	Completed	https://instagram.com/trish_andeep	1000	55	2022-08-18 19:37:37.530947+05:30	2022-08-18 15:45:31.442324+05:30	76	208	589274	The Royal SMM	\N	\N
497	Partial	https://www.instagram.com/p/CgmeLA1P3JH/	500	31	2022-08-17 14:52:41.026528+05:30	2022-08-17 14:03:47.298564+05:30	74	224	580734	The Royal SMM	\N	\N
518	Processing	https://instagram.com/sukh_x74?igshid=YmMyMTA2M2Y=	1000	40	2022-08-21 18:36:51.816645+05:30	2022-08-21 18:00:03.08369+05:30	125	238	\N	\N	\N	\N
519	Pending	https://instagram.com/sukh_x74?igshid=YmMyMTA2M2Y=	500	20	2022-08-21 18:38:43.17322+05:30	2022-08-21 18:14:49.33383+05:30	125	238	\N	\N	\N	\N
514	Completed	https://instagram.com/happytriphati	25	1	2022-08-21 16:19:08.594994+05:30	2022-08-21 13:33:04.299463+05:30	125	49	598729	The Royal SMM	1306	\N
521	Processing	https://www.instagram.com/p/CheGHa1P9iX/	300	3.6	2022-08-21 19:06:49.543754+05:30	2022-08-21 19:06:48.859657+05:30	66	245	599607	The Royal SMM	\N	\N
516	Completed	https://instagram.com/happytriphati	1500	60	2022-08-21 17:13:51.869861+05:30	2022-08-21 16:15:06.437081+05:30	125	49	599164	The Royal SMM	1332	\N
517	Completed	https://instagram.com/happytriphati	160	6.4	2022-08-21 17:13:52.432758+05:30	2022-08-21 16:45:39.273822+05:30	125	49	599231	The Royal SMM	2909	\N
522	Processing	https://www.instagram.com/p/CfLAAwNvWxf/	300	3.6	2022-08-21 19:07:31.818361+05:30	2022-08-21 19:07:31.262251+05:30	66	245	599609	The Royal SMM	\N	\N
534	Completed	https://instagram.com/splendor_lovers816	20	0.98	2022-09-02 16:20:38.155422+05:30	2022-08-22 09:33:55.075544+05:30	126	239	601119	The Royal SMM	1169	\N
500	Processing	https://instagram.com/trish_andeep?igshid=YmMyMTA2M2Y=	1000	60	2022-08-24 21:57:36.228642+05:30	2022-08-18 13:39:14.715426+05:30	73	208	\N	\N	\N	\N
525	Completed	https://instagram.com/happytriphati	100	4	2022-08-22 07:13:18.565806+05:30	2022-08-21 22:12:58.525794+05:30	125	49	600158	The Royal SMM	3919	\N
524	Completed	https://instagram.com/happytriphati	800	32	2022-08-21 21:56:00.341025+05:30	2022-08-21 21:31:30.123069+05:30	125	49	600038	The Royal SMM	3078	\N
536	Completed	https://www.instagram.com/reel/Chi5IwSj1r9/	200	2.4	2022-08-22 11:00:49.967334+05:30	2022-08-22 10:28:16.092413+05:30	79	49	601214	The Royal SMM	14	\N
531	Completed	https://instagram.com/er_faheem_husain009	300	12	2022-08-22 11:00:49.448107+05:30	2022-08-22 08:42:05.685216+05:30	125	49	601028	The Royal SMM	7203	\N
527	Pending	https://instagram.com/splendor_lovers816?igshid=YmMyMTA2M2Y=	200	9	2022-08-22 08:02:38.695139+05:30	2022-08-22 08:02:38.695158+05:30	81	239	\N	\N	\N	\N
529	Completed	https://instagram.com/splendor_lovers816	50	4	2022-09-02 16:20:37.1173+05:30	2022-08-22 08:19:06.531594+05:30	77	239	600995	The Royal SMM	1105	\N
530	Completed	https://www.instagram.com/reel/ChWXvXtg_iT/	200	2.4	2022-09-02 16:20:37.625252+05:30	2022-08-22 08:32:14.418648+05:30	79	239	601011	The Royal SMM	126	\N
532	Processing	https://www.instagram.com/p/ChjA5elPdkN/	10	0.12	2022-08-22 09:21:35.845+05:30	2022-08-22 09:21:35.16082+05:30	66	245	601087	The Royal SMM	\N	\N
533	Pending	https://www.instagram.com/reel/ChWXvXtg_iT/?igshid=YmMyMTA2M2Y=	2	0.16	2022-08-22 09:22:52.579084+05:30	2022-08-22 09:22:52.579108+05:30	77	239	\N	\N	\N	\N
537	Pending	https://www.instagram.com/reel/ChWXvXtg_iT/?igshid=YmMyMTA2M2Y=	200	2	2022-08-22 10:55:09.755407+05:30	2022-08-22 10:55:09.755425+05:30	4	239	\N	\N	\N	\N
526	Completed	https://instagram.com/er_faheem_husain009	20	0.8	2022-08-22 11:00:48.906029+05:30	2022-08-22 07:09:04.059531+05:30	125	49	600915	The Royal SMM	7182	\N
512	Completed	https://www.instagram.com/p/Chffm4BvAHi/	800	12	2022-08-22 16:31:58.313622+05:30	2022-08-21 00:24:46.942351+05:30	88	219	597353	The Royal SMM	0	\N
523	Completed	https://instagram.com/xx_crizy_omya_xx	100	4	2022-08-22 11:18:37.27885+05:30	2022-08-21 20:13:48.285136+05:30	125	234	599821	The Royal SMM	258	\N
506	Processing	https://instagram.com/arjun9103_____?igshid=YmMyMTA2M2Y=	1000	35	2022-08-28 15:59:58.49006+05:30	2022-08-19 20:52:51.736571+05:30	46	229	\N	\N	\N	\N
535	Completed	https://1club.app/yung_sweeter18	50	4	2022-08-22 19:37:47.760935+05:30	2022-08-22 09:50:38.143884+05:30	77	250	601160	The Royal SMM	\N	\N
548	Completed	https://instagram.com/samratmukh2341	2000	80	2022-08-23 13:32:22.371868+05:30	2022-08-23 13:02:20.890931+05:30	125	208	604889	The Royal SMM	3645	\N
557	Processing	https://instagram.com/innocent_girl_sim	250	10	2022-08-23 20:50:54.959293+05:30	2022-08-23 20:50:54.300757+05:30	125	238	606319	The Royal SMM	\N	\N
540	Completed	https://www.instagram.com/p/ChWkdpQv2KA/	200	6	2022-08-23 13:34:16.059107+05:30	2022-08-22 16:34:40.808199+05:30	51	219	601978	The Royal SMM	16	\N
570	Completed	https://www.instagram.com/reel/Cho4h3zDwlb/	10	0.12	2022-09-02 16:20:39.196664+05:30	2022-08-24 16:05:34.541107+05:30	79	239	608602	The Royal SMM	14	\N
551	Pending	https://instagram.com/fambruh_friend_?igshid=YmMyMTA2M2Y=	1000	40	2022-08-23 15:23:00.409271+05:30	2022-08-23 15:23:00.410173+05:30	125	49	\N	\N	\N	\N
550	Completed	https://instagram.com/fambruh_friend_	1000	40	2022-08-23 15:43:52.137012+05:30	2022-08-23 15:18:23.284669+05:30	125	49	605252	The Royal SMM	1493	\N
552	Completed	https://instagram.com/sonu_yadav1076	1000	40	2022-08-23 16:09:27.574907+05:30	2022-08-23 15:43:35.430373+05:30	125	49	605316	The Royal SMM	478	\N
539	Completed	https://1club.app/yung_sweeter18	100	8	2022-08-22 20:03:36.645136+05:30	2022-08-22 14:06:59.495887+05:30	77	250	601674	The Royal SMM	\N	\N
547	Completed	https://instagram.com/splendor_lovers816	100	4.9	2022-09-02 16:20:41.138544+05:30	2022-08-23 09:50:44.457544+05:30	126	239	604414	The Royal SMM	1187	\N
541	Cancelled	https://instagram.com/_copy_crystal_	1000	80	2022-08-22 20:09:31.028658+05:30	2022-08-22 19:34:42.251932+05:30	77	250	602467	The Royal SMM	\N	\N
581	Completed	https://instagram.com/mr_shivaay_vyas	2000	76	2022-08-27 13:19:36.120964+05:30	2022-08-25 09:49:00.540202+05:30	128	3	610471	The Royal SMM	1084	\N
553	Completed	https://instagram.com/chhote_sarkar_3333	20	0.6	2022-08-23 17:16:20.466171+05:30	2022-08-23 16:14:13.961765+05:30	125	49	605393	The Royal SMM	3797	\N
573	Processing	https://instagram.com/official__sahil3387	500	20	2022-08-24 18:56:16.209921+05:30	2022-08-24 18:56:15.419477+05:30	125	238	609149	The Royal SMM	\N	\N
566	Completed	https://www.instagram.com/reel/Cho4h3zDwlb/	10	0.13	2022-09-02 16:20:42.832817+05:30	2022-08-24 16:00:16.265643+05:30	61	239	608583	The Royal SMM	0	\N
546	Completed	https://instagram.com/_._evuu__	1000	40	2022-08-23 12:09:00.69497+05:30	2022-08-23 08:46:59.476078+05:30	125	49	604281	The Royal SMM	86	\N
542	Completed	https://www.instagram.com/reel/Chj_3t5Bpve/	5000	35	2022-08-23 12:34:48.574812+05:30	2022-08-22 20:08:26.179592+05:30	132	3	602610	The Royal SMM	54	\N
543	Completed	https://www.instagram.com/reel/Chj_3t5Bpve/	200	4	2022-08-23 12:34:49.103414+05:30	2022-08-22 20:08:46.126351+05:30	133	3	602613	The Royal SMM	13	\N
545	Completed	https://instagram.com/trish_andeep	2000	98	2022-08-23 12:58:56.113747+05:30	2022-08-22 21:17:19.775652+05:30	126	208	602961	The Royal SMM	\N	\N
559	Completed	https://www.instagram.com/reel/CcX6Sbrpt2d/	100	1.2	2022-08-23 23:01:04.022469+05:30	2022-08-23 21:47:40.41933+05:30	79	49	606505	The Royal SMM	310	\N
562	Pending	https://www.instagram.com/reel/ChnApHOlTe12vzSauL6Y_2L41Vh-ocfXGAMn2s0/?igshid=YmMyMTA2M2Y=	1	0.012	2022-08-23 23:44:41.033323+05:30	2022-08-23 23:44:41.033341+05:30	79	234	\N	\N	\N	\N
555	Completed	https://instagram.com/sahil_parmar_001	50	1.5	2022-08-23 21:27:27.074384+05:30	2022-08-23 17:33:08.396095+05:30	125	49	605635	The Royal SMM	282	\N
558	Completed	https://instagram.com/fak_love__i_am_singal_420	140	4.2	2022-08-23 21:38:33.540073+05:30	2022-08-23 20:57:50.071059+05:30	125	49	606337	The Royal SMM	104	\N
564	Pending	https://www.instagram.com/reel/Cho4h3zDwlb/?igshid=YmMyMTA2M2Y=	20	0.76	2022-08-24 15:57:50.590462+05:30	2022-08-24 15:57:50.59048+05:30	5	239	\N	\N	\N	\N
565	Pending	https://www.instagram.com/reel/Cho4h3zDwlb/?igshid=YmMyMTA2M2Y=	10	0.45	2022-08-24 15:59:16.781228+05:30	2022-08-24 15:59:16.781247+05:30	81	239	\N	\N	\N	\N
574	Completed	https://instagram.com/happytriphati	400	12	2022-08-24 21:08:49.44408+05:30	2022-08-24 19:34:09.312039+05:30	125	49	609286	The Royal SMM	4020	\N
563	Completed	https://instagram.com/indian_army__zakhmi_agniveer	10	0.3	2022-08-24 19:36:03.97392+05:30	2022-08-24 11:49:04.222761+05:30	125	49	607986	The Royal SMM	21471	\N
575	Processing	https://instagram.com/happytriphati?igshid=YmMyMTA2M2Y=	500	15	2022-08-24 20:45:33.430944+05:30	2022-08-24 19:44:57.573552+05:30	125	49	\N	\N	\N	\N
571	Processing	https://www.instagram.com/reel/Cho4h3zDwlb/?igshid=YmMyMTA2M2Y=	20	0.24	2022-08-24 21:39:40.318082+05:30	2022-08-24 16:06:59.112127+05:30	79	239	\N	\N	\N	\N
576	Processing	https://instagram.com/happytriphati?igshid=YmMyMTA2M2Y=	200	6	2022-08-24 21:30:10.939979+05:30	2022-08-24 20:49:12.976328+05:30	125	49	\N	\N	\N	\N
577	Completed	https://www.instagram.com/reel/Choqu7fJx0i/	100	1.2	2022-08-24 21:22:16.243035+05:30	2022-08-24 21:08:13.908092+05:30	79	49	609566	The Royal SMM	27	\N
572	Processing	https://www.instagram.com/reel/Cho4h3zDwlb/?igshid=YmMyMTA2M2Y=	100	0.3	2022-08-24 21:30:39.225563+05:30	2022-08-24 16:08:32.38678+05:30	89	239	\N	\N	\N	\N
579	Completed	https://instagram.com/happytriphati	300	9	2022-08-24 21:37:06.164984+05:30	2022-08-24 21:21:24.979278+05:30	125	49	609604	The Royal SMM	5069	\N
569	Processing	https://www.instagram.com/reel/Cho4h3zDwlb/?igshid=YmMyMTA2M2Y=	200	2	2022-08-24 21:40:09.196202+05:30	2022-08-24 16:04:17.205445+05:30	4	239	\N	\N	\N	\N
568	Pending	https://www.instagram.com/reel/Cho4h3zDwlb/?igshid=YmMyMTA2M2Y=	10	0.4	2022-08-24 21:40:39.343906+05:30	2022-08-24 16:03:31.275258+05:30	67	239	16410	\N	\N	\N
567	Processing	https://www.instagram.com/reel/Cho4h3zDwlb/?igshid=YmMyMTA2M2Y=	10	0.13	2022-08-24 21:40:56.600225+05:30	2022-08-24 16:01:57.897819+05:30	61	239	\N	\N	\N	\N
554	Processing	https://www.instagram.com/reel/ChBL6zthTHs/?igshid=YmMyMTA2M2Y=	1000	3	2022-08-24 21:45:21.274318+05:30	2022-08-23 17:12:37.767179+05:30	60	208	\N	\N	\N	\N
560	Processing	https://instagram.com/sahil_parmar_001?igshid=YmMyMTA2M2Y=	500	15	2022-08-24 21:46:51.03296+05:30	2022-08-23 22:21:00.931864+05:30	125	49	\N	\N	\N	\N
578	Completed	https://instagram.com/lx__vashu__0776	1000	38	2022-08-24 21:50:06.67728+05:30	2022-08-24 21:16:22.189124+05:30	128	3	609590	The Royal SMM	940	\N
580	Processing	https://www.instagram.com/reel/ChpfP1SKDl4/	50	0.6	2022-08-24 22:26:56.251172+05:30	2022-08-24 22:26:55.558698+05:30	79	238	609750	The Royal SMM	\N	\N
582	Completed	https://instagram.com/aritra_7_jarvis	2000	76	2022-08-27 13:19:36.705688+05:30	2022-08-25 09:50:40.789927+05:30	128	3	610473	The Royal SMM	70	\N
549	Completed	https://www.instagram.com/p/ChmCN7gvI-e/	2000	30	2022-08-28 01:26:16.65129+05:30	2022-08-23 13:34:05.647884+05:30	88	219	604983	The Royal SMM	5	\N
584	Pending	https://instagram.com/punjabi__couples_16?igshid=YmMyMTA2M2Y=	5	0.245	2022-08-25 11:29:44.732535+05:30	2022-08-25 11:29:44.732555+05:30	126	239	\N	\N	\N	\N
556	Processing	https://instagram.com/fak_love__i_am_singal_420?igshid=YmMyMTA2M2Y=	1000	30	2022-08-25 22:18:50.044682+05:30	2022-08-23 20:13:51.870981+05:30	125	49	\N	\N	\N	\N
544	Completed	https://instagram.com/_copy_crystal_	2000	90	2022-08-26 19:05:41.370078+05:30	2022-08-22 20:24:16.585034+05:30	127	250	602745	The Royal SMM	116	\N
611	Completed	https://instagram.com/iw.nursing_academy_bhopal	50	1.5	2022-08-27 11:00:41.853374+05:30	2022-08-27 10:34:19.209002+05:30	125	49	616119	The Royal SMM	61	\N
583	Completed	https://www.instagram.com/editorboy_ziddi/	900	27	2022-08-25 12:01:40.771501+05:30	2022-08-25 11:05:56.554588+05:30	125	49	610629	The Royal SMM	3614	\N
613	Completed	https://instagram.com/iw.nursing_academy_bhopal	1000	30	2022-08-27 11:00:42.367344+05:30	2022-08-27 10:54:04.908611+05:30	125	49	616152	The Royal SMM	114	\N
602	Completed	https://instagram.com/nana_chiroju	1000	45	2022-08-26 19:15:51.922335+05:30	2022-08-26 18:33:04.474175+05:30	127	250	614403	The Royal SMM	429	\N
586	Processing	https://instagram.com/chetan_kumawat_8094	250	8.75	2022-08-25 12:41:53.523836+05:30	2022-08-25 12:41:52.862202+05:30	46	245	610813	The Royal SMM	\N	\N
587	Processing	https://www.instagram.com/p/ChqxQ-wPOY2/	80	0.96	2022-08-25 12:42:58.413195+05:30	2022-08-25 12:42:57.694204+05:30	66	245	610814	The Royal SMM	\N	\N
590	Completed	https://instagram.com/rc__tweetz	50	2.45	2022-09-02 16:20:43.952269+05:30	2022-08-25 17:47:45.597314+05:30	126	239	611578	The Royal SMM	9299	\N
591	Completed	https://instagram.com/splendor_lovers816	75	3.675	2022-09-02 16:20:44.468937+05:30	2022-08-25 17:50:05.386603+05:30	126	239	611586	The Royal SMM	1273	\N
615	Partial	https://www.instagram.com/reel/ChwIsbkDehx/	5000	15	2022-09-05 19:04:52.099498+05:30	2022-08-27 11:35:13.800941+05:30	89	49	616317	The Royal SMM	2	\N
624	Processing	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	10000	100	2022-08-27 19:37:01.475051+05:30	2022-08-27 15:31:32.354485+05:30	4	272	\N	\N	\N	\N
606	Processing	https://instagram.com/octobergirl_sanjana__9245?igshid=YmMyMTA2M2Y=	1000	45	2022-08-26 20:47:03.833701+05:30	2022-08-26 20:46:48.411141+05:30	127	250	\N	\N	\N	\N
608	Canceled	https://www.instagram.com/p/Cg5vCW7LzSR/	50	1.75	2022-08-30 08:38:55.881652+05:30	2022-08-26 21:10:21.857274+05:30	129	270	614834	The Royal SMM	0	\N
605	Processing	https://instagram.com/pinkygurung999?igshid=YmMyMTA2M2Y=	1000	45	2022-08-26 20:47:35.440575+05:30	2022-08-26 19:36:19.725968+05:30	127	250	\N	\N	\N	\N
596	Completed	https://instagram.com/socialmediapramoter_	250	11.25	2022-08-26 10:24:23.504051+05:30	2022-08-26 07:15:21.379007+05:30	127	268	612897	The Royal SMM	300	\N
603	Processing	https://instagram.com/numlamyati?igshid=YmMyMTA2M2Y=	1000	45	2022-08-26 20:48:24.01605+05:30	2022-08-26 18:58:07.020921+05:30	127	250	\N	\N	\N	\N
585	Completed	https://instagram.com/happytriphati	100	3	2022-08-25 21:02:41.141979+05:30	2022-08-25 12:00:23.758834+05:30	125	49	610741	The Royal SMM	5987	\N
592	Completed	https://instagram.com/sahil_parmar_001	500	15	2022-08-25 21:02:41.720347+05:30	2022-08-25 19:07:53.471646+05:30	125	49	611759	The Royal SMM	860	\N
589	Completed	https://www.instagram.com/reel/Chrn8pxJo0N/	300	4.5	2022-09-02 16:20:43.358308+05:30	2022-08-25 17:43:32.094591+05:30	88	239	611568	The Royal SMM	17	\N
617	Completed	https://www.instagram.com/reel/ChwIsbkDehx/	2000	24	2022-08-27 12:46:13.817984+05:30	2022-08-27 11:57:20.708073+05:30	79	49	616379	The Royal SMM	1	\N
619	Completed	https://instagram.com/raja_junnu	1000	35	2022-08-27 12:48:44.441721+05:30	2022-08-27 12:11:34.462687+05:30	46	272	616427	The Royal SMM	15358	\N
594	Completed	https://instagram.com/socialmediapramoter_	200	20	2022-08-27 16:10:13.521702+05:30	2022-08-25 19:35:49.869494+05:30	30	268	611827	The Royal SMM	582	\N
630	Completed	https://instagram.com/7916.laxmi	1000	45	2022-08-27 17:07:58.530839+05:30	2022-08-27 16:31:07.487393+05:30	127	250	617121	The Royal SMM	\N	\N
601	Completed	https://instagram.com/octobergirl_sanjana__9245	1000	45	2022-08-26 19:05:41.884517+05:30	2022-08-26 18:02:54.995737+05:30	127	250	614332	The Royal SMM	435	\N
599	Completed	https://instagram.com/oye_sadia	500	19	2022-08-27 09:54:17.140847+05:30	2022-08-26 12:38:15.153296+05:30	49	271	613591	The Royal SMM	960	\N
600	Completed	https://instagram.com/oye_sadia	450	20.25	2022-08-27 09:54:17.674786+05:30	2022-08-26 12:55:59.409194+05:30	127	271	613617	The Royal SMM	1571	\N
595	Processing	https://instagram.com/ll._goldy._ll?igshid=YmMyMTA2M2Y=	250	3.75	2022-08-25 22:06:25.856017+05:30	2022-08-25 21:36:59.381161+05:30	133	268	\N	\N	\N	\N
604	Completed	https://www.instagram.com/reel/CfIr7BrgNFK/	50	0.6	2022-08-27 10:31:23.820253+05:30	2022-08-26 19:23:57.274375+05:30	79	49	614544	The Royal SMM	30	\N
618	Processing	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	1000	10	2022-08-27 13:14:22.548087+05:30	2022-08-27 12:03:01.754764+05:30	4	272	\N	\N	\N	\N
614	Completed	https://instagram.com/iw.nursing_academy_bhopal	1000	45	2022-08-27 11:35:22.657794+05:30	2022-08-27 10:57:20.854405+05:30	127	49	616168	The Royal SMM	1205	\N
616	Processing	https://www.instagram.com/reel/ChwIsbkDehx/?igshid=YmMyMTA2M2Y=	1000	3	2022-08-27 13:14:59.220273+05:30	2022-08-27 11:38:35.406686+05:30	89	49	\N	\N	\N	\N
612	Processing	https://youtube.com/channel/UCim6qiuMOIK67d6fOqm9t1w	50	22.5	2022-08-27 13:15:22.416514+05:30	2022-08-27 10:40:06.995732+05:30	23	49	\N	\N	\N	\N
607	Processing	https://www.instagram.com/reel/Cfi3WNqLp01/?igshid=YmMyMTA2M2Y=	10	0.55	2022-08-27 13:17:23.200627+05:30	2022-08-26 20:51:35.824814+05:30	52	270	\N	\N	\N	\N
609	Processing	https://instagram.com/rattanranjit	1000	75	2022-08-27 13:24:12.86711+05:30	2022-08-27 09:52:16.557801+05:30	131	271	615995	The Royal SMM	\N	\N
610	Processing	https://youtube.com/channel/UCim6qiuMOIK67d6fOqm9t1w	50	22.5	2022-08-27 13:17:41.648909+05:30	2022-08-27 10:30:07.197424+05:30	23	49	\N	\N	\N	\N
598	Processing	https://www.instagram.com/reel/ChWxY3crM4W/?igshid=YmMyMTA2M2Y=	1000	3	2022-08-27 13:19:10.064127+05:30	2022-08-26 10:48:29.073991+05:30	60	270	\N	\N	\N	\N
621	Processing	https://instagram.com/trollcasmic_high_2	200	7.6	2022-08-27 14:40:11.478978+05:30	2022-08-27 14:29:49.409119+05:30	128	280	616776	The Royal SMM	0	\N
622	In progress	https://www.instagram.com/p/ChiHE4shkID/	100	1.5	2022-08-27 14:40:12.013239+05:30	2022-08-27 14:33:11.530286+05:30	133	280	616796	The Royal SMM	0	\N
620	Completed	https://www.instagram.com/p/Chq8q2dMi5b/	20	2.8	2022-08-27 15:36:23.883773+05:30	2022-08-27 13:03:49.899604+05:30	86	49	616550	The Royal SMM	\N	\N
597	Canceled	https://instagram.com/stories/danishraza9389/2912725944878113638	100	4.5	2022-08-30 08:38:55.011447+05:30	2022-08-26 09:00:23.237167+05:30	127	270	613102	The Royal SMM	\N	\N
593	Processing	https://instagram.com/ll._goldy._ll	300	4.5	2022-09-01 09:22:15.128152+05:30	2022-08-25 19:22:11.644261+05:30	133	268	611784	The Royal SMM	\N	\N
623	Completed	https://youtube.com/channel/UCim6qiuMOIK67d6fOqm9t1w	1000	450	2022-08-27 23:08:59.19158+05:30	2022-08-27 15:22:58.864298+05:30	23	49	\N	\N	\N	\N
625	Completed	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	1000	38	2022-08-27 19:39:17.299734+05:30	2022-08-27 15:32:06.661165+05:30	5	272	\N	\N	\N	\N
626	Completed	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	100	3.8	2022-08-27 19:38:30.229481+05:30	2022-08-27 15:32:39.231807+05:30	5	272	\N	\N	\N	\N
627	Completed	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	290	11.02	2022-08-27 19:38:38.659584+05:30	2022-08-27 15:33:25.561726+05:30	5	272	\N	\N	\N	\N
629	Completed	https://instagram.com/7916.laxmi	500	22.5	2022-08-27 20:19:35.299816+05:30	2022-08-27 16:02:30.010432+05:30	127	250	15361	The Royal SMM	\N	\N
631	Completed	https://instagram.com/nana_chiroju	1000	45	2022-08-28 18:23:19.081239+05:30	2022-08-27 17:35:17.656037+05:30	127	250	617302	The Royal SMM	1450	\N
635	Processing	https://www.instagram.com/p/Chwt8DUocwr/	1000	12	2022-08-27 18:16:26.522697+05:30	2022-08-27 18:16:25.832542+05:30	66	245	617468	The Royal SMM	\N	\N
636	Processing	https://www.instagram.com/p/ChwtQOAIaoT/	1000	12	2022-08-27 18:16:47.867155+05:30	2022-08-27 18:16:47.303576+05:30	66	245	617469	The Royal SMM	\N	\N
637	Processing	https://www.instagram.com/p/ChwI3tqB5p2/	1000	12	2022-08-27 18:17:08.293169+05:30	2022-08-27 18:17:07.711678+05:30	66	245	617471	The Royal SMM	\N	\N
638	Processing	https://www.instagram.com/p/ChwA-xkh9jA/	600	7.2	2022-08-27 18:17:28.962218+05:30	2022-08-27 18:17:28.262789+05:30	66	245	617475	The Royal SMM	\N	\N
648	Completed	https://instagram.com/rosemery8922	1000	38	2022-08-28 18:51:37.415139+05:30	2022-08-28 18:26:54.552915+05:30	128	250	620379	The Royal SMM	1210	\N
649	Completed	https://instagram.com/nandini_sonar.1k	1000	38	2022-08-28 18:51:37.971749+05:30	2022-08-28 18:38:15.653244+05:30	128	250	620421	The Royal SMM	1029	\N
650	In progress	https://instagram.com/rosemery8922?igshid=NmNmNjAwNzg=	2000	76	2022-08-28 18:53:54.650979+05:30	2022-08-28 18:45:20.121049+05:30	128	250	\N	\N	\N	\N
634	Processing	https://instagram.com/chetan_kumawat_thanwala_?igshid=YmMyMTA2M2Y=	1000	35	2022-08-27 20:21:31.227655+05:30	2022-08-27 18:15:54.631868+05:30	46	245	\N	\N	\N	\N
632	Processing	https://instagram.com/chetan_kumawat_thanwala_	1000	35	2022-08-27 20:24:41.955332+05:30	2022-08-27 18:15:18.481117+05:30	46	245	617466	The Royal SMM	\N	\N
633	In progress	https://instagram.com/chetan_kumawat_thanwala_?igshid=YmMyMTA2M2Y=	1000	35	2022-08-27 20:25:01.886227+05:30	2022-08-27 18:15:37.013765+05:30	46	245	15361	\N	\N	\N
639	Processing	https://www.instagram.com/p/ChwEE4ZJwTP/	100	1.2	2022-08-28 01:26:18.547576+05:30	2022-08-28 01:25:59.202775+05:30	79	219	618707	The Royal SMM	\N	\N
657	Completed	https://instagram.com/rin_shad_1357_	150	5.7	2022-08-30 13:31:46.824248+05:30	2022-08-29 16:39:38.881342+05:30	128	268	622825	The Royal SMM	1122	\N
656	Completed	https://instagram.com/parbejkhan_890	150	5.7	2022-08-30 13:31:47.52078+05:30	2022-08-29 16:32:39.599651+05:30	128	268	622810	The Royal SMM	900	\N
651	Completed	https://instagram.com/raja_junnu	300	30	2022-09-02 16:03:23.640664+05:30	2022-08-28 20:50:23.331478+05:30	30	272	620738	The Royal SMM	16281	\N
643	Processing	https://www.instagram.com/p/Cg5vCW7LzSR/?igshid=YmMyMTA2M2Y=	100	6.5	2022-08-28 11:54:12.162164+05:30	2022-08-28 08:51:19.340099+05:30	55	270	\N	\N	\N	\N
665	Pending	https://www.instagram.com/reel/Ch2Ll20J4A4/?igshid=YmMyMTA2M2Y=	1000	3	2022-08-30 20:52:26.370323+05:30	2022-08-30 20:52:26.37034+05:30	89	238	\N	\N	\N	\N
662	Completed	https://www.instagram.com/reel/Ch3gUPYOdYR/	1000	12	2022-08-30 14:17:51.512596+05:30	2022-08-30 10:05:48.536862+05:30	66	270	624646	The Royal SMM	6	\N
642	Processing	https://www.instagram.com/reel/CejKC0qBejb/?igshid=YmMyMTA2M2Y=	100	6.5	2022-08-28 15:57:38.612771+05:30	2022-08-28 08:36:51.527084+05:30	55	270	\N	\N	\N	\N
674	Completed	https://instagram.com/__ladla__foji	5000	200	2022-09-05 21:31:29.003961+05:30	2022-08-31 19:23:21.591238+05:30	125	183	628462	The Royal SMM	2805	\N
646	Completed	https://instagram.com/its_me_munmi_1	1000	38	2022-08-28 18:23:20.577425+05:30	2022-08-28 15:14:40.318651+05:30	128	250	619902	The Royal SMM	263	\N
640	Cancelled	https://instagram.com/october_girl_sanjana	1000	38	2022-08-28 18:25:28.005366+05:30	2022-08-28 07:48:21.528203+05:30	128	250	619035	The Royal SMM	\N	\N
661	Partial	https://www.instagram.com/p/CaZQPSlpRxz/	200	20	2022-09-01 14:31:25.778813+05:30	2022-08-30 08:31:57.627799+05:30	30	281	624447	The Royal SMM	\N	\N
668	Completed	https://instagram.com/samratmukh2341	300	13.5	2022-08-31 12:04:37.484573+05:30	2022-08-31 11:32:09.919833+05:30	127	295	627416	The Royal SMM	5738	\N
653	In progress	https://instagram.com/its_me_munmi_1?igshid=YmMyMTA2M2Y=	1000	38	2022-08-28 21:57:44.501199+05:30	2022-08-28 21:45:13.760561+05:30	128	250	\N	\N	\N	\N
647	Processing	https://www.instagram.com/reel/CgUR97wpETF/?igshid=YmMyMTA2M2Y=	3000	114	2022-08-28 23:16:02.108004+05:30	2022-08-28 17:34:32.930151+05:30	5	272	\N	\N	\N	\N
654	Processing	https://m.facebook.com/story.php?story_fbid=pfbid02UKeHoVzdHwgHCGuFmSkTo8j3sDobWpVLzkCMbx6JZUKgYeXvAyGH8q9VWBmTN9Wbl&id=100076646992831	1000	100	2022-08-29 15:53:30.427738+05:30	2022-08-29 11:06:45.912357+05:30	16	49	\N	\N	\N	\N
652	Cancelled	https://instagram.com/pinkygurung999?igshid=YmMyMTA2M2Y=	50	12.5	2022-08-29 15:53:48.081624+05:30	2022-08-28 20:55:19.931005+05:30	6	250	\N	\N	\N	\N
659	Pending	https://www.instagram.com/reel/Ch3a7OuhuN3/?igshid=YmMyMTA2M2Y=	100	1.2	2022-08-30 08:22:42.721069+05:30	2022-08-30 08:22:42.721085+05:30	66	270	\N	\N	\N	\N
660	Pending	https://www.instagram.com/reel/Ch3gUPYOdYR/?igshid=YmMyMTA2M2Y=	1000	55	2022-08-30 08:24:32.8014+05:30	2022-08-30 08:24:32.801415+05:30	52	270	\N	\N	\N	\N
655	Completed	https://instagram.com/parbejkhan_890	100	3.8	2022-08-29 16:33:51.631155+05:30	2022-08-29 15:57:10.508339+05:30	128	268	622698	The Royal SMM	793	\N
666	Completed	https://www.instagram.com/p/Chv3nMLJyg_/	1000	18	2022-08-31 07:16:39.684769+05:30	2022-08-30 21:33:07.312434+05:30	80	294	626345	The Royal SMM	20	\N
641	Completed	https://www.instagram.com/p/Cg5vCW7LzSR/	1000	12	2022-08-30 08:38:56.891235+05:30	2022-08-28 08:31:17.151162+05:30	66	270	619075	The Royal SMM	6	\N
644	Completed	https://www.instagram.com/reel/CejKC0qBejb/	1000	12	2022-08-30 08:38:57.585899+05:30	2022-08-28 08:55:26.065602+05:30	66	270	619116	The Royal SMM	1013	\N
645	Completed	https://www.instagram.com/reel/ChH0ET7lCPE/	1000	12	2022-08-30 08:38:58.116449+05:30	2022-08-28 14:04:42.284582+05:30	66	270	619753	The Royal SMM	574	\N
658	Canceled	https://www.instagram.com/reel/Ch3a7OuhuN3/	50	0.6	2022-08-30 11:22:29.628282+05:30	2022-08-30 07:58:13.286294+05:30	66	270	624389	The Royal SMM	0	\N
667	Processing	https://www.instagram.com/reel/Ch47FDNJxpu/	700	5.6	2022-08-30 21:45:50.703527+05:30	2022-08-30 21:45:49.73124+05:30	82	238	626380	The Royal SMM	\N	\N
664	Processing	https://instagram.com/nana_chiroju	1000	38	2022-08-30 18:28:37.282895+05:30	2022-08-30 18:27:52.601374+05:30	128	250	625795	The Royal SMM	\N	\N
671	Completed	https://instagram.com/__ladla__foji	500	15	2022-08-31 17:49:59.224662+05:30	2022-08-31 17:43:24.901003+05:30	125	49	628200	The Royal SMM	1226	\N
669	Completed	https://instagram.com/__ladla__foji	1000	30	2022-08-31 17:43:45.245089+05:30	2022-08-31 17:26:39.581677+05:30	125	49	628161	The Royal SMM	173	\N
670	Completed	https://instagram.com/__ladla__foji?igshid=YmMyMTA2M2Y=	5000	150	2022-08-31 21:27:47.225229+05:30	2022-08-31 17:40:20.668709+05:30	125	49	628462	\N	2805	\N
673	Completed	https://instagram.com/__ladla__foji	1000	40	2022-08-31 19:23:26.665889+05:30	2022-08-31 18:26:36.11801+05:30	125	183	628321	The Royal SMM	1752	\N
672	Completed	https://instagram.com/__ladla__foji?igshid=YmMyMTA2M2Y=	1000	30	2022-08-31 21:27:46.552189+05:30	2022-08-31 17:47:52.894678+05:30	125	49	628321	\N	1752	\N
663	Completed	https://instagram.com/rockstar_ranjeet_7777_	50	1.9	2022-09-01 09:22:16.17297+05:30	2022-08-30 13:31:35.470385+05:30	128	268	625106	The Royal SMM	143	\N
676	Processing	https://instagram.com/__ladla__foji?igshid=YmMyMTA2M2Y=	1000	30	2022-08-31 21:47:52.981769+05:30	2022-08-31 21:36:30.967121+05:30	125	49	\N	\N	\N	\N
675	Completed	https://instagram.com/__ladla__foji	800	24	2022-08-31 22:11:31.741897+05:30	2022-08-31 21:30:04.489718+05:30	125	49	628777	The Royal SMM	8063	\N
692	Processing	https://instagram.com/prateek_yaduvanshi_7394?igshid=YmMyMTA2M2Y=	100	3.8	2022-09-03 21:49:52.756124+05:30	2022-09-03 21:14:59.559394+05:30	128	310	\N	\N	\N	\N
678	Processing	https://instagram.com/ll._goldy._ll	100	3.8	2022-09-01 09:22:16.766444+05:30	2022-09-01 09:21:39.415868+05:30	128	268	629676	The Royal SMM	\N	\N
695	Pending	https://www.instagram.com/reel/CiDYGJMJHPu/?igshid=YmMyMTA2M2Y=	1000	60	2022-09-04 10:59:15.124773+05:30	2022-09-04 10:59:15.124792+05:30	31	270	\N	\N	\N	\N
679	Completed	https://instagram.com/raja_the_gerat_1432	500	19	2022-09-01 14:31:26.320376+05:30	2022-09-01 12:29:59.345477+05:30	128	281	630056	The Royal SMM	127	\N
561	Cancelled	https://www.instagram.com/reel/ChnApHOlTe12vzSauL6Y_2L41Vh-ocfXGAMn2s0/?igshid=YmMyMTA2M2Y=	350	5.25	2022-09-02 00:01:28.832988+05:30	2022-08-23 23:41:52.789875+05:30	88	234	\N	\N	\N	\N
682	Processing	https://instagram.com/indian_bridal_vibes	50	2.25	2022-09-02 16:21:53.12191+05:30	2022-09-02 16:21:52.41588+05:30	127	239	633594	The Royal SMM	\N	\N
681	Processing	https://www.instagram.com/reel/Ch9R2lKJvCt/?igshid=YmMyMTA2M2Y=	160	6.08	2022-09-02 16:38:09.710702+05:30	2022-09-02 16:00:01.677603+05:30	5	272	\N	\N	\N	\N
683	Processing	https://instagram.com/instafollowers4211	50	2.45	2022-09-02 19:04:09.631907+05:30	2022-09-02 19:04:08.841122+05:30	126	239	634045	The Royal SMM	\N	\N
684	Processing	https://instagram.com/mr.shubhu07?igshid=YmMyMTA2M2Y=	260	9.88	2022-09-02 21:28:22.724062+05:30	2022-09-02 20:57:28.869698+05:30	128	309	\N	\N	\N	\N
685	Pending	https://instagram.com/mr.shubhu07?igshid=YmMyMTA2M2Y=	1	0.038	2022-09-02 21:51:24.019659+05:30	2022-09-02 21:51:24.019677+05:30	128	309	\N	\N	\N	\N
686	Pending	https://instagram.com/mr.shubhu07?igshid=YmMyMTA2M2Y=	2	0.076	2022-09-02 21:52:05.30993+05:30	2022-09-02 21:52:05.309949+05:30	128	309	\N	\N	\N	\N
680	Completed	https://instagram.com/swarup9289	1000	38	2022-09-03 04:21:43.928556+05:30	2022-09-02 11:49:30.403761+05:30	128	294	632885	The Royal SMM	178	\N
700	Pending	https://instagram.com/mr.shubhu07?igshid=YmMyMTA2M2Y=	370	12.95	2022-09-04 15:06:23.298665+05:30	2022-09-04 15:06:23.298683+05:30	46	309	\N	\N	\N	\N
677	Completed	https://instagram.com/__ladla__foji	800	24	2022-09-03 11:19:43.971847+05:30	2022-08-31 22:12:51.757318+05:30	125	49	628872	The Royal SMM	9961	\N
706	Pending	https://www.instagram.com/reel/CiEg4DNuuBS/?igshid=YmMyMTA2M2Y=	1500	4.5	2022-09-05 09:02:39.400203+05:30	2022-09-05 09:02:39.400231+05:30	60	289	\N	\N	\N	\N
707	Pending	https://www.instagram.com/reel/CiHBNqhodvh/?igshid=YmMyMTA2M2Y=	1500	4.5	2022-09-05 09:03:44.912658+05:30	2022-09-05 09:03:44.912678+05:30	60	289	\N	\N	\N	\N
713	Completed	https://www.instagram.com/reel/Cg9-tfYh6dz/	1000	3	2022-09-05 11:20:29.690318+05:30	2022-09-05 09:36:27.775724+05:30	89	294	642469	The Royal SMM	111	\N
687	Processing	https://www.instagram.com/reel/ChuWK3FDMaV/?igshid=YmMyMTA2M2Y=	1000	10	2022-09-03 13:12:44.862031+05:30	2022-09-03 07:12:30.041836+05:30	4	309	\N	\N	\N	\N
701	Completed	https://instagram.com/vice_president_prajapati_ajay3	150	5.25	2022-09-05 08:14:55.197504+05:30	2022-09-04 17:00:00.64596+05:30	129	289	640369	The Royal SMM	3453	\N
712	Completed	https://www.instagram.com/p/CiG7XcSpECO/	1000	18	2022-09-05 11:20:30.222632+05:30	2022-09-05 09:35:25.788608+05:30	80	294	642466	The Royal SMM	6	\N
691	Processing	https://instagram.com/prateek_yaduvanshi_7394	100	3.8	2022-09-03 21:14:57.71539+05:30	2022-09-03 21:14:56.813672+05:30	128	310	637713	The Royal SMM	\N	\N
693	Processing	https://instagram.com/prateek_yaduvanshi_7394	200	7	2022-09-03 21:40:50.506591+05:30	2022-09-03 21:40:49.85717+05:30	129	310	637818	The Royal SMM	\N	\N
694	Pending	https://instagram.com/prateek_yaduvanshi_7394?igshid=YmMyMTA2M2Y=	142	4.97	2022-09-03 21:42:27.237233+05:30	2022-09-03 21:42:27.237251+05:30	129	310	\N	\N	\N	\N
699	Completed	https://instagram.com/mr.shubhu07	201	7.035	2022-09-05 08:16:33.596873+05:30	2022-09-04 14:55:36.355477+05:30	46	309	639953	The Royal SMM	32878	\N
688	Completed	ccccchttps://www.instagram.com/reel/CiCDLt2jr9I/	400	4.8	2022-09-05 08:22:48.202944+05:30	2022-09-03 11:17:06.998223+05:30	79	49	635975	The Royal SMM	10	\N
690	Completed	https://www.instagram.com/reel/CiCDLt2jr9I/	500	1.5	2022-09-05 08:22:48.714128+05:30	2022-09-03 16:50:28.261509+05:30	89	49	636961	The Royal SMM	61	\N
703	Canceled	https://instagram.com/akshaya__0	20	0.6	2022-09-05 09:19:30.430439+05:30	2022-09-05 08:34:03.409797+05:30	125	49	642362	The Royal SMM	0	\N
702	Canceled	https://instagram.com/akshaya__0	20	0.6	2022-09-05 08:32:43.564845+05:30	2022-09-05 08:21:38.98902+05:30	125	49	642345	The Royal SMM	0	\N
696	Completed	https://instagram.com/trollcasmic_high_2	200	7.6	2022-09-04 14:46:57.258711+05:30	2022-09-04 14:39:53.404592+05:30	128	305	639897	The Royal SMM	266	\N
697	Completed	https://www.instagram.com/reel/Chz6Gk5P6mp/	500	7.5	2022-09-04 14:46:57.771772+05:30	2022-09-04 14:41:26.318048+05:30	133	305	639901	The Royal SMM	4	\N
698	Processing	https://www.instagram.com/reel/Chz6Gk5P6mp/	1000	5	2022-09-04 14:46:58.29879+05:30	2022-09-04 14:43:13.194033+05:30	132	305	639906	The Royal SMM	0	\N
689	Completed	https://instagram.com/mr.shubhu07	200	7	2022-09-04 14:53:51.591651+05:30	2022-09-03 16:48:21.444377+05:30	46	309	636955	The Royal SMM	32698	\N
705	Completed	https://instagram.com/___kasim___.47	1000	35	2022-09-05 09:23:51.853504+05:30	2022-09-05 09:01:24.653001+05:30	129	289	642406	The Royal SMM	1418	\N
704	Completed	https://instagram.com/___kasim___.47	200	7	2022-09-05 09:23:52.37634+05:30	2022-09-05 09:01:06.215767+05:30	46	289	642405	The Royal SMM	1195	\N
708	Completed	https://www.instagram.com/reel/CfgaiGtpZhB/	1000	3	2022-09-05 09:37:04.317836+05:30	2022-09-05 09:12:38.88996+05:30	89	294	642418	The Royal SMM	92	\N
709	Pending	https://www.instagram.com/reel/CiEg4DNuuBS/?igshid=YmMyMTA2M2Y=	1000	3	2022-09-05 09:24:57.519584+05:30	2022-09-05 09:24:57.519601+05:30	60	289	\N	\N	\N	\N
710	Pending	https://www.instagram.com/reel/CiHBNqhodvh/?igshid=YmMyMTA2M2Y=	1000	3	2022-09-05 09:25:22.962873+05:30	2022-09-05 09:25:22.962893+05:30	60	289	\N	\N	\N	\N
711	Processing	https://instagram.com/___kasim___.47	700	24.5	2022-09-05 09:27:16.400884+05:30	2022-09-05 09:27:15.045372+05:30	46	289	642454	The Royal SMM	\N	\N
715	Completed	https://instagram.com/mr_drug_132	1000	30	2022-09-05 18:19:01.788666+05:30	2022-09-05 15:14:51.761367+05:30	125	49	643259	The Royal SMM	985	\N
716	Processing	https://instagram.com/____soul_____girl____	1000	30	2022-09-05 19:04:52.640544+05:30	2022-09-05 18:52:21.871613+05:30	125	49	643769	The Royal SMM	\N	\N
714	Canceled	https://instagram.com/____soul_____girl____	980	29.4	2022-09-05 18:19:02.323785+05:30	2022-09-05 15:07:14.815641+05:30	125	49	643231	The Royal SMM	0	\N
717	Processing	https://instagram.com/r.k6037	80	3.04	2022-09-05 21:31:30.864198+05:30	2022-09-05 21:30:19.772183+05:30	128	183	644278	The Royal SMM	\N	\N
\.


--
-- Data for Name: orders_ordertransanctionmodel; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.orders_ordertransanctionmodel (id, transanction_type, note, created, order_id, user_id) FROM stdin;
8	Debit	\N	2022-01-17 12:39:30.76346+05:30	7	14
9	Debit	\N	2022-01-17 12:48:10.252752+05:30	8	15
10	Debit	\N	2022-01-17 15:48:36.162888+05:30	9	17
11	Credit	\N	2022-01-17 15:49:55.235069+05:30	9	17
12	Debit	\N	2022-01-17 15:50:07.337724+05:30	10	17
13	Debit	\N	2022-01-17 15:59:01.522329+05:30	11	14
14	Debit	\N	2022-01-17 16:04:22.270386+05:30	12	16
15	Debit	\N	2022-01-17 18:18:15.403712+05:30	13	16
16	Debit	\N	2022-01-17 18:27:06.899319+05:30	14	16
17	Debit	\N	2022-01-17 19:49:03.978152+05:30	15	14
18	Debit	\N	2022-01-17 21:22:07.624059+05:30	16	14
19	Debit	\N	2022-01-18 11:48:14.115458+05:30	17	14
20	Debit	\N	2022-01-18 11:56:35.458205+05:30	18	14
21	Debit	\N	2022-01-18 11:59:18.675279+05:30	19	14
22	Debit	\N	2022-01-18 16:29:16.343907+05:30	20	16
23	Debit	\N	2022-01-18 18:37:37.873863+05:30	21	14
24	Debit	\N	2022-01-19 12:43:57.098288+05:30	22	22
25	Debit	\N	2022-01-19 12:44:46.047032+05:30	23	16
26	Debit	\N	2022-01-19 13:08:22.495428+05:30	24	21
27	Debit	\N	2022-01-19 13:12:41.578167+05:30	25	21
28	Credit	\N	2022-01-19 13:34:24.929717+05:30	24	21
29	Debit	\N	2022-01-19 13:37:24.032237+05:30	26	21
30	Debit	\N	2022-01-19 21:04:09.740879+05:30	27	14
31	Debit	\N	2022-01-20 14:43:39.126753+05:30	28	14
32	Debit	\N	2022-01-20 17:57:46.822743+05:30	29	14
33	Debit	\N	2022-01-20 19:53:36.285328+05:30	30	14
34	Debit	\N	2022-01-21 11:32:35.530492+05:30	31	14
35	Credit	\N	2022-01-21 11:43:35.226854+05:30	31	14
36	Debit	\N	2022-01-21 13:58:56.807744+05:30	32	14
37	Debit	\N	2022-01-21 17:40:36.778459+05:30	33	14
39	Debit	\N	2022-01-21 19:56:39.615109+05:30	35	14
40	Debit	\N	2022-01-21 19:58:02.258837+05:30	36	14
41	Debit	\N	2022-01-21 19:58:52.053392+05:30	37	14
42	Debit	\N	2022-01-21 19:59:23.803117+05:30	38	14
43	Debit	\N	2022-01-21 22:51:47.159879+05:30	39	14
44	Debit	\N	2022-01-21 23:10:27.004274+05:30	40	14
46	Debit	\N	2022-01-22 19:50:47.72688+05:30	42	14
47	Debit	\N	2022-01-22 21:42:53.648207+05:30	43	14
48	Debit	\N	2022-01-23 12:23:45.161062+05:30	44	14
49	Debit	\N	2022-01-23 12:24:25.421777+05:30	45	14
50	Debit	\N	2022-01-23 20:07:21.945309+05:30	46	14
52	Debit	\N	2022-01-24 06:04:44.396772+05:30	48	35
53	Debit	\N	2022-01-24 12:07:23.841963+05:30	49	14
56	Debit	\N	2022-01-24 16:19:20.606963+05:30	52	35
63	Debit	\N	2022-01-25 13:37:46.449968+05:30	59	14
64	Debit	\N	2022-01-25 19:20:41.564112+05:30	60	22
65	Debit	\N	2022-01-25 21:34:56.035844+05:30	61	35
66	Debit	\N	2022-01-25 21:44:27.177827+05:30	62	1
67	Debit	\N	2022-01-26 13:19:44.769769+05:30	63	3
68	Debit	\N	2022-01-26 13:21:03.327321+05:30	64	3
69	Debit	\N	2022-01-26 16:57:59.342865+05:30	65	3
70	Debit	\N	2022-01-26 16:58:51.939391+05:30	66	3
73	Debit	\N	2022-01-26 20:07:19.398594+05:30	69	3
74	Credit	\N	2022-01-26 20:41:40.446253+05:30	69	3
77	Debit	\N	2022-01-26 21:05:39.7184+05:30	70	1
78	Debit	\N	2022-01-26 21:06:48.391786+05:30	71	1
79	Debit	\N	2022-01-26 21:07:34.521253+05:30	72	1
80	Debit	\N	2022-01-27 14:06:17.733574+05:30	73	41
81	Debit	\N	2022-01-27 15:03:42.626502+05:30	74	35
82	Debit	\N	2022-01-27 18:55:00.485781+05:30	75	35
83	Debit	\N	2022-01-27 19:03:03.182245+05:30	76	35
84	Debit	\N	2022-01-27 19:09:22.411792+05:30	77	44
85	Debit	\N	2022-01-28 11:00:34.044734+05:30	78	45
86	Debit	\N	2022-01-28 20:35:27.379562+05:30	79	14
87	Debit	\N	2022-01-29 11:49:06.42595+05:30	80	45
88	Debit	\N	2022-01-29 15:21:35.810341+05:30	81	35
89	Debit	\N	2022-01-29 16:56:33.282183+05:30	82	35
93	Debit	\N	2022-01-29 20:44:03.25296+05:30	85	42
94	Debit	\N	2022-01-29 22:11:09.755829+05:30	86	14
95	Debit	\N	2022-01-30 08:20:21.882799+05:30	87	35
96	Debit	\N	2022-01-31 01:21:27.223674+05:30	88	35
97	Debit	\N	2022-01-31 01:26:16.540534+05:30	89	35
98	Debit	\N	2022-01-31 22:00:36.856886+05:30	90	14
99	Debit	\N	2022-02-01 13:13:28.449806+05:30	91	42
100	Debit	\N	2022-02-01 13:13:29.455058+05:30	92	42
101	Debit	\N	2022-02-01 13:14:49.446302+05:30	93	42
102	Debit	\N	2022-02-01 13:16:14.814837+05:30	94	42
103	Debit	\N	2022-02-01 13:17:12.313543+05:30	95	42
104	Debit	\N	2022-02-01 13:20:28.537538+05:30	96	42
105	Debit	\N	2022-02-01 13:23:42.275164+05:30	97	42
106	Debit	\N	2022-02-01 13:25:54.915151+05:30	98	42
107	Debit	\N	2022-02-01 13:27:42.848902+05:30	99	42
108	Debit	\N	2022-02-01 13:28:23.085166+05:30	100	42
109	Debit	\N	2022-02-01 13:29:00.906664+05:30	101	42
110	Debit	\N	2022-02-01 13:29:57.113066+05:30	102	42
111	Debit	\N	2022-02-03 10:33:17.69094+05:30	103	44
112	Debit	\N	2022-02-03 17:26:27.61117+05:30	104	42
113	Debit	\N	2022-02-03 18:42:47.703932+05:30	105	42
114	Debit	\N	2022-02-03 18:49:16.722321+05:30	106	42
115	Debit	\N	2022-02-03 19:28:23.303403+05:30	107	42
116	Debit	\N	2022-02-03 19:41:22.830677+05:30	108	3
117	Debit	\N	2022-02-03 20:05:52.857691+05:30	109	3
118	Debit	\N	2022-02-03 21:29:19.565387+05:30	110	42
119	Debit	\N	2022-02-03 23:28:42.309247+05:30	111	42
120	Debit	\N	2022-02-04 00:07:42.206286+05:30	112	42
121	Debit	\N	2022-02-04 19:06:04.23826+05:30	113	42
122	Debit	\N	2022-02-05 22:22:59.106682+05:30	114	42
123	Debit	\N	2022-02-05 22:38:36.11807+05:30	115	42
124	Debit	\N	2022-02-05 22:50:34.299931+05:30	116	42
125	Debit	\N	2022-02-06 13:05:37.761675+05:30	117	49
127	Debit	\N	2022-02-06 14:28:37.52316+05:30	119	49
128	Debit	\N	2022-02-06 15:02:50.488221+05:30	120	42
129	Debit	\N	2022-02-06 15:11:12.632959+05:30	121	42
130	Debit	\N	2022-02-06 15:21:40.857342+05:30	122	42
131	Debit	\N	2022-02-06 18:39:52.484192+05:30	123	42
132	Debit	\N	2022-02-06 20:28:51.827705+05:30	124	49
133	Debit	\N	2022-02-06 21:58:01.846206+05:30	125	49
134	Debit	\N	2022-02-06 22:52:50.854006+05:30	126	42
135	Debit	\N	2022-02-06 23:04:52.441465+05:30	127	42
136	Debit	\N	2022-02-06 23:13:30.075209+05:30	128	42
137	Debit	\N	2022-02-07 01:17:11.553735+05:30	129	42
138	Debit	\N	2022-02-07 13:46:24.346584+05:30	130	49
139	Debit	\N	2022-02-07 13:55:32.296315+05:30	131	49
140	Debit	\N	2022-02-07 13:57:53.124275+05:30	132	49
141	Debit	\N	2022-02-07 14:57:51.048272+05:30	133	49
142	Debit	\N	2022-02-07 15:16:16.126344+05:30	134	49
143	Debit	\N	2022-02-07 15:30:56.895621+05:30	135	49
144	Debit	\N	2022-02-07 15:40:07.982487+05:30	136	49
145	Debit	\N	2022-02-07 15:48:16.862736+05:30	137	49
146	Debit	\N	2022-02-07 15:56:20.652204+05:30	138	49
147	Debit	\N	2022-02-07 16:04:27.630213+05:30	139	49
148	Debit	\N	2022-02-07 16:11:25.257487+05:30	140	49
149	Debit	\N	2022-02-07 20:05:20.360755+05:30	141	49
150	Debit	\N	2022-02-09 17:13:03.883424+05:30	142	49
151	Debit	\N	2022-02-10 17:05:50.043547+05:30	143	14
152	Debit	\N	2022-02-10 17:07:56.550118+05:30	144	14
153	Debit	\N	2022-02-10 17:09:11.767361+05:30	145	14
154	Debit	\N	2022-02-10 17:12:31.432128+05:30	146	14
155	Debit	\N	2022-02-10 18:48:21.61071+05:30	147	63
156	Debit	\N	2022-02-10 18:54:15.181267+05:30	148	3
157	Credit	\N	2022-02-10 19:03:51.970332+05:30	147	63
158	Debit	\N	2022-02-10 19:54:58.450871+05:30	149	63
159	Debit	\N	2022-02-10 20:01:32.836237+05:30	150	63
160	Debit	\N	2022-02-10 20:53:45.872638+05:30	151	61
161	Debit	\N	2022-02-10 21:58:34.977648+05:30	152	3
162	Debit	\N	2022-02-10 22:35:20.782484+05:30	153	70
163	Debit	\N	2022-02-10 22:45:47.353834+05:30	154	70
164	Debit	\N	2022-02-10 22:54:21.471532+05:30	155	70
165	Debit	\N	2022-02-10 23:06:15.124724+05:30	156	3
166	Debit	\N	2022-02-11 20:45:17.82512+05:30	157	3
167	Debit	\N	2022-02-11 21:24:54.563978+05:30	158	3
168	Credit	\N	2022-02-12 13:25:22.781886+05:30	158	3
169	Debit	\N	2022-02-12 23:40:23.246309+05:30	159	14
170	Debit	\N	2022-02-13 03:55:55.777128+05:30	160	3
171	Debit	\N	2022-02-13 03:56:21.012281+05:30	161	3
172	Debit	\N	2022-02-13 09:45:54.720615+05:30	162	14
173	Debit	\N	2022-02-14 20:20:35.183063+05:30	163	3
174	Debit	\N	2022-02-14 22:18:19.282041+05:30	164	90
175	Debit	\N	2022-02-14 22:29:43.575234+05:30	165	90
176	Debit	\N	2022-02-14 22:59:50.42995+05:30	166	90
177	Debit	\N	2022-02-15 10:40:20.845957+05:30	167	90
178	Debit	\N	2022-02-15 10:46:22.953931+05:30	168	90
179	Debit	\N	2022-02-15 11:49:26.059319+05:30	169	90
181	Debit	\N	2022-02-15 12:31:47.866685+05:30	171	90
182	Debit	\N	2022-02-15 12:32:40.221814+05:30	172	90
183	Debit	\N	2022-02-15 12:35:46.548961+05:30	173	90
184	Debit	\N	2022-02-15 15:04:20.054318+05:30	174	90
185	Debit	\N	2022-02-15 16:54:19.461749+05:30	175	90
186	Debit	\N	2022-02-15 16:57:18.725973+05:30	176	90
187	Debit	\N	2022-02-15 17:16:43.579813+05:30	177	90
188	Debit	\N	2022-02-15 17:24:03.860297+05:30	178	90
189	Debit	\N	2022-02-15 17:27:39.53829+05:30	179	3
190	Debit	\N	2022-02-15 17:28:01.259571+05:30	180	3
191	Debit	\N	2022-02-15 17:30:07.197349+05:30	181	3
192	Debit	\N	2022-02-15 17:34:31.675577+05:30	182	90
193	Debit	\N	2022-02-15 17:39:07.572796+05:30	183	90
194	Debit	\N	2022-02-15 17:49:27.170135+05:30	184	90
195	Debit	\N	2022-02-15 18:16:44.884592+05:30	185	90
196	Debit	\N	2022-02-15 18:18:40.663846+05:30	186	90
197	Debit	\N	2022-02-15 18:45:58.416966+05:30	187	3
198	Debit	\N	2022-02-15 19:12:36.80664+05:30	188	90
199	Debit	\N	2022-02-15 19:17:46.507083+05:30	189	90
200	Debit	\N	2022-02-15 19:18:12.45919+05:30	190	90
201	Debit	\N	2022-02-16 19:51:08.412408+05:30	191	90
202	Credit	\N	2022-02-16 19:56:41.954769+05:30	190	90
203	Debit	\N	2022-02-16 19:58:31.606985+05:30	192	14
204	Debit	\N	2022-02-16 19:59:12.733735+05:30	193	14
205	Debit	\N	2022-02-16 22:49:05.213562+05:30	194	90
206	Debit	\N	2022-02-17 08:54:25.030883+05:30	195	14
207	Debit	\N	2022-02-17 13:50:01.081579+05:30	196	90
209	Debit	\N	2022-02-17 17:23:35.720615+05:30	198	3
213	Debit	\N	2022-02-17 23:08:52.29948+05:30	202	42
214	Debit	\N	2022-02-18 16:07:21.420875+05:30	203	42
215	Credit	\N	2022-02-19 12:40:46.669037+05:30	159	14
216	Debit	\N	2022-02-19 17:47:07.556909+05:30	204	42
217	Debit	\N	2022-02-19 18:06:52.374343+05:30	205	42
218	Debit	\N	2022-02-19 22:47:34.046339+05:30	206	70
219	Debit	\N	2022-02-19 23:11:46.697665+05:30	207	90
220	Debit	\N	2022-02-19 23:11:59.590046+05:30	208	90
221	Debit	\N	2022-02-19 23:12:14.483361+05:30	209	90
222	Debit	\N	2022-02-19 23:12:37.81593+05:30	210	90
223	Credit	\N	2022-02-20 15:04:29.836998+05:30	209	90
224	Debit	\N	2022-02-20 19:06:45.685887+05:30	211	42
225	Debit	\N	2022-02-20 19:16:31.675892+05:30	212	42
226	Debit	\N	2022-02-20 19:17:28.538184+05:30	213	42
227	Debit	\N	2022-02-20 19:22:54.951454+05:30	214	109
228	Debit	\N	2022-02-21 18:03:30.04734+05:30	215	42
229	Debit	\N	2022-02-21 18:05:03.105421+05:30	216	42
230	Debit	\N	2022-02-21 18:07:39.345134+05:30	217	42
231	Debit	\N	2022-02-21 20:52:04.347997+05:30	218	114
232	Debit	\N	2022-02-21 20:52:58.264279+05:30	219	114
233	Debit	\N	2022-02-21 23:45:49.707631+05:30	220	114
234	Debit	\N	2022-02-21 23:45:50.920672+05:30	221	114
235	Debit	\N	2022-02-21 23:46:44.884634+05:30	222	114
236	Debit	\N	2022-02-22 14:53:48.434192+05:30	223	42
237	Debit	\N	2022-02-22 14:59:05.581181+05:30	224	42
240	Debit	\N	2022-02-22 18:02:04.980056+05:30	227	42
241	Debit	\N	2022-02-22 18:11:04.636642+05:30	228	42
242	Debit	\N	2022-02-22 18:17:12.400103+05:30	229	42
259	Debit	\N	2022-02-25 14:51:48.073473+05:30	246	14
263	Debit	\N	2022-02-26 12:42:30.238436+05:30	250	139
271	Debit	\N	2022-02-26 22:15:57.054019+05:30	258	14
272	Debit	\N	2022-02-26 22:17:36.708316+05:30	259	14
273	Debit	\N	2022-02-26 22:19:26.705435+05:30	260	14
274	Debit	\N	2022-02-26 22:20:42.94142+05:30	261	14
275	Debit	\N	2022-02-26 22:21:27.482727+05:30	262	14
276	Debit	\N	2022-02-26 22:22:37.208609+05:30	263	14
277	Debit	\N	2022-02-26 22:23:00.699031+05:30	264	14
285	Debit	\N	2022-02-27 23:21:43.741467+05:30	270	1
288	Debit	\N	2022-02-28 17:31:16.05561+05:30	273	102
294	Debit	\N	2022-03-01 10:14:38.675142+05:30	279	70
296	Debit	\N	2022-03-02 13:38:53.300898+05:30	281	102
297	Debit	\N	2022-03-02 19:56:23.715994+05:30	282	144
298	Debit	\N	2022-03-02 20:13:43.117026+05:30	283	144
299	Debit	\N	2022-03-02 22:46:36.031643+05:30	284	102
300	Debit	\N	2022-03-02 22:48:06.640839+05:30	285	102
301	Debit	\N	2022-03-02 23:56:46.280852+05:30	286	102
302	Debit	\N	2022-03-03 09:28:20.471527+05:30	287	144
303	Debit	\N	2022-03-03 14:27:31.480548+05:30	288	102
305	Debit	\N	2022-03-04 00:46:46.845702+05:30	290	102
306	Debit	\N	2022-03-04 13:12:13.315806+05:30	291	102
307	Debit	\N	2022-03-05 00:20:40.478279+05:30	292	14
308	Debit	\N	2022-03-05 00:22:53.743857+05:30	293	14
309	Debit	\N	2022-03-05 00:23:08.819391+05:30	294	14
310	Debit	\N	2022-03-05 00:31:33.58934+05:30	295	14
311	Debit	\N	2022-03-05 19:46:51.020209+05:30	296	102
312	Debit	\N	2022-03-05 22:49:54.622861+05:30	297	14
313	Debit	\N	2022-03-05 22:50:20.106054+05:30	298	14
314	Debit	\N	2022-03-05 22:50:45.623942+05:30	299	14
315	Debit	\N	2022-03-05 22:51:18.251049+05:30	300	14
316	Debit	\N	2022-03-05 22:51:42.216157+05:30	301	14
317	Debit	\N	2022-03-05 22:52:05.713699+05:30	302	14
318	Debit	\N	2022-03-05 22:52:33.45643+05:30	303	14
319	Debit	\N	2022-03-05 22:54:27.407069+05:30	304	14
324	Debit	\N	2022-03-06 10:03:56.326283+05:30	309	144
325	Debit	\N	2022-03-06 12:52:31.236228+05:30	310	14
326	Debit	\N	2022-03-06 21:22:19.785842+05:30	311	147
327	Debit	\N	2022-03-07 11:34:43.583001+05:30	312	102
328	Debit	\N	2022-03-07 18:44:02.670147+05:30	313	144
329	Debit	\N	2022-03-07 22:50:39.898724+05:30	314	144
330	Debit	\N	2022-03-08 14:46:56.756267+05:30	315	146
331	Debit	\N	2022-03-08 15:14:24.134037+05:30	316	146
332	Debit	\N	2022-03-08 20:34:48.523067+05:30	317	14
333	Debit	\N	2022-03-08 20:37:02.20794+05:30	318	14
334	Debit	\N	2022-03-08 20:37:30.810347+05:30	319	14
335	Debit	\N	2022-03-08 20:38:00.161093+05:30	320	14
336	Debit	\N	2022-03-08 20:38:36.870484+05:30	321	14
337	Debit	\N	2022-03-08 21:34:42.338819+05:30	322	14
338	Debit	\N	2022-03-08 21:35:12.446128+05:30	323	14
339	Debit	\N	2022-03-08 21:35:38.654569+05:30	324	14
340	Debit	\N	2022-03-08 21:36:08.919079+05:30	325	14
341	Debit	\N	2022-03-08 21:41:06.869276+05:30	326	102
342	Debit	\N	2022-03-08 22:40:33.820427+05:30	327	147
343	Debit	\N	2022-03-09 09:11:28.703722+05:30	328	144
344	Debit	\N	2022-03-09 10:34:05.14523+05:30	329	14
345	Debit	\N	2022-03-09 11:44:11.582867+05:30	330	129
346	Debit	\N	2022-03-09 11:49:08.549201+05:30	331	129
347	Debit	\N	2022-03-11 12:13:27.703846+05:30	332	146
348	Debit	\N	2022-03-11 15:13:39.092901+05:30	333	146
349	Debit	\N	2022-03-11 16:32:20.27551+05:30	334	146
350	Debit	\N	2022-03-11 16:44:20.211814+05:30	335	146
351	Debit	\N	2022-03-11 21:54:57.053293+05:30	336	129
352	Debit	\N	2022-03-11 22:19:26.032671+05:30	337	144
354	Debit	\N	2022-03-13 10:19:21.736356+05:30	339	1
355	Debit	\N	2022-03-13 10:21:37.051499+05:30	340	1
356	Debit	\N	2022-03-13 15:01:28.412072+05:30	341	147
357	Debit	\N	2022-03-13 17:46:07.857074+05:30	342	147
358	Debit	\N	2022-03-14 09:45:05.424996+05:30	343	3
359	Debit	\N	2022-03-14 11:09:11.574234+05:30	344	146
360	Debit	\N	2022-03-14 12:12:51.022623+05:30	345	146
361	Debit	\N	2022-03-14 14:39:46.447649+05:30	346	146
362	Debit	\N	2022-03-14 15:07:32.318585+05:30	347	42
363	Debit	\N	2022-03-14 18:00:51.057968+05:30	348	1
364	Debit	\N	2022-03-16 22:46:04.231676+05:30	349	102
365	Debit	\N	2022-03-18 22:20:35.579481+05:30	350	14
366	Debit	\N	2022-03-19 17:58:20.751185+05:30	351	14
367	Debit	\N	2022-03-20 08:33:42.945082+05:30	352	144
371	Debit	\N	2022-03-24 22:02:34.625496+05:30	356	14
372	Debit	\N	2022-03-25 11:07:28.012634+05:30	357	3
373	Debit	\N	2022-04-03 15:51:13.288249+05:30	358	14
375	Debit	\N	2022-04-06 09:27:18.526657+05:30	360	162
376	Debit	\N	2022-04-06 09:30:24.589766+05:30	361	162
377	Debit	\N	2022-04-08 22:26:31.396674+05:30	362	160
378	Debit	\N	2022-04-09 11:06:24.046573+05:30	363	160
379	Debit	\N	2022-04-09 13:41:16.770809+05:30	364	14
380	Debit	\N	2022-04-09 13:42:09.870561+05:30	365	14
383	Debit	\N	2022-04-19 19:56:06.810325+05:30	368	147
384	Debit	\N	2022-04-19 21:02:45.860704+05:30	369	147
385	Debit	\N	2022-04-23 13:13:25.95488+05:30	370	147
386	Debit	\N	2022-04-23 14:00:34.059443+05:30	371	147
387	Debit	\N	2022-04-26 13:11:35.269128+05:30	372	167
388	Debit	\N	2022-06-05 13:17:22.408405+05:30	373	171
389	Debit	\N	2022-06-05 13:21:55.826208+05:30	374	171
390	Debit	\N	2022-06-10 15:40:53.134234+05:30	375	171
391	Debit	\N	2022-06-11 00:14:34.215495+05:30	376	171
392	Debit	\N	2022-06-11 00:15:07.752833+05:30	377	171
393	Debit	\N	2022-06-11 00:16:53.627269+05:30	378	171
394	Credit	\N	2022-06-11 00:46:25.834245+05:30	376	171
395	Credit	\N	2022-06-11 00:46:35.846312+05:30	378	171
396	Credit	\N	2022-06-11 00:46:45.707758+05:30	377	171
397	Debit	\N	2022-06-11 00:47:56.348452+05:30	379	171
398	Debit	\N	2022-06-11 02:08:44.217933+05:30	380	171
399	Debit	\N	2022-06-11 22:52:53.100764+05:30	381	171
400	Debit	\N	2022-06-11 22:53:36.440106+05:30	382	171
401	Debit	\N	2022-06-12 01:56:01.662438+05:30	383	171
402	Debit	\N	2022-06-12 01:58:06.592021+05:30	384	171
403	Debit	\N	2022-06-12 02:01:24.808891+05:30	385	171
404	Debit	\N	2022-06-12 15:38:31.188459+05:30	386	171
405	Debit	\N	2022-06-12 15:57:46.60302+05:30	387	171
406	Debit	\N	2022-06-12 16:22:48.2289+05:30	388	171
407	Debit	\N	2022-06-12 16:23:29.59846+05:30	389	171
415	Debit	\N	2022-06-12 18:43:36.657053+05:30	397	172
416	Debit	\N	2022-06-12 19:06:39.913405+05:30	398	172
417	Debit	\N	2022-06-12 19:07:27.329003+05:30	399	3
418	Debit	\N	2022-06-12 19:07:41.193144+05:30	400	3
419	Debit	\N	2022-06-12 19:08:08.873207+05:30	401	172
420	Debit	\N	2022-06-12 19:08:33.009495+05:30	402	3
421	Debit	\N	2022-06-12 19:08:42.254376+05:30	403	3
422	Debit	\N	2022-06-12 19:08:45.559754+05:30	404	3
423	Debit	\N	2022-06-12 19:08:50.720964+05:30	405	3
429	Debit	\N	2022-06-12 19:17:12.142562+05:30	411	3
430	Debit	\N	2022-06-13 12:19:07.993361+05:30	412	45
431	Debit	\N	2022-06-13 13:22:13.768106+05:30	413	45
432	Debit	\N	2022-06-14 09:18:01.769172+05:30	414	174
433	Debit	\N	2022-06-14 09:29:41.987933+05:30	415	174
434	Debit	\N	2022-06-14 12:17:40.533109+05:30	416	174
435	Credit	\N	2022-06-14 12:44:30.615788+05:30	414	174
436	Debit	\N	2022-06-15 14:09:26.406432+05:30	417	176
437	Debit	\N	2022-06-15 14:11:13.751345+05:30	418	174
438	Debit	\N	2022-06-15 14:58:06.101313+05:30	419	174
439	Debit	\N	2022-06-17 11:59:59.045181+05:30	420	45
440	Debit	\N	2022-06-24 19:56:36.177148+05:30	421	181
441	Debit	\N	2022-06-24 19:57:27.414297+05:30	422	181
442	Debit	\N	2022-06-25 14:53:58.682061+05:30	423	174
443	Debit	\N	2022-06-28 19:07:37.681993+05:30	424	174
444	Debit	\N	2022-06-28 19:20:13.524262+05:30	425	174
445	Debit	\N	2022-06-28 19:56:35.126994+05:30	426	174
446	Debit	\N	2022-06-28 21:28:12.070652+05:30	427	174
447	Debit	\N	2022-06-28 21:45:55.203412+05:30	428	174
448	Debit	\N	2022-06-30 13:09:12.641585+05:30	429	174
449	Debit	\N	2022-07-03 13:48:21.645837+05:30	430	181
450	Debit	\N	2022-07-03 13:58:50.513102+05:30	431	181
451	Debit	\N	2022-07-03 16:13:46.06116+05:30	432	174
452	Debit	\N	2022-07-04 01:48:08.570357+05:30	433	181
453	Debit	\N	2022-07-04 17:46:03.347248+05:30	434	174
454	Debit	\N	2022-07-04 21:50:10.247371+05:30	435	174
455	Debit	\N	2022-07-06 12:02:03.498434+05:30	436	181
456	Debit	\N	2022-07-07 20:43:51.848287+05:30	437	174
457	Debit	\N	2022-07-10 10:36:54.149615+05:30	438	174
458	Debit	\N	2022-07-13 23:03:46.794045+05:30	439	174
459	Debit	\N	2022-07-16 15:14:35.334046+05:30	440	174
460	Debit	\N	2022-07-16 22:04:07.426126+05:30	441	174
461	Debit	\N	2022-07-18 21:17:41.250063+05:30	442	185
462	Debit	\N	2022-07-18 23:21:32.297339+05:30	443	186
463	Debit	\N	2022-07-19 17:28:12.617139+05:30	444	185
464	Debit	\N	2022-07-19 17:29:18.400081+05:30	445	185
465	Credit	\N	2022-07-19 17:32:48.280107+05:30	443	186
466	Credit	\N	2022-07-19 17:34:51.773723+05:30	445	185
467	Debit	\N	2022-07-19 17:34:59.578872+05:30	446	186
468	Credit	\N	2022-07-19 17:35:01.15212+05:30	444	185
469	Debit	\N	2022-07-19 17:36:34.433836+05:30	447	185
470	Debit	\N	2022-07-19 17:37:12.238502+05:30	448	185
471	Debit	\N	2022-07-19 17:57:45.047774+05:30	449	186
472	Debit	\N	2022-07-19 18:04:33.888761+05:30	450	185
473	Debit	\N	2022-07-20 07:55:37.958234+05:30	451	185
474	Debit	\N	2022-07-20 18:20:11.178089+05:30	452	174
475	Debit	\N	2022-07-21 15:22:03.294994+05:30	453	174
476	Debit	\N	2022-07-21 19:12:12.097691+05:30	454	174
477	Debit	\N	2022-07-22 17:45:29.221254+05:30	455	174
478	Debit	\N	2022-07-25 07:41:01.814383+05:30	456	174
479	Debit	\N	2022-07-26 15:37:56.519306+05:30	457	45
480	Debit	\N	2022-07-27 12:26:30.054329+05:30	458	174
481	Debit	\N	2022-07-27 12:26:51.818418+05:30	459	174
482	Debit	\N	2022-07-27 18:34:57.642645+05:30	460	186
483	Debit	\N	2022-07-31 21:45:56.772803+05:30	461	186
484	Debit	\N	2022-08-01 17:25:27.757834+05:30	462	174
485	Debit	\N	2022-08-02 11:53:24.518644+05:30	463	174
486	Debit	\N	2022-08-02 17:00:16.668979+05:30	464	174
487	Debit	\N	2022-08-06 16:47:44.22742+05:30	465	191
488	Debit	\N	2022-08-07 11:10:17.113818+05:30	466	191
489	Debit	\N	2022-08-09 12:12:19.598688+05:30	467	180
490	Debit	\N	2022-08-09 12:13:41.548952+05:30	468	180
491	Debit	\N	2022-08-09 22:27:31.952282+05:30	469	180
492	Debit	\N	2022-08-09 22:28:11.920223+05:30	470	180
493	Debit	\N	2022-08-09 22:30:09.370912+05:30	471	180
494	Debit	\N	2022-08-10 21:00:25.559382+05:30	472	180
495	Debit	\N	2022-08-13 13:45:37.11746+05:30	473	210
496	Debit	\N	2022-08-13 14:06:44.806955+05:30	474	210
497	Debit	\N	2022-08-13 14:27:53.992686+05:30	475	210
498	Debit	\N	2022-08-13 14:48:43.380015+05:30	476	210
499	Credit	\N	2022-08-13 15:54:26.071742+05:30	474	210
500	Credit	\N	2022-08-13 15:55:35.713849+05:30	476	210
501	Debit	\N	2022-08-13 16:58:24.138963+05:30	477	210
502	Debit	\N	2022-08-13 17:04:42.283678+05:30	478	210
503	Debit	\N	2022-08-13 18:26:21.099672+05:30	479	210
504	Debit	\N	2022-08-13 18:29:02.012977+05:30	480	210
505	Debit	\N	2022-08-13 18:33:21.195948+05:30	481	210
506	Debit	\N	2022-08-14 08:31:35.41564+05:30	482	208
507	Debit	\N	2022-08-14 08:38:15.625867+05:30	483	210
508	Debit	\N	2022-08-14 08:45:41.701393+05:30	484	210
509	Debit	\N	2022-08-14 15:05:40.722958+05:30	485	208
510	Debit	\N	2022-08-14 15:57:42.618163+05:30	486	210
511	Debit	\N	2022-08-14 15:59:06.467687+05:30	487	210
512	Debit	\N	2022-08-14 16:18:39.830166+05:30	488	210
513	Debit	\N	2022-08-14 16:19:17.47659+05:30	489	210
514	Debit	\N	2022-08-15 12:26:37.991257+05:30	490	208
515	Debit	\N	2022-08-15 13:44:25.882095+05:30	491	217
516	Credit	\N	2022-08-15 13:48:14.836524+05:30	491	217
517	Debit	\N	2022-08-15 13:49:04.446587+05:30	492	217
518	Debit	\N	2022-08-15 22:07:11.761419+05:30	493	219
519	Debit	\N	2022-08-16 07:28:06.290722+05:30	494	220
520	Debit	\N	2022-08-16 08:47:58.026583+05:30	495	220
521	Debit	\N	2022-08-17 10:07:23.29087+05:30	496	208
522	Debit	\N	2022-08-17 14:03:47.304599+05:30	497	224
523	Debit	\N	2022-08-18 13:06:44.828824+05:30	498	208
524	Debit	\N	2022-08-18 13:16:03.205151+05:30	499	49
525	Debit	\N	2022-08-18 13:39:14.721568+05:30	500	208
526	Debit	\N	2022-08-18 14:24:09.107263+05:30	501	208
527	Debit	\N	2022-08-18 15:45:31.448717+05:30	502	208
528	Debit	\N	2022-08-18 15:45:53.986274+05:30	503	49
529	Debit	\N	2022-08-18 15:46:47.058997+05:30	504	49
530	Debit	\N	2022-08-19 09:47:39.559206+05:30	505	208
531	Debit	\N	2022-08-19 20:52:51.748467+05:30	506	229
532	Debit	\N	2022-08-20 22:07:57.587238+05:30	507	3
533	Debit	\N	2022-08-20 22:08:21.875837+05:30	508	3
534	Debit	\N	2022-08-20 22:11:12.114866+05:30	509	3
535	Debit	\N	2022-08-20 22:11:50.58497+05:30	510	3
536	Debit	\N	2022-08-20 23:30:48.663686+05:30	511	238
537	Debit	\N	2022-08-21 00:24:46.948419+05:30	512	219
538	Credit	\N	2022-08-21 11:56:19.84626+05:30	507	3
539	Credit	\N	2022-08-21 11:56:32.668867+05:30	508	3
540	Debit	\N	2022-08-21 13:21:36.315921+05:30	513	3
541	Debit	\N	2022-08-21 13:33:04.305442+05:30	514	49
542	Debit	\N	2022-08-21 15:50:18.834329+05:30	515	238
543	Debit	\N	2022-08-21 16:15:06.442918+05:30	516	49
544	Debit	\N	2022-08-21 16:45:39.279991+05:30	517	49
545	Debit	\N	2022-08-21 18:00:03.089887+05:30	518	238
546	Debit	\N	2022-08-21 18:14:49.33955+05:30	519	238
547	Debit	\N	2022-08-21 18:19:08.345706+05:30	520	245
548	Debit	\N	2022-08-21 19:06:48.865831+05:30	521	245
549	Debit	\N	2022-08-21 19:07:31.267831+05:30	522	245
550	Debit	\N	2022-08-21 20:13:48.291488+05:30	523	234
551	Debit	\N	2022-08-21 21:31:30.129233+05:30	524	49
552	Debit	\N	2022-08-21 22:12:58.532048+05:30	525	49
553	Debit	\N	2022-08-22 07:09:04.066973+05:30	526	49
554	Debit	\N	2022-08-22 08:02:38.701225+05:30	527	239
555	Debit	\N	2022-08-22 08:05:52.510649+05:30	528	239
556	Debit	\N	2022-08-22 08:19:06.537842+05:30	529	239
557	Debit	\N	2022-08-22 08:32:14.424427+05:30	530	239
558	Debit	\N	2022-08-22 08:42:05.691049+05:30	531	49
559	Debit	\N	2022-08-22 09:21:35.166771+05:30	532	245
560	Debit	\N	2022-08-22 09:22:52.585801+05:30	533	239
561	Debit	\N	2022-08-22 09:33:55.081789+05:30	534	239
562	Debit	\N	2022-08-22 09:50:38.151331+05:30	535	250
563	Debit	\N	2022-08-22 10:28:16.098465+05:30	536	49
564	Debit	\N	2022-08-22 10:55:09.761836+05:30	537	239
565	Debit	\N	2022-08-22 11:16:46.095293+05:30	538	234
566	Debit	\N	2022-08-22 14:06:59.504058+05:30	539	250
567	Debit	\N	2022-08-22 16:34:40.814221+05:30	540	219
568	Debit	\N	2022-08-22 19:34:42.258135+05:30	541	250
569	Debit	\N	2022-08-22 20:08:26.185461+05:30	542	3
570	Debit	\N	2022-08-22 20:08:46.132018+05:30	543	3
571	Credit	\N	2022-08-22 20:09:31.032781+05:30	541	250
572	Debit	\N	2022-08-22 20:24:16.590856+05:30	544	250
573	Debit	\N	2022-08-22 21:17:19.781638+05:30	545	208
574	Debit	\N	2022-08-23 08:46:59.483676+05:30	546	49
575	Debit	\N	2022-08-23 09:50:44.463695+05:30	547	239
576	Debit	\N	2022-08-23 13:02:20.89732+05:30	548	208
577	Debit	\N	2022-08-23 13:34:05.653889+05:30	549	219
578	Debit	\N	2022-08-23 15:18:23.341752+05:30	550	49
579	Debit	\N	2022-08-23 15:23:00.436233+05:30	551	49
580	Debit	\N	2022-08-23 15:43:35.445303+05:30	552	49
581	Debit	\N	2022-08-23 16:14:13.972902+05:30	553	49
582	Debit	\N	2022-08-23 17:12:37.774595+05:30	554	208
583	Debit	\N	2022-08-23 17:33:08.401983+05:30	555	49
584	Debit	\N	2022-08-23 20:13:51.877263+05:30	556	49
585	Debit	\N	2022-08-23 20:50:54.307106+05:30	557	238
586	Debit	\N	2022-08-23 20:57:50.077284+05:30	558	49
587	Debit	\N	2022-08-23 21:47:40.42565+05:30	559	49
588	Debit	\N	2022-08-23 22:21:00.93757+05:30	560	49
589	Debit	\N	2022-08-23 23:41:52.796046+05:30	561	234
590	Debit	\N	2022-08-23 23:44:41.039163+05:30	562	234
591	Debit	\N	2022-08-24 11:49:04.230774+05:30	563	49
592	Debit	\N	2022-08-24 15:57:50.597097+05:30	564	239
593	Debit	\N	2022-08-24 15:59:16.787073+05:30	565	239
594	Debit	\N	2022-08-24 16:00:16.271403+05:30	566	239
595	Debit	\N	2022-08-24 16:01:57.903536+05:30	567	239
596	Debit	\N	2022-08-24 16:03:31.280826+05:30	568	239
597	Debit	\N	2022-08-24 16:04:17.211279+05:30	569	239
598	Debit	\N	2022-08-24 16:05:34.546668+05:30	570	239
599	Debit	\N	2022-08-24 16:06:59.117991+05:30	571	239
600	Debit	\N	2022-08-24 16:08:32.392457+05:30	572	239
601	Debit	\N	2022-08-24 18:56:15.42555+05:30	573	238
602	Debit	\N	2022-08-24 19:34:09.318036+05:30	574	49
603	Debit	\N	2022-08-24 19:44:57.579558+05:30	575	49
604	Debit	\N	2022-08-24 20:49:12.9829+05:30	576	49
605	Debit	\N	2022-08-24 21:08:13.913727+05:30	577	49
606	Debit	\N	2022-08-24 21:16:22.195659+05:30	578	3
607	Debit	\N	2022-08-24 21:21:24.985125+05:30	579	49
608	Debit	\N	2022-08-24 22:26:55.564829+05:30	580	238
609	Debit	\N	2022-08-25 09:49:00.546095+05:30	581	3
610	Debit	\N	2022-08-25 09:50:40.795664+05:30	582	3
611	Debit	\N	2022-08-25 11:05:56.560588+05:30	583	49
612	Debit	\N	2022-08-25 11:29:44.741162+05:30	584	239
613	Debit	\N	2022-08-25 12:00:23.770445+05:30	585	49
614	Debit	\N	2022-08-25 12:41:52.868362+05:30	586	245
615	Debit	\N	2022-08-25 12:42:57.699873+05:30	587	245
616	Debit	\N	2022-08-25 15:36:39.769504+05:30	588	234
617	Debit	\N	2022-08-25 17:43:32.100089+05:30	589	239
618	Debit	\N	2022-08-25 17:47:45.60355+05:30	590	239
619	Debit	\N	2022-08-25 17:50:05.392433+05:30	591	239
620	Debit	\N	2022-08-25 19:07:53.477346+05:30	592	49
621	Debit	\N	2022-08-25 19:22:11.649919+05:30	593	268
622	Debit	\N	2022-08-25 19:35:49.875717+05:30	594	268
623	Debit	\N	2022-08-25 21:36:59.386888+05:30	595	268
624	Debit	\N	2022-08-26 07:15:21.385491+05:30	596	268
625	Debit	\N	2022-08-26 09:00:23.243509+05:30	597	270
626	Debit	\N	2022-08-26 10:48:29.079833+05:30	598	270
627	Debit	\N	2022-08-26 12:38:15.160716+05:30	599	271
628	Debit	\N	2022-08-26 12:55:59.415336+05:30	600	271
629	Debit	\N	2022-08-26 18:02:55.001801+05:30	601	250
630	Debit	\N	2022-08-26 18:33:04.480201+05:30	602	250
631	Debit	\N	2022-08-26 18:58:07.026755+05:30	603	250
632	Debit	\N	2022-08-26 19:23:57.280612+05:30	604	49
633	Debit	\N	2022-08-26 19:36:19.732026+05:30	605	250
634	Debit	\N	2022-08-26 20:46:48.417506+05:30	606	250
635	Debit	\N	2022-08-26 20:51:35.830701+05:30	607	270
636	Debit	\N	2022-08-26 21:10:21.863466+05:30	608	270
637	Debit	\N	2022-08-27 09:52:16.565315+05:30	609	271
638	Debit	\N	2022-08-27 10:30:07.205798+05:30	610	49
639	Debit	\N	2022-08-27 10:34:19.215172+05:30	611	49
640	Debit	\N	2022-08-27 10:40:07.002494+05:30	612	49
641	Debit	\N	2022-08-27 10:54:04.914637+05:30	613	49
642	Debit	\N	2022-08-27 10:57:20.860451+05:30	614	49
643	Debit	\N	2022-08-27 11:35:13.807258+05:30	615	49
644	Debit	\N	2022-08-27 11:38:35.412205+05:30	616	49
645	Debit	\N	2022-08-27 11:57:20.714027+05:30	617	49
646	Debit	\N	2022-08-27 12:03:01.760756+05:30	618	272
647	Debit	\N	2022-08-27 12:11:34.468365+05:30	619	272
648	Debit	\N	2022-08-27 13:03:49.905779+05:30	620	49
649	Debit	\N	2022-08-27 14:29:49.415108+05:30	621	280
650	Debit	\N	2022-08-27 14:33:11.536014+05:30	622	280
651	Debit	\N	2022-08-27 15:22:58.870306+05:30	623	49
652	Debit	\N	2022-08-27 15:31:32.360535+05:30	624	272
653	Debit	\N	2022-08-27 15:32:06.667079+05:30	625	272
654	Debit	\N	2022-08-27 15:32:39.237429+05:30	626	272
655	Debit	\N	2022-08-27 15:33:25.56737+05:30	627	272
656	Debit	\N	2022-08-27 15:39:06.340258+05:30	628	49
657	Debit	\N	2022-08-27 16:02:30.016386+05:30	629	250
658	Debit	\N	2022-08-27 16:31:07.492879+05:30	630	250
659	Debit	\N	2022-08-27 17:35:17.662264+05:30	631	250
660	Debit	\N	2022-08-27 18:15:18.488102+05:30	632	245
661	Debit	\N	2022-08-27 18:15:37.019443+05:30	633	245
662	Debit	\N	2022-08-27 18:15:54.637763+05:30	634	245
663	Debit	\N	2022-08-27 18:16:25.838332+05:30	635	245
664	Debit	\N	2022-08-27 18:16:47.309057+05:30	636	245
665	Debit	\N	2022-08-27 18:17:07.717334+05:30	637	245
666	Debit	\N	2022-08-27 18:17:28.268536+05:30	638	245
667	Debit	\N	2022-08-28 01:25:59.208835+05:30	639	219
668	Debit	\N	2022-08-28 07:48:21.53414+05:30	640	250
669	Debit	\N	2022-08-28 08:31:17.157568+05:30	641	270
670	Debit	\N	2022-08-28 08:36:51.534193+05:30	642	270
671	Debit	\N	2022-08-28 08:51:19.346334+05:30	643	270
672	Debit	\N	2022-08-28 08:55:26.071471+05:30	644	270
673	Debit	\N	2022-08-28 14:04:42.291039+05:30	645	270
674	Debit	\N	2022-08-28 15:14:40.325279+05:30	646	250
675	Debit	\N	2022-08-28 17:34:32.936283+05:30	647	272
676	Credit	\N	2022-08-28 18:25:28.009761+05:30	640	250
677	Debit	\N	2022-08-28 18:26:54.558877+05:30	648	250
678	Debit	\N	2022-08-28 18:38:15.659161+05:30	649	250
679	Debit	\N	2022-08-28 18:45:20.127196+05:30	650	250
680	Debit	\N	2022-08-28 20:50:23.340146+05:30	651	272
681	Debit	\N	2022-08-28 20:55:19.937149+05:30	652	250
682	Debit	\N	2022-08-28 21:45:13.766684+05:30	653	250
683	Debit	\N	2022-08-29 11:06:45.921068+05:30	654	49
684	Credit	\N	2022-08-29 15:53:48.085607+05:30	652	250
685	Debit	\N	2022-08-29 15:57:10.514131+05:30	655	268
686	Debit	\N	2022-08-29 16:32:39.60605+05:30	656	268
687	Debit	\N	2022-08-29 16:39:38.887085+05:30	657	268
688	Debit	\N	2022-08-30 07:58:13.292211+05:30	658	270
689	Debit	\N	2022-08-30 08:22:42.726887+05:30	659	270
690	Debit	\N	2022-08-30 08:24:32.807113+05:30	660	270
691	Debit	\N	2022-08-30 08:31:57.63371+05:30	661	281
692	Debit	\N	2022-08-30 10:05:48.543005+05:30	662	270
693	Debit	\N	2022-08-30 13:31:35.476194+05:30	663	268
694	Debit	\N	2022-08-30 18:27:52.6074+05:30	664	250
695	Debit	\N	2022-08-30 20:52:26.376323+05:30	665	238
696	Debit	\N	2022-08-30 21:33:07.318419+05:30	666	294
697	Debit	\N	2022-08-30 21:45:49.745058+05:30	667	238
698	Debit	\N	2022-08-31 11:32:09.925723+05:30	668	295
699	Debit	\N	2022-08-31 17:26:39.58749+05:30	669	49
700	Debit	\N	2022-08-31 17:40:20.674696+05:30	670	49
701	Debit	\N	2022-08-31 17:43:24.907087+05:30	671	49
702	Debit	\N	2022-08-31 17:47:52.900878+05:30	672	49
703	Debit	\N	2022-08-31 18:26:36.123971+05:30	673	183
704	Debit	\N	2022-08-31 19:23:21.59741+05:30	674	183
705	Debit	\N	2022-08-31 21:30:04.495454+05:30	675	49
706	Debit	\N	2022-08-31 21:36:30.972987+05:30	676	49
707	Debit	\N	2022-08-31 22:12:51.763895+05:30	677	49
708	Debit	\N	2022-09-01 09:21:39.425044+05:30	678	268
709	Debit	\N	2022-09-01 12:29:59.354393+05:30	679	281
710	Credit	\N	2022-09-02 00:01:28.837483+05:30	561	234
711	Debit	\N	2022-09-02 11:49:30.409918+05:30	680	294
712	Debit	\N	2022-09-02 16:00:01.687606+05:30	681	272
713	Debit	\N	2022-09-02 16:21:52.422137+05:30	682	239
714	Debit	\N	2022-09-02 19:04:08.84716+05:30	683	239
715	Debit	\N	2022-09-02 20:57:28.8759+05:30	684	309
716	Debit	\N	2022-09-02 21:51:24.026019+05:30	685	309
717	Debit	\N	2022-09-02 21:52:05.315835+05:30	686	309
718	Debit	\N	2022-09-03 07:12:30.048342+05:30	687	309
719	Debit	\N	2022-09-03 11:17:07.004421+05:30	688	49
720	Debit	\N	2022-09-03 16:48:21.450453+05:30	689	309
721	Debit	\N	2022-09-03 16:50:28.26774+05:30	690	49
722	Debit	\N	2022-09-03 21:14:56.834466+05:30	691	310
723	Debit	\N	2022-09-03 21:14:59.565106+05:30	692	310
724	Debit	\N	2022-09-03 21:40:49.862963+05:30	693	310
725	Debit	\N	2022-09-03 21:42:27.243473+05:30	694	310
726	Debit	\N	2022-09-04 10:59:15.130734+05:30	695	270
727	Debit	\N	2022-09-04 14:39:53.410736+05:30	696	305
728	Debit	\N	2022-09-04 14:41:26.323776+05:30	697	305
729	Debit	\N	2022-09-04 14:43:13.199827+05:30	698	305
730	Debit	\N	2022-09-04 14:55:36.361618+05:30	699	309
731	Debit	\N	2022-09-04 15:06:23.3045+05:30	700	309
732	Debit	\N	2022-09-04 17:00:00.657391+05:30	701	289
733	Debit	\N	2022-09-05 08:21:39.000607+05:30	702	49
734	Debit	\N	2022-09-05 08:34:03.416164+05:30	703	49
735	Debit	\N	2022-09-05 09:01:06.222635+05:30	704	289
736	Debit	\N	2022-09-05 09:01:24.658806+05:30	705	289
737	Debit	\N	2022-09-05 09:02:39.406328+05:30	706	289
738	Debit	\N	2022-09-05 09:03:44.919056+05:30	707	289
739	Debit	\N	2022-09-05 09:12:38.896741+05:30	708	294
740	Debit	\N	2022-09-05 09:24:57.525649+05:30	709	289
741	Debit	\N	2022-09-05 09:25:22.968758+05:30	710	289
742	Debit	\N	2022-09-05 09:27:15.05165+05:30	711	289
743	Debit	\N	2022-09-05 09:35:25.795022+05:30	712	294
744	Debit	\N	2022-09-05 09:36:27.782007+05:30	713	294
745	Debit	\N	2022-09-05 15:07:14.822413+05:30	714	49
746	Debit	\N	2022-09-05 15:14:51.76696+05:30	715	49
747	Debit	\N	2022-09-05 18:52:21.87778+05:30	716	49
748	Debit	\N	2022-09-05 21:30:19.781158+05:30	717	183
\.


--
-- Data for Name: orders_transanctionsmodel; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.orders_transanctionsmodel (id, is_approved, transanction_type, method, status, amount, last_updated, created, user_id, transaction_id) FROM stdin;
242	f	Credit	QR	Approved	10	2022-08-12 19:50:32.417654+05:30	2022-08-12 19:50:32.417678+05:30	208	T2208121946489286529046
40	f	Credit	QR	Approved	500	2022-01-19 12:26:10.934324+05:30	2022-01-19 12:14:44.650011+05:30	16	T2201191204227232631500
245	f	Credit	QR	Approved	30	2022-08-14 08:27:19.254455+05:30	2022-08-14 08:27:19.254479+05:30	208	T2208140826104711730153
41	f	Credit	QR	Approved	30	2022-01-19 12:40:09.150705+05:30	2022-01-19 12:39:39.197282+05:30	22	202201191239140035
60	f	Credit	QR	Approved	10	2022-01-23 21:45:41.965651+05:30	2022-01-23 21:45:07.405983+05:30	35	202201232136500002
248	f	Credit	QR	Approved	100	2022-08-14 15:41:23.344979+05:30	2022-08-14 15:41:23.345003+05:30	208	T2208141533020364961360
61	f	Credit	QR	Approved	20	2022-01-24 12:01:13.437075+05:30	2022-01-24 12:00:23.917147+05:30	14	202201241156410085
62	f	Credit	QR	Approved	10	2022-01-24 16:08:56.00308+05:30	2022-01-24 16:06:47.996339+05:30	35	202201241552240065
42	f	Credit	QR	Approved	20	2022-01-19 13:08:26.669489+05:30	2022-01-19 13:07:11.321381+05:30	21	202201191306430098
9	t	Credit	QR	Approved	50	2022-01-17 10:43:23.900862+05:30	2022-01-17 10:38:01.643217+05:30	14	Xx0063
63	f	Credit	QR	Approved	65	2022-01-25 12:50:38.097389+05:30	2022-01-25 12:49:17.350827+05:30	14	202201251245060071
64	f	Credit	QR	Approved	10	2022-01-25 21:32:49.984732+05:30	2022-01-25 21:32:20.114178+05:30	35	202201252130570049
14	f	Credit	QR	Approved	20	2022-01-17 12:46:07.849836+05:30	2022-01-17 12:43:49.639203+05:30	15	201709880286
65	f	Credit	QR	Approved	20	2022-01-27 13:41:53.60785+05:30	2022-01-27 13:41:39.254367+05:30	41	T2201271340190050122319
17	t	Credit	QR	Approved	20	2022-01-17 14:36:08.421229+05:30	2022-01-17 14:36:08.421248+05:30	16	T2201171425397710185242
43	f	Credit	QR	Approved	50	2022-01-19 13:31:12.52521+05:30	2022-01-19 13:27:50.664064+05:30	21	202201191327210063
18	f	Credit	QR	Approved	20	2022-01-17 15:48:13.478215+05:30	2022-01-17 15:30:26.9092+05:30	17	201772073959
66	f	Credit	QR	Approved	20	2022-01-27 14:16:18.291114+05:30	2022-01-27 13:42:45.189348+05:30	41	T2201271340190050122319
21	f	Credit	QR	Approved	200	2022-01-17 17:22:16.432808+05:30	2022-01-17 17:19:57.656566+05:30	16	T2201171716542481515630
67	f	Credit	QR	Approved	20	2022-01-27 14:43:06.908257+05:30	2022-01-27 14:17:26.154672+05:30	35	202201271415020086
24	f	Credit	QR	Approved	100	2022-01-17 19:29:51.896427+05:30	2022-01-17 19:29:26.32053+05:30	14	202201171928240008
68	f	Credit	QR	Approved	30	2022-01-27 18:31:01.543335+05:30	2022-01-27 18:13:36.737088+05:30	35	202201232136500002
25	f	Credit	QR	Approved	50	2022-01-17 21:18:58.94714+05:30	2022-01-17 21:15:38.091602+05:30	14	202201172101340087
69	f	Credit	QR	Approved	50	2022-01-27 20:32:28.545941+05:30	2022-01-27 20:32:01.596715+05:30	1	2022012720313500122
27	f	Credit	QR	Approved	50	2022-01-18 11:46:32.563704+05:30	2022-01-18 11:45:55.629446+05:30	14	2022011811445500107
251	f	Credit	QR	Approved	60	2022-08-16 07:16:40.598405+05:30	2022-08-16 07:16:40.59843+05:30	220	202208151529200090
28	f	Credit	QR	Approved	100	2022-01-18 16:16:02.746895+05:30	2022-01-18 16:10:18.397484+05:30	16	T2201181608279231423599
254	f	Credit	QR	Approved	110	2022-08-19 09:46:06.468865+05:30	2022-08-19 09:46:06.468889+05:30	208	T2208190935175032322751
255	f	Credit	QR	Approved	35	2022-08-19 20:42:24.663846+05:30	2022-08-19 20:42:24.663871+05:30	229	202208192040350064
31	f	Credit	QR	Approved	70	2022-01-18 18:34:31.796001+05:30	2022-01-18 18:33:13.667454+05:30	14	2022011818314400106
258	f	Credit	QR	Approved	50	2022-08-21 07:40:34.439421+05:30	2022-08-21 07:40:34.439445+05:30	238	223357328757
70	f	Credit	QR	Approved	10	2022-01-28 10:56:39.895451+05:30	2022-01-28 10:33:12.341315+05:30	45	202201281032180036
75	f	Credit	QR	Approved	60	2022-01-28 20:08:53.630023+05:30	2022-01-28 20:06:15.00507+05:30	14	202201282000530099
76	f	Credit	QR	Approved	10	2022-01-29 15:16:37.055339+05:30	2022-01-29 15:01:37.699471+05:30	35	202201291500540041
77	f	Credit	QR	Approved	10	2022-01-29 16:46:43.664815+05:30	2022-01-29 16:45:56.474771+05:30	35	202201291645270035
78	f	Credit	QR	Approved	65	2022-01-29 22:01:17.960844+05:30	2022-01-29 21:54:48.935989+05:30	14	202201292148080027
79	f	Credit	QR	Approved	10	2022-01-30 08:03:58.4505+05:30	2022-01-30 07:49:46.265629+05:30	35	202201300748190020
80	f	Credit	QR	Approved	20	2022-01-30 23:04:35.691534+05:30	2022-01-30 21:58:44.074204+05:30	35	202201302158030042
46	f	Credit	QR	Approved	100	2022-01-19 21:03:06.639959+05:30	2022-01-19 21:01:25.904982+05:30	14	202201192059590020
47	f	Credit	QR	Approved	50	2022-01-20 14:29:17.981428+05:30	2022-01-20 14:15:45.152749+05:30	14	202201201408460086
82	f	Credit	QR	Approved	70	2022-01-31 21:55:09.090339+05:30	2022-01-31 21:49:52.140664+05:30	14	202201312135020043
49	f	Credit	QR	Approved	110	2022-01-20 17:49:08.017241+05:30	2022-01-20 17:41:58.909228+05:30	14	202201201739570040
261	f	Credit	QR	Approved	20	2022-08-21 18:12:49.827782+05:30	2022-08-21 18:12:49.827806+05:30	238	223367978805
50	f	Credit	QR	Approved	50	2022-01-21 11:41:42.964459+05:30	2022-01-21 11:31:07.19648+05:30	14	202201211128390016
51	t	Credit	QR	Approved	120	2022-01-21 17:37:17.849036+05:30	2022-01-21 17:35:20.070668+05:30	14	202201211732470011
52	f	Credit	QR	Approved	250	2022-01-21 19:48:15.422495+05:30	2022-01-21 19:40:26.082179+05:30	14	202201211937040044
84	f	Credit	QR	Approved	50	2022-02-06 21:32:42.400786+05:30	2022-02-06 21:31:15.402988+05:30	49	2022020621184800110
54	f	Credit	QR	Approved	100	2022-01-22 11:08:47.688941+05:30	2022-01-22 11:03:21.875423+05:30	14	202201221032240029
264	f	Credit	QR	Approved	10	2022-08-21 19:18:52.281557+05:30	2022-08-21 19:18:52.281581+05:30	234	202208211918210060
56	f	Credit	QR	Approved	80	2022-01-23 12:01:41.12053+05:30	2022-01-23 11:17:13.482367+05:30	14	202201231116070060
86	f	Credit	QR	Approved	240	2022-02-10 16:10:23.771772+05:30	2022-02-10 16:03:17.840921+05:30	61	204151063220
87	f	Credit	QR	Approved	50	2022-02-10 16:51:59.556256+05:30	2022-02-10 16:51:35.115492+05:30	14	202202101649360008
92	f	Credit	QR	Approved	180	2022-02-10 18:29:56.889657+05:30	2022-02-10 18:25:47.364615+05:30	63	202202101817500035
93	f	Credit	QR	Approved	10	2022-02-10 22:18:30.545484+05:30	2022-02-10 22:18:13.376892+05:30	70	prince_vicky_2345
95	f	Credit	QR	Approved	20	2022-02-10 22:45:27.838132+05:30	2022-02-10 22:43:51.188983+05:30	70	202202102215220017
105	f	Credit	QR	Approved	10	2022-02-14 20:38:17.537205+05:30	2022-02-14 20:37:30.952578+05:30	90	103
100	f	Credit	QR	Approved	50	2022-02-12 13:10:53.89344+05:30	2022-02-12 02:01:18.800398+05:30	71	99
102	f	Credit	QR	Approved	10	2022-02-14 20:18:54.778016+05:30	2022-02-14 20:16:13.070842+05:30	3	9012
106	f	Credit	QR	Approved	10	2022-02-14 20:43:31.939893+05:30	2022-02-14 20:42:50.786191+05:30	90	8203
108	f	Credit	QR	Approved	10	2022-02-14 21:04:05.427979+05:30	2022-02-14 20:55:50.004918+05:30	90	0122
110	f	Credit	QR	Approved	20	2022-02-14 21:26:12.555879+05:30	2022-02-14 21:25:17.303049+05:30	90	0017
111	f	Credit	QR	Approved	80	2022-02-15 11:21:45.87493+05:30	2022-02-15 10:34:29.258311+05:30	90	8276
113	f	Credit	QR	Approved	200	2022-02-15 12:31:24.690562+05:30	2022-02-15 12:30:05.819832+05:30	90	3861
114	f	Credit	QR	Approved	50	2022-02-15 18:52:38.150995+05:30	2022-02-15 17:15:59.681991+05:30	90	1911
116	f	Credit	QR	Approved	50	2022-02-16 19:40:18.360887+05:30	2022-02-16 19:34:45.585731+05:30	90	7960
117	f	Credit	QR	Approved	40	2022-02-16 19:57:48.586002+05:30	2022-02-16 19:41:52.995015+05:30	14	2022021619392600113
118	f	Credit	QR	Approved	70	2022-02-17 13:49:19.500892+05:30	2022-02-17 13:47:49.731+05:30	90	5659
123	f	Credit	QR	Approved	10	2022-02-19 21:55:50.715238+05:30	2022-02-19 21:50:10.708836+05:30	70	202202102215220017
125	f	Credit	QR	Approved	50	2022-02-20 19:19:53.440286+05:30	2022-02-20 19:17:44.722436+05:30	109	202202201916030040
243	f	Credit	QR	Approved	30	2022-08-13 13:41:27.231164+05:30	2022-08-13 13:41:27.231188+05:30	210	T2208131337470931603730
246	f	Credit	QR	Approved	89	2022-08-14 08:35:59.143734+05:30	2022-08-14 08:35:59.143759+05:30	210	T2208140834391835626398
249	f	Credit	QR	Approved	43	2022-08-14 16:17:19.942793+05:30	2022-08-14 16:17:19.942819+05:30	210	T2208141616250566529264
252	f	Credit	QR	Approved	50	2022-08-17 13:52:10.056153+05:30	2022-08-17 13:52:10.056177+05:30	224	T2208171350583769118730
131	f	Credit	QR	Approved	20	2022-02-24 19:11:25.624027+05:30	2022-02-24 18:53:52.209344+05:30	134	205565214149
256	f	Credit	QR	Approved	20	2022-08-20 21:58:11.781947+05:30	2022-08-20 21:58:11.781971+05:30	238	223254538741
259	f	Credit	QR	Approved	100	2022-08-21 12:03:46.133487+05:30	2022-08-21 12:03:46.133511+05:30	49	202208211046050087
262	f	Credit	QR	Approved	20	2022-08-21 18:16:05.628769+05:30	2022-08-21 18:16:05.628799+05:30	245	T2208211814125053957002
172	f	Credit	QR	Approved	10	2022-03-08 21:20:58.066398+05:30	2022-03-08 21:20:44.007734+05:30	129	202203082119180060
265	f	Credit	QR	Approved	100	2022-08-21 23:31:42.854143+05:30	2022-08-21 21:58:37.682131+05:30	49	223321290464
267	f	Credit	QR	Approved	10	2022-08-22 08:15:33.208987+05:30	2022-08-22 08:15:33.20901+05:30	239	202208220809090065
140	f	Credit	QR	Approved	100	2022-02-26 12:42:21.206538+05:30	2022-02-26 12:41:58.460221+05:30	139	20220226 1240500092
139	f	Credit	QR	Approved	10	2022-02-26 21:37:26.443116+05:30	2022-02-26 12:17:11.321802+05:30	137	202202261214560056
141	f	Credit	QR	Approved	45	2022-02-26 22:14:30.490197+05:30	2022-02-26 22:03:57.727202+05:30	14	202202262133120098
269	f	Credit	QR	Approved	100	2022-08-22 19:31:25.851118+05:30	2022-08-22 19:31:25.851144+05:30	250	T2208221930244826295232
143	f	Credit	QR	Approved	500	2022-02-28 01:33:33.476107+05:30	2022-02-28 01:32:41.785629+05:30	102	T2202280132182089826085
271	f	Credit	QR	Approved	10	2022-08-23 09:49:28.250975+05:30	2022-08-23 09:49:28.251+05:30	239	202208230948460015
275	f	Credit	QR	Approved	11	2022-08-23 21:41:13.826929+05:30	2022-08-23 21:41:13.826964+05:30	49	223521163433
146	f	Credit	QR	Approved	450	2022-02-28 17:08:35.10447+05:30	2022-02-28 17:07:50.907918+05:30	102	T2202281707233013456464
277	f	Credit	QR	Approved	20	2022-08-24 18:51:02.790894+05:30	2022-08-24 18:51:02.790919+05:30	238	223634181435
279	f	Credit	QR	Approved	11	2022-08-24 21:19:15.605215+05:30	2022-08-24 21:19:15.605239+05:30	49	223621959566
149	f	Credit	QR	Approved	48	2022-03-01 10:14:08.06674+05:30	2022-03-01 10:13:22.820751+05:30	70	T2203011011182998255145
150	f	Credit	QR	Approved	500	2022-03-02 13:35:10.093446+05:30	2022-03-02 13:34:48.738288+05:30	102	T2203021334107672820047
281	f	Credit	QR	Approved	30	2022-08-25 11:03:38.017002+05:30	2022-08-25 11:03:38.017028+05:30	49	223711548235
152	f	Credit	QR	Approved	500	2022-03-02 22:40:20.644923+05:30	2022-03-02 22:40:05.648345+05:30	102	202203022238360095
283	f	Credit	QR	Approved	10	2022-08-25 15:33:51.035632+05:30	2022-08-25 15:33:51.035658+05:30	234	202208251533220068
285	f	Credit	QR	Approved	10	2022-08-25 17:41:55.310376+05:30	2022-08-25 17:41:55.310398+05:30	239	202208251741250089
154	f	Credit	QR	Approved	410	2022-03-04 00:39:28.399475+05:30	2022-03-04 00:38:49.361084+05:30	102	T2203040038263814861437
287	f	Credit	QR	Approved	20	2022-08-25 19:07:16.599211+05:30	2022-08-25 19:07:16.599234+05:30	49	223719214438
289	f	Credit	QR	Approved	30	2022-08-26 09:05:34.205147+05:30	2022-08-26 09:05:34.205171+05:30	271	202208260904110011
291	f	Credit	QR	Approved	100	2022-08-26 17:59:55.080772+05:30	2022-08-26 17:59:55.080796+05:30	250	T2208261755555156646215
293	f	Credit	QR	Approved	20	2022-08-27 10:14:03.062702+05:30	2022-08-27 10:14:03.062725+05:30	49	223910697471
295	f	Credit	QR	Approved	90	2022-08-27 11:21:16.210757+05:30	2022-08-27 11:21:16.210781+05:30	49	223911979548
161	f	Credit	QR	Approved	500	2022-03-04 13:11:24.464937+05:30	2022-03-04 11:58:44.100435+05:30	102	T2203041151548661102062
162	f	Credit	QR	Approved	100	2022-03-05 00:16:44.809084+05:30	2022-03-05 00:01:48.524131+05:30	14	2022030500010400115
297	f	Credit	QR	Approved	20	2022-08-27 14:28:47.139619+05:30	2022-08-27 14:28:47.139643+05:30	280	202208271428000076
164	f	Credit	QR	Approved	300	2022-03-05 13:00:39.424187+05:30	2022-03-05 12:59:29.689403+05:30	109	2022030512585200120
299	f	Credit	QR	Approved	128	2022-08-27 15:29:23.465313+05:30	2022-08-27 15:29:23.465338+05:30	272	T2208271528023339411115
166	f	Credit	QR	Approved	50	2022-03-05 22:48:35.624101+05:30	2022-03-05 22:47:18.416372+05:30	14	2022030522461100124
167	f	Credit	QR	Approved	30	2022-03-06 12:47:00.364069+05:30	2022-03-06 12:44:46.724581+05:30	14	202203061242480005
168	f	Credit	QR	Approved	50	2022-03-06 19:11:44.176252+05:30	2022-03-06 18:03:35.323712+05:30	147	0637
169	f	Credit	QR	Approved	100	2022-03-08 14:44:46.770914+05:30	2022-03-08 14:43:46.853504+05:30	146	202203081442570030
170	f	Credit	QR	Approved	30	2022-03-08 20:20:58.185049+05:30	2022-03-08 20:09:43.233607+05:30	14	202203082004210013
171	f	Credit	QR	Approved	30	2022-03-08 20:44:44.613275+05:30	2022-03-08 20:41:43.432079+05:30	14	202203082039500008
173	f	Credit	QR	Approved	10	2022-03-09 11:49:02.198189+05:30	2022-03-09 11:48:28.854364+05:30	129	202203091148050016
174	f	Credit	QR	Approved	11	2022-03-11 21:54:19.862691+05:30	2022-03-11 21:20:45.884232+05:30	129	202203112119380093
175	f	Credit	QR	Approved	180	2022-03-13 14:54:20.960823+05:30	2022-03-13 14:44:56.332399+05:30	147	2919
176	f	Credit	QR	Approved	50	2022-03-16 22:40:06.945526+05:30	2022-03-16 22:38:09.696629+05:30	102	T2203162237199135512797
177	f	Credit	QR	Approved	10	2022-03-18 22:13:32.95012+05:30	2022-03-18 22:10:34.008131+05:30	14	2022031822100700115
301	f	Credit	QR	Approved	100	2022-08-27 16:29:36.370615+05:30	2022-08-27 16:29:36.370637+05:30	250	T2208271628536502603278
303	f	Credit	QR	Approved	100	2022-08-28 07:43:51.633685+05:30	2022-08-28 07:43:51.633709+05:30	250	T2208280723048823086374
305	f	Credit	QR	Approved	10	2022-08-28 08:53:54.225901+05:30	2022-08-28 08:53:54.225925+05:30	270	202208280852500071
307	f	Credit	QR	Approved	150	2022-08-28 17:32:44.038668+05:30	2022-08-28 17:32:44.038692+05:30	272	T2208281730300924357553
309	f	Credit	QR	Approved	10	2022-08-28 17:46:20.069328+05:30	2022-08-28 17:46:20.069353+05:30	281	T2208281745098324229164
181	f	Credit	QR	Approved	10	2022-03-24 15:24:44.006385+05:30	2022-03-24 15:17:58.597763+05:30	14	202203241517180031
182	f	Credit	QR	Approved	20	2022-04-06 09:20:17.178806+05:30	2022-04-06 09:11:05.352981+05:30	162	T2204060910151102732243
311	f	Credit	QR	Approved	73	2022-08-28 21:43:28.051763+05:30	2022-08-28 21:43:28.051786+05:30	250	T2208282141424618153507
313	f	Credit	QR	Approved	10	2022-08-29 16:38:52.364092+05:30	2022-08-29 16:38:52.364115+05:30	268	202208291638230031
185	f	Credit	QR	Approved	20	2022-04-08 22:15:15.604037+05:30	2022-04-08 18:18:32.323241+05:30	160	2810050501016
186	f	Credit	QR	Approved	10	2022-04-09 10:58:41.048843+05:30	2022-04-09 00:37:25.610997+05:30	14	202204090036500051
187	f	Credit	QR	Approved	30	2022-04-09 11:00:32.896128+05:30	2022-04-09 10:59:34.392916+05:30	160	2810050501016
188	f	Credit	QR	Approved	200	2022-04-19 19:36:40.774622+05:30	2022-04-19 16:29:31.990719+05:30	147	0405
189	f	Credit	QR	Approved	80	2022-04-23 13:09:35.004935+05:30	2022-04-23 08:25:13.95414+05:30	147	3907
315	f	Credit	QR	Approved	10	2022-08-30 08:36:56.687775+05:30	2022-08-30 08:36:56.687799+05:30	281	202208300835480093
317	f	Credit	QR	Approved	10	2022-08-30 12:44:10.96485+05:30	2022-08-30 12:44:10.964874+05:30	281	202208301243100052
319	f	Credit	QR	Approved	300	2022-08-30 23:33:24.959574+05:30	2022-08-30 23:33:24.959611+05:30	3	202208302332340097
193	f	Credit	QR	Approved	13	2022-04-26 11:12:46.998682+05:30	2022-04-26 10:44:07.123934+05:30	167	T2204261033504220617468
195	f	Credit	QR	Approved	60	2022-06-05 12:57:17.17867+05:30	2022-06-05 11:47:04.665207+05:30	171	202206051144290083
201	f	Credit	QR	Approved	20	2022-06-05 12:57:27.64407+05:30	2022-06-05 12:01:51.399893+05:30	171	215612465560
202	f	Credit	QR	Approved	40	2022-06-10 15:33:49.401882+05:30	2022-06-10 15:31:22.090539+05:30	171	202206101530390033
244	f	Credit	QR	Approved	100	2022-08-13 18:24:49.288395+05:30	2022-08-13 18:24:49.28842+05:30	210	T2208131815182955580318
247	f	Credit	QR	Approved	30	2022-08-14 15:00:44.044303+05:30	2022-08-14 15:00:44.044328+05:30	208	T2208141459298014484719
250	f	Credit	QR	Approved	10	2022-08-15 22:05:50.934361+05:30	2022-08-15 22:05:50.934414+05:30	219	202208152205220061
253	f	Credit	QR	Approved	300	2022-08-18 10:38:44.928414+05:30	2022-08-18 10:38:44.928438+05:30	208	T2208181037347034068523
257	f	Credit	QR	Approved	19	2022-08-21 00:17:35.011615+05:30	2022-08-21 00:17:35.011639+05:30	219	202208210016540025
203	f	Credit	QR	Approved	150	2022-06-11 00:29:07.985324+05:30	2022-06-10 23:46:08.562845+05:30	171	202206102344410022
208	f	Credit	QR	Approved	150	2022-06-11 00:36:55.929326+05:30	2022-06-11 00:36:55.929348+05:30	172	202206102344410028
209	f	Credit	QR	Approved	200	2022-06-11 22:51:28.9684+05:30	2022-06-11 22:51:28.968424+05:30	171	202206112250480045
210	f	Credit	QR	Approved	30	2022-06-12 01:55:05.869028+05:30	2022-06-12 01:55:05.869052+05:30	171	202206120154300056
211	f	Credit	QR	Approved	15	2022-06-12 15:36:52.723745+05:30	2022-06-12 15:36:52.723768+05:30	171	202206121536170028
212	f	Credit	QR	Approved	10	2022-06-12 15:55:28.603948+05:30	2022-06-12 15:55:28.603971+05:30	171	202206121554530063
213	f	Credit	QR	Approved	100	2022-06-12 16:22:00.59585+05:30	2022-06-12 16:22:00.595874+05:30	171	202206121621180031
214	f	Credit	QR	Approved	10	2022-06-13 12:13:50.26541+05:30	2022-06-13 12:13:50.265433+05:30	45	202206131213140026
215	f	Credit	QR	Approved	205	2022-06-14 09:08:03.837253+05:30	2022-06-14 09:08:03.837276+05:30	174	202206140904220095
216	f	Credit	QR	Approved	50	2022-06-14 15:10:24.847481+05:30	2022-06-14 15:10:24.847506+05:30	176	202206141509170020
217	f	Credit	QR	Approved	18	2022-06-24 19:54:43.608461+05:30	2022-06-24 19:54:43.608485+05:30	181	202206241953280051
218	f	Credit	QR	Approved	30	2022-06-25 14:52:45.602204+05:30	2022-06-25 14:52:45.602226+05:30	174	202206251446590026
219	f	Credit	QR	Approved	15	2022-06-28 19:06:12.411457+05:30	2022-06-28 19:06:12.411482+05:30	174	T2206281904327280754643
220	f	Credit	QR	Approved	11	2022-06-28 21:37:07.816951+05:30	2022-06-28 21:37:07.816975+05:30	174	T2206282136341778344746
221	f	Credit	QR	Approved	26	2022-06-30 13:07:23.149571+05:30	2022-06-30 13:07:23.149596+05:30	174	T2206301306231255145119
222	f	Credit	QR	Approved	15	2022-07-03 13:41:16.915255+05:30	2022-07-03 13:41:16.915279+05:30	181	202207031340380056
223	f	Credit	QR	Approved	14	2022-07-03 13:57:01.694667+05:30	2022-07-03 13:57:01.694693+05:30	181	202207031356200041
224	f	Credit	QR	Approved	50	2022-07-04 01:45:35.762825+05:30	2022-07-04 01:45:35.762849+05:30	181	202207040145000081
225	f	Credit	QR	Approved	50	2022-07-04 17:44:00.866416+05:30	2022-07-04 17:44:00.866439+05:30	174	T2207041742593554199627
226	f	Credit	QR	Approved	10	2022-07-06 12:00:53.627591+05:30	2022-07-06 12:00:53.627619+05:30	181	202207061159560063
227	f	Credit	QR	Approved	150	2022-07-10 10:35:02.099472+05:30	2022-07-10 10:35:02.099497+05:30	174	T2207101034110984559813
228	f	Credit	QR	Approved	170	2022-07-16 15:13:38.703236+05:30	2022-07-16 15:13:38.703261+05:30	174	T2207161512559090416641
229	f	Credit	QR	Approved	80	2022-07-16 22:03:14.051038+05:30	2022-07-16 22:03:14.051076+05:30	174	T2207162200406093306460
230	f	Credit	QR	Approved	18	2022-07-18 23:18:11.001513+05:30	2022-07-18 23:18:11.001539+05:30	186	202207182307350091
231	f	Credit	QR	Approved	70	2022-07-19 17:26:36.531303+05:30	2022-07-19 17:26:36.531327+05:30	185	202207191725450042
232	f	Credit	QR	Approved	30	2022-07-19 17:57:17.083947+05:30	2022-07-19 17:57:17.08397+05:30	186	202207191756280058
233	f	Credit	QR	Approved	600	2022-07-19 18:04:00.11371+05:30	2022-07-19 18:04:00.113734+05:30	185	202207191803230018
234	f	Credit	QR	Approved	12	2022-07-20 18:19:15.716912+05:30	2022-07-20 18:19:15.716935+05:30	174	T2207201815573522157088
235	f	Credit	QR	Approved	30	2022-07-21 19:09:55.327255+05:30	2022-07-21 19:09:55.327279+05:30	174	T2207211908132136005313
236	f	Credit	QR	Approved	21	2022-07-27 12:23:18.486436+05:30	2022-07-27 12:23:18.486461+05:30	174	T2207271221101714384105
237	f	Credit	QR	Approved	60	2022-07-27 18:34:00.037085+05:30	2022-07-27 18:34:00.037109+05:30	186	202207271833130045
238	f	Credit	QR	Approved	10	2022-08-01 17:23:11.673854+05:30	2022-08-01 17:23:11.67388+05:30	174	T2208011722412399573511
239	f	Credit	QR	Approved	10	2022-08-06 16:37:16.256356+05:30	2022-08-06 16:37:16.25638+05:30	191	T2208061636225875261455
240	f	Credit	QR	Approved	100	2022-08-09 12:10:50.637781+05:30	2022-08-09 12:10:50.637806+05:30	180	202208091208470023
241	f	Credit	QR	Approved	100	2022-08-09 22:25:00.662964+05:30	2022-08-09 22:25:00.662988+05:30	180	202208092209320063
260	f	Credit	QR	Approved	30	2022-08-21 16:53:26.74309+05:30	2022-08-21 16:53:26.743114+05:30	238	223366537793
263	f	Credit	QR	Approved	10	2022-08-21 18:29:05.704949+05:30	2022-08-21 18:29:05.704975+05:30	238	223368380906
266	f	Credit	QR	Approved	10	2022-08-22 08:00:25.550022+05:30	2022-08-22 08:00:25.550047+05:30	239	202208220759030074
268	f	Credit	QR	Approved	50	2022-08-22 09:46:48.302222+05:30	2022-08-22 09:46:48.302246+05:30	250	T2208220928110148822069
270	f	Credit	QR	Approved	210	2022-08-22 21:02:06.025759+05:30	2022-08-22 21:02:06.025783+05:30	208	T2208221838053566718827
272	f	Credit	QR	Approved	30	2022-08-23 13:32:24.800004+05:30	2022-08-23 13:32:24.800028+05:30	219	202208231331220089
273	f	Credit	QR	Approved	10	2022-08-23 15:39:11.273757+05:30	2022-08-23 15:39:11.273781+05:30	258	202208231537220048
274	f	Credit	QR	Approved	15	2022-08-23 20:12:41.073643+05:30	2022-08-23 20:12:41.073668+05:30	49	223520543575
276	f	Credit	QR	Approved	20	2022-08-23 22:20:32.124325+05:30	2022-08-23 22:20:32.12435+05:30	49	202208232217360087
278	f	Credit	QR	Approved	20	2022-08-24 19:35:56.146638+05:30	2022-08-24 19:35:56.146663+05:30	49	223619300711
280	f	Credit	QR	Approved	10	2022-08-24 22:07:02.397382+05:30	2022-08-24 22:07:02.397407+05:30	238	223638082688
282	f	Credit	QR	Approved	10	2022-08-25 12:37:46.468312+05:30	2022-08-25 12:37:46.468338+05:30	245	T2208251237145122292817
284	f	Credit	QR	Approved	10	2022-08-25 15:36:10.591343+05:30	2022-08-25 15:36:10.591367+05:30	234	202208251535330082
286	f	Credit	QR	Approved	40	2022-08-25 18:48:06.937488+05:30	2022-08-25 18:48:06.937513+05:30	268	202208251844150015
288	f	Credit	QR	Approved	10	2022-08-26 08:50:57.810682+05:30	2022-08-26 08:50:57.810706+05:30	270	202208260849580048
290	f	Credit	QR	Approved	100	2022-08-26 12:53:43.051378+05:30	2022-08-26 12:53:43.051403+05:30	271	202208261252580031
292	f	Credit	QR	Approved	100	2022-08-26 19:33:43.822441+05:30	2022-08-26 19:33:43.822465+05:30	250	T2208261923461609411074
294	f	Credit	QR	Approved	120	2022-08-27 10:29:23.186772+05:30	2022-08-27 10:29:23.186797+05:30	49	223910758424
296	f	Credit	QR	Approved	70	2022-08-27 11:52:40.633536+05:30	2022-08-27 11:52:40.63356+05:30	272	T2208271151418474265397
298	f	Credit	QR	Approved	400	2022-08-27 15:21:08.060809+05:30	2022-08-27 15:21:08.060832+05:30	49	223915320916
300	f	Credit	QR	Approved	250	2022-08-27 15:37:51.602251+05:30	2022-08-27 15:37:51.602275+05:30	49	223915393602
302	f	Credit	QR	Approved	150	2022-08-27 18:12:00.850674+05:30	2022-08-27 18:12:00.850697+05:30	245	T2208271811370212603157
304	f	Credit	QR	Approved	30	2022-08-28 08:24:59.079744+05:30	2022-08-28 08:24:59.079768+05:30	270	202208280824110058
306	f	Credit	QR	Approved	10	2022-08-28 14:02:47.872901+05:30	2022-08-28 14:02:47.872926+05:30	270	202208281402170076
308	f	Credit	QR	Approved	10	2022-08-28 17:44:18.187631+05:30	2022-08-28 17:44:18.187655+05:30	281	T2208281742378403379927
310	f	Credit	QR	Approved	100	2022-08-28 18:20:32.53034+05:30	2022-08-28 18:20:32.530362+05:30	250	T2208281816214350358149
312	f	Credit	QR	Approved	11	2022-08-29 15:55:40.842673+05:30	2022-08-29 15:55:40.842697+05:30	268	202208291555070066
314	f	Credit	QR	Approved	60	2022-08-30 08:20:47.558659+05:30	2022-08-30 08:20:47.558693+05:30	270	202208300820030055
316	f	Credit	QR	Approved	10	2022-08-30 10:04:34.978756+05:30	2022-08-30 10:04:34.97878+05:30	270	202208301003540048
318	f	Credit	QR	Approved	20	2022-08-30 21:31:04.048456+05:30	2022-08-30 21:31:04.04848+05:30	294	T2208302130093039714557
320	f	Credit	QR	Approved	15	2022-08-31 11:26:38.29798+05:30	2022-08-31 11:26:38.298018+05:30	295	T2208311125373256934501
321	f	Credit	QR	Approved	200	2022-08-31 17:39:45.490469+05:30	2022-08-31 17:39:45.490506+05:30	49	224317135779
322	f	Credit	QR	Approved	10	2022-08-31 19:04:56.297269+05:30	2022-08-31 19:04:56.297306+05:30	3	T2208311903037277809986
323	f	Credit	QR	Approved	80	2022-08-31 21:33:05.507415+05:30	2022-08-31 21:33:05.507439+05:30	49	224321688726
325	f	Credit	QR	Approved	200	2022-09-01 19:47:35.837247+05:30	2022-09-01 19:47:35.837271+05:30	305	202209011946330072
327	f	Credit	QR	Approved	200	2022-09-01 19:53:11.38348+05:30	2022-09-01 19:53:11.383503+05:30	305	T2209011948105967946843
328	f	Credit	QR	Approved	40	2022-09-02 11:47:35.510973+05:30	2022-09-02 11:47:35.510996+05:30	294	T2209021146337092293884
329	f	Credit	QR	Approved	10	2022-09-02 16:20:47.077653+05:30	2022-09-02 16:20:47.077678+05:30	239	202209021620020064
330	f	Credit	QR	Approved	10	2022-09-02 20:54:19.889269+05:30	2022-09-02 20:54:19.889294+05:30	309	202209022053170095
331	f	Credit	QR	Approved	17	2022-09-03 07:09:47.899773+05:30	2022-09-03 07:09:47.899798+05:30	309	202209030707320012
332	f	Credit	QR	Approved	20	2022-09-03 21:14:40.962746+05:30	2022-09-03 21:14:40.962771+05:30	310	202209031647000092
333	f	Credit	QR	Approved	60	2022-09-04 10:57:15.730361+05:30	2022-09-04 10:57:15.730412+05:30	270	202209041056270058
334	f	Credit	QR	Approved	20	2022-09-04 14:55:24.050056+05:30	2022-09-04 14:55:24.05008+05:30	309	202209041454480040
335	f	Credit	QR	Approved	10	2022-09-04 15:25:05.333857+05:30	2022-09-04 15:25:05.33389+05:30	289	T2209041524429181449850
336	f	Credit	QR	Approved	80	2022-09-05 08:15:44.479674+05:30	2022-09-05 08:15:44.479698+05:30	289	T2209050815244141564170
337	f	Credit	QR	Approved	20	2022-09-05 09:33:46.600537+05:30	2022-09-05 09:33:46.600561+05:30	294	T2209050914502057694940
338	f	Credit	QR	Approved	10	2022-09-05 15:06:16.872693+05:30	2022-09-05 15:06:16.872717+05:30	49	224815704406
339	f	Credit	QR	Approved	40	2022-09-05 15:13:51.405733+05:30	2022-09-05 15:13:51.405756+05:30	49	224815736609
\.


--
-- Data for Name: services_categorymodel; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.services_categorymodel (id, name, active, ranking) FROM stdin;
5	Telegram service 💖💖🔥🔥🔥	t	\N
4	Instagram Comments 📝📝	t	\N
6	Facebook Profile Followers 🙋🙋	t	\N
7	⚡ Facebook: Post Likes | Post Emoji (INDIAN🔥) 30 Days Refil	t	\N
8	👍 Facebook Post Likes	t	\N
9	👀 Youtube Views 👀	t	\N
10	💥Youtube Subscribers💥	t	\N
11	🔆 Youtube Likes/Dislikes🔆	t	\N
12	⏲👀 Youtube Watch Time 👀⏲	t	\N
13	⚡ Instagram Story & Live Video Views ⚡	t	\N
16	❌ Instagram Reports ❌	t	\N
17	✔️✔️Instagram Profile Visits | Poll Votes (Story) | Highlight Views	t	\N
18	✔️💥Instagram Direct Message And Mentions💥	t	\N
19	Instagram Story | Impression | Saves | Reach	t	\N
15	🌱 Natural Growth Service Instagram🍁	f	\N
24	▶ YT VIEWS |【 SHORT'S】	t	\N
25	Best Of【MAHASHIVRATRI	t	\N
3	💖 Instagram Likes { 𝙃𝙄𝙂𝙃 𝙌𝙐𝘼𝙇𝙄𝙏𝙔 }💖	t	8
31	TELEGRAM BULK POST VIEW |《 LAST 》👑👑	t	9
32	TELEGRAM BULK POST VIEW |《 FUTURE 》👑👑	t	10
30	👑TELEGRAM MEMBERS |《 NONDROP 》👑👑	t	\N
22	💲💝Cheapest Instagram Likes💝💲 [ Not Guaranteed ]	t	\N
21	👨Instagram Followers [ No Refill ] not garrented	t	5
2	INSTAGRAM REELS VIEWS 💙💙💥💥	t	6
23	👸👸 Instagram female followers👸👸	t	\N
1	Instagram Followers With Refill Guarantee 🙋🙋🔥	t	4
33	TOP SELLING SERVICES 🤩🤩☑️ { NON DROP }	t	1
28	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 YOUTUBE 】	t	3
27	🎯 𝗕𝗜𝗚 𝗕𝗔𝗭𝗔𝗥 ↪【 INSTAGRAM 】	t	2
\.


--
-- Data for Name: services_messagemodel; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.services_messagemodel (id, message, "timestamp", ticket_id, user_id) FROM stdin;
3	Make it fast plzz	2022-01-20 14:48:40.435822+05:30	3	14
4	Done	2022-01-21 11:50:24.649233+05:30	3	\N
5	Order please	2022-01-24 07:05:47.302295+05:30	4	35
6	Please	2022-01-24 15:55:17.707374+05:30	5	35
7	Done	2022-01-25 11:56:01.176959+05:30	4	\N
8	Done	2022-01-25 11:56:18.320858+05:30	5	\N
9	Jaldi krde	2022-01-27 14:21:46.784116+05:30	6	35
10	Done	2022-01-28 20:24:12.352079+05:30	6	\N
11	Kro jaldi	2022-01-29 15:02:19.382023+05:30	7	35
12	Done	2022-01-29 15:38:05.201931+05:30	7	\N
13	Jaldi se	2022-01-30 22:21:10.744498+05:30	8	35
14	Done	2022-01-30 23:05:37.244012+05:30	8	\N
15	Broh ordered no 292plz cancel it and plz return back money 	2022-03-05 00:26:38.620935+05:30	9	14
16	Solutions 	2022-04-08 12:23:57.80723+05:30	10	160
17	Patym	2022-06-13 12:12:20.005505+05:30	11	45
18	Maine scaner me paise add kiye the but acc m ni show ho rha na kuch no rha 	2022-07-18 23:12:46.306262+05:30	12	186
19	Hii	2022-08-06 16:41:10.170627+05:30	13	191
20	Please please please please 😭🙏😭	2022-08-10 00:15:24.856653+05:30	14	200
21		2022-08-11 17:07:40.702833+05:30	15	204
22		2022-08-12 11:50:40.522458+05:30	16	204
23	Ak according pa follow er nahi huya 	2022-08-14 15:21:17.318196+05:30	17	208
24	Mere follower nahi aaaaye	2022-08-17 14:18:50.415432+05:30	18	224
25		2022-08-17 14:19:01.389625+05:30	19	224
26	Partial dikha raha hai followers nahi aaye 500 order kiye the	2022-08-17 14:20:36.243457+05:30	20	224
27	Ak account pa followers nahi huya	2022-08-18 19:39:46.925332+05:30	21	208
28	Sir mene 35 rs bheje apko pr jb refar I'd dalni thi toh Page nhi khula  ab mere paise cut ho gye hai please 	2022-08-19 20:45:01.024608+05:30	22	229
29	Sir kal ka oder lgaya hua hai avi tk follow nhi aya ek be 	2022-08-20 08:12:26.881675+05:30	23	229
30	Solutions 	2022-08-22 09:42:47.334819+05:30	24	250
31	Help me	2022-08-26 16:47:39.053114+05:30	25	274
32	Solution 	2022-08-26 19:22:00.8249+05:30	26	250
33	Give solution plz....	2022-08-27 09:58:02.695396+05:30	27	271
34	Order id - 621	2022-08-27 14:31:27.449178+05:30	28	280
35	Offers	2022-08-27 16:48:17.304571+05:30	29	281
36	He'll 	2022-08-29 15:17:26.858856+05:30	30	288
37	Solution please	2022-08-30 18:44:17.548373+05:30	31	270
38	Mere ko order I'd nahi aya	2022-09-02 23:44:55.520248+05:30	32	307
39		2022-09-02 23:45:00.22+05:30	33	307
40	Please like completed	2022-09-04 13:17:49.638119+05:30	34	270
41	Order is not completed yet	2022-09-04 14:45:43.9634+05:30	35	305
42	Completed sir	2022-09-04 14:47:33.118295+05:30	35	\N
43	Thank you sir	2022-09-04 14:47:57.253234+05:30	35	305
\.


--
-- Data for Name: services_offers; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.services_offers (id, price, service_id, user_id, offer_type) FROM stdin;
1	50	38	3	Price
3	460	27	102	Price
4	460	27	1	Price
5	1500	20	102	Price
6	42	74	102	Price
7	40	73	102	Price
8	10	5	102	Price
9	4.99	63	102	Price
13	60	38	144	Price
14	31	73	102	Price
16	460	27	102	Price
15	5	73	1	Price
17	60	76	3	Price
18	60	44	153	Price
19	50	76	156	Price
22	35	38	185	Price
23	8	63	185	Price
24	4	60	185	Price
25	30	125	49	Price
\.


--
-- Data for Name: services_servicesmodel; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.services_servicesmodel (id, name, min_order, max_order, rate, average_time_hours, average_time_minutes, description, active, category_id, refill, api_id, service_id) FROM stdin;
6	Instagram Comments	10	10000	250	5	40	🔸 Mostly Start And Complete in 0-6 Hours\r\n🔸 Link: Post Link\r\n🔸 Good Quality Great Price\r\n🔸 No Drop So Far\r\n🔸 Can Be Canceled / Partialed Anytime Needed	t	4	f	\N	\N
7	Telegram member { Global }	100	10000	150	5	20	Delivery: Super high Speed - Almost instant\r\nReal Account so has Drops !!!!!!!\r\nSpeed: Up to 20K/ day\r\nRefill: NO\r\nSpecs: Only For Channels\r\nReal members but your channel not visible for them, Like fake but with high capacity and speed\r\n\r\n♻ Condition: it's not applied on Porn channels! We will not refill if you got more than 100k member on your channel/group already\r\n\r\nExample link: https://t.me/Your_Channel_	t	5	f	\N	\N
8	Telegram Indian 🇮🇳🇮🇳 member  100%	100	10000	200	4	30	For public and private channels\r\nStart - Instant\r\nSpeed - 5k-10k per day\r\nQuality - Premium quality live online Indian accounts with Profile picture\r\ncancel button enabled	t	5	f	\N	\N
9	Telegram Channel / Group  💥💥	100	10000	170	4	30	Delivery: Super high Speed - Almost instant\r\nReal Account so has Drops !!!!!!!\r\nSpeed: Up to 20K/ day\r\nRefill: NO\r\nSpecs: Only For Channels\r\nReal members but your channel not visible for them, Like fake but with high capacity and speed\r\n\r\n♻ Condition: it's not applied on Porn channels! We will not refill if you got more than 100k member on your channel/group already\r\n\r\nExample link: https://t.me/Your_Channel_	t	5	f	\N	\N
10	Facebook Profile Followers 🙋🙋 {Non Drop}	100	10000	250	3	30	Start: 0 - 6 Hours\r\nSpeed: 3K - 7K / day\r\nQuality: Real\r\nRefill: 30 Days\r\nDrop: Non Drop [0 - 5% maximum]\r\n\r\nLink: Insert Facebook profile link\r\nExample link: https://www.facebook.com/user\r\n\r\n✔️ This service works only on public profile\r\n✔️ Guarantee will be revoked if profile make private ever\r\n✔️ Own service, best quality and supper stable service in world\r\n✔️ Can be partial / cancel order with request for valid reason	t	6	f	\N	\N
11	🇮🇳👍 Facebook Indian Likes - [ Max - 10K | Speed: 1000/hour ][ Ultra Fast ][ R/30D ][ Real ]	50	10000	250	3	20	Start time - Super Instant\r\nSpeed - 5000 in 30 minutes\r\nExtra 10% Deliver Every time\r\nMaximum likes - 5k\r\nMinimum likes - 50\r\nQuality - Real\r\nNon Drop\r\nRefill - 30 Days\r\nIndian Like	t	7	f	\N	\N
12	India Love React - [ Max - 10K | Speed 1000/hour [ Ultra Fast ][ R/30D ][ Real ]	50	10000	250	2	30	Start time - Super Instant\r\nSpeed - 5000 in 30 minutes\r\nExtra 10% Deliver Every time\r\nMaximum likes - 5k\r\nMinimum likes - 50\r\nQuality - Real\r\nNon Drop\r\nRefill - 30 Days\r\nIndia Love React	t	7	f	\N	\N
13	Service 🇮🇳😡 Facebook Indian Angry React - [ Max - 10K | Speed 1000/hour [ Ultra Fast ][ R/30D ][ Real ] Start	50	10000	250	2	30	Start time - Super Instant\r\nSpeed - 5000 in 30 minutes\r\nExtra 10% Deliver Every time\r\nMaximum likes - 5k\r\nMinimum likes - 50\r\nQuality - Real\r\nNon Drop\r\nRefill - 30 Days\r\nIndia Angry React	t	7	f	\N	\N
14	🇮🇳😄 Facebook Indian Haha React - [ Max - 10K | Speed 1000/hour [ Ultra Fast ][ R/30D ][ Real ]	50	10000	250	2	30	Start time - Super Instant\r\nSpeed - 5000 in 30 minutes\r\nExtra 10% Deliver Every time\r\nMaximum likes - 5k\r\nMinimum likes - 50\r\nQuality - Real\r\nNon Drop\r\nRefill - 30 Days\r\nIndian HaHa React	t	7	f	\N	\N
15	Service 🇮🇳🥰 Facebook India Care React	50	10000	250	2	30	Start time - Super Instant\r\nSpeed - 5000 in 30 minutes\r\nExtra 10% Deliver Every time\r\nMaximum likes - 5k\r\nMinimum likes - 50\r\nQuality - Real\r\nNon Drop\r\nRefill - 30 Days\r\nIndian Care React	t	7	f	\N	\N
16	✔Facebook - Post Likes || 30 Days Refill ||	50	10000	100	2	30	Start: 0-60 min\r\nSpeed: 5k-20k/days\r\nRefill: 30 Days Refill	t	8	f	\N	\N
17	Youtube Views [Non Drop]	100	10000	180	3	30	Start: 0 - 12 Hours\r\nSpeed: 500 - 1K / Day\r\nQuality: Real\r\nRefill: 30 Days\r\n\r\nLink: YouTube video post link\r\nExample link: https://youtu.be/xyz\r\n\r\nNote 1: Video must be no restricted and open for all countries\r\nNote 2: If start count go down then no start / no refill / no refund\r\nNote 3: If post removed, no cancel / no refund	t	9	f	\N	\N
18	💎YouTube Subscribers [30 Days Refill Button] [40-60/D] [0-12/H] - Working	50	5000	2342	5	30	Channel must have at least 1+ video\r\n\r\nMake all public and not hide count\r\nNot go below the start\r\n\r\nLink: https://www.youtube.com/channel/UCrCO5doeAQRfNTglHj0\r\n\r\nSupport on the server is good\r\n\r\nThis server is usually no drop but a youtube update can change this reality\r\n\r\nHowever please do not forget these are just estimations	t	10	f	\N	\N
19	✨YouTube Subscribers ( 𝐈𝐌𝐏𝐑𝐎𝐕𝐄𝐃 ) INSTANT | 500-1000/D	50	5000	2800	5	30	Real Subs\r\nSpeed: 500-1000/day\r\nStart time: 0-1hrs\r\nNo stuck\r\nBig orders more speed\r\n30D refill---- 2-3% drop auto refill in every 24hrs	t	10	f	\N	\N
20	YouTube Subscribers - [ Max - 1.5K | Speed: 30/Day ] [ Refill: 30 Days ] [ Non Drop ] [ Slow - Start: 0-1 Hour ]	50	5000	2500	5	30	All are Real & USA subscribers\r\nAlmost Non-Drop\r\n---------------------------\r\nStart Time: 0-1hrs\r\nSpeed: 30-50 Per Day (SLOW)\r\n---------------------------\r\nGuarantee: 30 Day Guarantee\r\nDropping: 2-3% Highly	t	10	f	\N	\N
21	Service 🇺🇸 YouTube USA Subscribers - [NON DROP]	50	5000	2500	5	30	All are Real & USA subscribers\r\nAlmost Non-Drop\r\n---------------------------\r\nStart Time: 0-1hrs\r\nSpeed: 30-80 Per Day (SLOW)\r\n---------------------------\r\nGuarantee: 30 Day Guarantee\r\nDropping: 2-3% Highly	t	10	f	\N	\N
22	YouTube Subscribers ( Russian ) - [ Max - 50K | Speed: 20-50/Day ] [ Very Slow But 100% Non-Drop ] Start: 0-12hr 🇷🇺 -	50	5000	2200	5	30	All are Russian Subscriber and slow speed\r\n----------------------------\r\nStart: 0-3 Hours\r\nSpeed: 30-50/Day\r\n----------------------------\r\nGuarantee: 30 Days Refill Guarantee!\r\nDropping: 5% Highly (Non-Drop Almost)\r\n----------------------------\r\nStatus changes are delayed\r\nBut the work is performed immediately after placing the order\r\nNote: it's not just a guarantee of writing. we'll refill your order at a time.	t	10	f	\N	\N
23	YouTube Subscribers - [ Max - 10K | Speed: 3K/Day ] [ No Refill ] Start: 0-2hr 🔥	50	5000	450	5	30	⌛ Estimated Start Time: 0-2hrs!\r\n⚡Delivery speed: 3K/Day!\r\n♛ Min: 100, Max: 10K!\r\n-------------------------------------------------------\r\n♻ Refill: No Refill / No Refund (After drop no refill)\r\n✔️Cheapest In The Market\r\n-------------------------------------------------------\r\n⚠️Private Accounts Not accept	t	10	f	\N	\N
4	💙Instagram reel Views [1M/Day] ULTRA FAST ❤️ work on reel/tv/normal video also	200	50000	10	1	20	Non drop Instagram reel views \r\nLife time gurantee \r\nBest services \r\nUnlimited views \r\nFast delivery	t	2	f	1	14246
3	INSTAGRAM REAL FOLLOWERS NON REFIL	100	10000	80	5	20	NON REFIL FOLLOWERS ➡️\r\nFAST SERVICE \r\n100 MINIMUM ORDER \r\nMAXIMUM 10,000	f	1	f	\N	\N
24	Youtube Subscribers | Real | No Refill | MAX 10K -	50	5000	600	5	30	Quality: Low Quality 70% drop\r\nStart: 0-24 Hours\r\nRefill: No Refill / No Refund\r\nNever refill now this service\r\nSpeed: 500-1k Daily\r\nMinimum: 50\r\nMaximum: 20000\r\n\r\nNote: please don't order for the same link on the same time you have to wait the first order to be completed then you can order again.	t	10	f	\N	\N
25	Real Likes [Non drop] [Speed 10k/day] [Max-100k] R30 Instant Starte Video Likes [Non Drop]	50	5000	200	3	30	Start: 0 - 1 Hour\r\nSpeed: 200 - 1K / Hour\r\nQuality: Real\r\nRefill: 30 Days\r\n\r\nLink: YouTube video link\r\nExample: https://youtu.be/xyzabc\r\n\r\n✔️ This service works only on public channel and video	t	11	f	\N	\N
26	Dislikes | HQ Real Users | 10K | Fast	50	5000	400	3	30	🔸 Mostly Start: 0-1 Hour\r\n🔸 Link: Youtube Video Link\r\n🔸 May Drop Low or High\r\n🔸 No Cancel / Partial / Refill	t	11	f	\N	\N
28	Youtube Views [Watchtime 10 - 25 Mint] RMint] R30 ♻️ -	300	10000	300	5	30	✔️ Add Videos longer than 30 minutes for good retention. You will not get good retention if video duration is less than 30 minutes.\r\n✔️ Watchtime duration can be more or less with YouTube update\r\n\r\nStart: 0 - 24 Hours\r\nSpeed: 500 - 2K / Day\r\nQuality: 10 - 25 Min / views\r\nRefill: 30 Days\r\n\r\nLink: Insert YouTube video link\r\nExample link: https://www.youtube.com/watch?v=gznuqMpFJ7E&feature=youtu.be\r\n\r\nIf views count goes below start count then we can't start the order and can't cancel, partial, refund that order.\r\n\r\n- Video Should Be Open for All Countries\r\n- Premiere videos will not work\r\n- Live-streamed videos will not work\r\n- Copyright content will not work\r\n- Must be Unrestricted & Open for ALL Countries	t	12	f	\N	\N
29	Youtube Views [10-30 Min Watch Time] [10K-20K/Day] R30	300	300000	350	5	30	Start: 0 - 24 Hours\r\nSpeed: 5K - 20K / Day\r\nQuality: Real\r\nRefill: 30 Days\r\nWatchtime: 10 - 30 Min\r\n\r\nLink: Insert YouTube video link\r\nExample link: https://www.youtube.com/watch?v=gznuqMpFJ7E&feature=youtu.be\r\n\r\nNote: After Submit order, please do not ask for cancellation or speed up.	t	12	f	\N	\N
31	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]🔥🔥👑👑	50	10000	60	3	30	Real likes \r\nCheap rate 🔥🔥\r\nFast delivery \r\nReal \r\nCopy and paste the post link	t	3	f	\N	15950
34	💲Instagram + Video views + Igtv + Reel	20	10000	5	3	30	Real views	t	2	f	1	15363
5	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑	10	10000	38	2	30	Non drop Instagram likes \r\nUnlimited likes \r\nLife time gurantee \r\nFast service	t	3	f	\N	\N
40	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	100	10000	110	3	30		t	1	f	1	15950
39	🇮🇳✨1 Year Refill || Instagram Followers || Stable	100	10000	135	4	30	⌛ Start: 0-20 Minutes\r\n⚡ Delivery: 15k per day\r\n---------------------------\r\n☢ Guarantee: 30 Days Refill Button✔\r\n---------------------------\r\n💎 Quality: Real Indian mixed account will follow you	t	1	t	\N	14099
35	Instagram Natural Growth Service	1000	1000	180	93	30	Instagram Natural Growth Service\r\nPlace Instagram Profile Link in Link Section\r\nThis service is Manual, So you it will take time to start.\r\nIt will Help you to get reach on your future posts.\r\n\r\nHow it Works -\r\nWe place Your Link into our Database Algorithm, Which Triggers specific Hashtags Which help your Profile to get Natural Likes, Views, and reach from all over Instagram.\r\n\r\nNote - This is a Test Service so you might not get 100% results, But its worth to try ;)	t	15	f	\N	\N
36	Natural Growth Service	1000	1000	240	93	30	Instagram Natural Growth Service\r\nPlace Instagram Profile Link in Link Section\r\nThis service is Manual, So you it will take time to start.\r\nIt will Help you to get reach on your future posts.\r\n\r\nHow it Works -\r\nWe place Your Link into our Database Algorithm, Which Triggers specific Hashtags Which help your Profile to get Natural Likes, Views, and reach from all over Instagram.\r\n\r\nNote - This is a Test Service so you might not get 100% results, But its worth to try ;)	t	15	f	\N	\N
37	Natural Growth Service	1000	1000	240	93	30	Instagram Natural Growth Service\r\nPlace Instagram Profile Link in Link Section\r\nThis service is Manual, So you it will take time to start.\r\nIt will Help you to get reach on your future posts.\r\n\r\nHow it Works -\r\nWe place Your Link into our Database Algorithm, Which Triggers specific Hashtags Which help your Profile to get Natural Likes, Views, and reach from all over Instagram.\r\n\r\nNote - This is a Test Service so you might not get 100% results, But its worth to try ;)	t	15	f	\N	\N
1	INSTAGRAM REAL FOLLOWERS WITH REFIL	100	10000	130	5	30	REAL INSTAGRAM FOLLOWERS \r\nNON DROP \r\nFAST SERVICES\r\n\r\nREFIL AVAILABLE FOR 20 DAYS	f	1	f	\N	\N
27	YouTube 4.000 watch time  | 1+ Hour Video | No Drop | R30 | 4K | 500-1000 Views Per Day	300	4000	622	5	30	🔸 Mostly Start 0-1 Hour | 500 Watch Hour or More Per Day\r\n🔸 Manual Refill\r\n🔸 Video Must Be Open for All Countries | Embed Enabled Accepted\r\n🔸 Cancel, Partial or Refill Possible with Valid Reasons\r\n\r\n1hour + video	t	12	f	\N	\N
30	INSTAGRAM FOLLOWERS 🔥🔥INDIAN 🇮🇳🇮🇳	200	10000	100	4	30	Real indian user \r\n0-5% drop \r\nWith refil availble \r\nReal users 🔥🔥\r\nFast service	t	1	f	1	16321
32	Instagram Story Views - ( All Story ) [ Max - 40K | Speed: 40K/Day ]	20	10000	10	3	30	Real story views	t	13	f	1	15729
112	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 100 POST |  NON DROP |	100	5000000	177	2	10		t	31	t	1	15485
113	TELEGRAM BULK POST VIEW |《 LAST 》🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 20 POST | | NON DROP |	100	500000	57	1	10		t	31	t	1	14605
114	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 50 POST | | NON DROP |	100	380800000	105	1	20		t	31	t	1	14606
109	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 5 POST |  NON DROP |	100	100000	21	1	20		t	31	t	1	14603
117	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 10 Future Posts	100	2000000	18	\N	\N		t	32	t	1	14595
75	➤ IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧	100	200000	30	3	29		t	25	t	1	15361
65	👸 Instagram female followers👸👸 | Max 100K { 60 day Reffil} Instant start 🔥	100	20000	415	3	30	Best and Stable female followers\r\n-------------------------------------------------------\r\n⌛ Start Time: 0-10 Minutes\r\n⚡Speed: 20K/Day\r\n-------------------------------------------------------\r\n♻ Refill: 60 Days\r\n-------------------------------------------------------\r\n~~~ Quality ~~~\r\n1.) Real Looking\r\n2.) Have many posts and profile\r\n------------------------------------------------------\r\n🌎Target Country: Worldwide\r\n-------------------------------------------------------\r\nNote:~ Always Working\r\n►Link Example: https://www.instagram.com/name	t	23	f	\N	\N
42	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	100	10000	115	3	40		t	1	f	1	15950
70	💫 Telegram » Channel/Group Member | 🔥 Real & Active | 💧 100% Non Drop | ⏩ 60k+ Per Day | ▶️ Start: Instant	500	15000	85	2	30		t	5	f	1	16416
41	Instagram Followers - 2 year REFILL ♻️[ HQ ] [ 💎Drop - 5% Only ] [ Never drop ] Start: 0-3hr] Stable Lifetime	100	10000	300	4	30	🍓BEST 🍓STABLE 🍓FAST \r\n\r\n🔥Never drop after refill\r\n🔥Drop 0-5% only\r\n🔥Amazing services\r\n🔥0-3hr start time [ INSTANT ]\r\n🔥lifetime followers\r\n🔥Mostly Indian profiles + ww [HQ]\r\n🔥 365 Days Trusted Guarantee\r\n\r\n🌟Big Resellers also get good offers on this service.\r\n\r\n🍓 RECOMMENDED SERVICE	t	1	f	1	15950
66	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	10	10000	12	3	30		t	3	f	1	15179
62	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	10	15000	15	\N	\N		t	22	f	1	15179
61	Instagram Likes | Exclusive | Cheapest | SuperFast | R30 | MAX 10K ⚡️	10	10000	13	4	30		t	22	f	1	15179
52	◾ 💎 Instagram Likes | Indian Real Users | High Quality 100% Indian | 10K | Fast ⚡Best In Market[recommended]	10	10000	55	3	20		t	3	f	\N	\N
48	◼ Instagram Followers [Mix] [Nice Quality] [1-2K/D] [0-1/H]	100	10000	40	3	30		t	21	f	1	15562
68	💫 Telegram » Group Member | 🔥 Real & Very Fast | 💧 100% Non Drop | ⏩ 100k+ Per Day | ▶️ Start: Instant	1000	40000	60	3	30		t	5	f	1	16421
47	◼ Instagram Followers [Real Look] [Nice Quality] [5-10K/D] [Instant]	100	1000	33	2	30		t	21	f	1	15562
56	💎⚡🔥 𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Power Likes [Non Drop] R30	10	15000	22	1	30		t	3	f	\N	\N
54	💎Instagram Likes [🇮🇳 Real India 🇮🇳] Natural Speed | 500-5k Per Hour | 0-30M Start	10	10000	35	3	30		t	3	f	\N	\N
53	🎊 🇮🇳 Instagram HQ Likes [Real Indian with Stories]🔥👌NON DROP👌🔥 [ Story✔ [Active ✔ [Speed :20k/D [ Start 0-15min ]	10	10000	42	2	30		t	3	f	\N	\N
71	♦️  𝗬𝗢𝗨𝗧𝗨𝗕𝗘 Short ~ Video Views [ Lifetime Guratanteed ]	100	10000000	84	3	20	⚡ YOUTUBE SHORT VIDEO SPECIAL SERVICE ⚡ - Start time : 0 - 1h - Guarantee: Lifetime - Speed 20k+/D	t	24	f	1	14350
69	💫 Telegram » Channel/Group Member | 🔥 Real | 💧 100% Non Drop | ⏩ 20k+ Per Day | ▶️ Start: Instant	500	15000	83	4	30		t	5	f	1	16420
55	💎Premium💎 Instagram Likes ( Reach + Impressions ) [High Quality] [30 Days Refill Button]	10	100	65	3	20		t	3	f	\N	\N
50	◾ ❤️𝙈𝙤𝙨𝙩 𝙎𝙩𝙖𝙗𝙡𝙚 Instagram Likes | Mix Users | High Quality | No Drop | 15K | 3K-5K Per Day	100	1000	28	3	30		t	3	f	\N	\N
46	🇮🇳Instagram Followers [Real] [Indian Majority] [Perfect Quality] [5-10K/D] [0-10/M] [Recommended]	100	1000	35	3	30	Drop: low medium no refill in any case\r\nGuarantee: no\r\nQuality can change on this server one day very good other lower\r\nHowever please do not forget these are just estimations	t	21	f	1	15561
58	💲Instagram + Video views + Igtv + Reel [working] - (SUPER FAST⚡)	100	30000	8	3	30		t	2	f	1	15363
45	Instagram Followers | Indian Mix | Good Quality | Low Drop | R100♻️ | 1M | 20-40K Per Day(Recommended)	100	10000	160	2	30		t	1	f	1	15950
60	Instagram Reel Views [Non Drop]  🌠🌠☄️☄️	10	10000	3	3	30		t	2	f	1	14246
57	Instagram Reel Views [Non Drop] 💧 ✪[working]	100	50000	12	2	20		t	2	f	1	16074
43	Instagram Followers | HQ MIX | Speed: 10K/Day | 365Refill | ♻️ [100% NON-DROP ]⚡[90 Days Button✔]	100	10000	130	3	30		t	1	f	1	15950
72	YT Short ~ Likes ❤️ [ Lifetime Guratanteed ]	100	150000	120	3	30	⚡ YOUTUBE SHORT VIDEO SPECIAL SERVICE ⚡ - LIKES - Start time : 0 - 1h - Guarantee: Lifetime - Speed 20k+/D	t	24	f	\N	\N
44	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	100	10000	150	3	30		t	1	f	\N	15950
73	➤ IG Followers【 Upto +100K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧	100	100000	60	3	30		t	1	f	1	16448
67	🇮🇳 ❤️ Instagram POST+REEL+IGTV Likes ~ Indian 𝗥𝗘𝗔𝗟 Users | High Quality || 10K-50k/Day || SuperFast🔥[Recommended]	10	200000	40	3	30		t	3	f	1	15577
49	Instagram Followers | Fastest | MAX 10K ⚡️	100	10000	38	3	25		t	21	f	1	15562
74	16321\t➤ IG 🇮🇳Indian Followers【 Upto +100K/Day\t🇮🇳【 Pure 100% 🇮🇳Indian【 0-15/min【 Lifetime Guarantee【 365Manual Refill💧	100	10000000	62	3	30		t	1	f	1	16321
59	Instagram Reel Views [Non Drop]  💜💜🥰💥	10	10000	8	3	30		t	2	f	1	15363
63	💸Instagram Likes [Mix] [Nice Quality] [No Drop] [30 Days Refill Button] [50K/D] [Instant]	10	10000	10	3	30		t	22	t	1	15996
91	🏆 YT Views【 High Quality【 Upto +10K/Day【 Non Drop【 30Days Refill🩸]	100	50000	108	3	40		t	28	t	1	15987
103	💫 Telegram » Channel/Group Member | 🔥 Real & Active | 💧 100% Non Drop | ⏩ 60k+ Per Day | ▶️ Start: Instant	100	50000000	199	2	30		t	30	t	1	16416
92	🏆 YT Views【 High Quality【 Upto +20K/Day【 Non Drop【 Lifetime Refill🩸	100	500000	130	3	30		t	28	t	1	15988
51	👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]	100	5000	30	3	50		t	3	f	1	15577
94	🏆 YT Views【 High Quality【 Upto +100K/Day【 Non Drop【 Lifetime Guaranteed【 Clients Favorite🩸	1000	5000000	199	4	30		t	28	t	1	15991
93	🏆 YT Views【 High Quality【 Upto +25K/Day【 Non Drop【 Lifetime Guaranteed🩸	500	1000000	140	3	50		t	28	t	1	15989
81	🇮🇳 ❤️ Instagram POST+REEL+IGTV Likes ~ Indian 𝗥𝗘𝗔𝗟 Users | High Quality || 10K-50k/Day || SuperFast🔥[Recommended]	10	100000000	45	3	30		t	27	t	1	\N
95	🏆 YT Views【 High Quality【 Upto +200K/Day【 Non Drop【 Lifetime Guaranteed【 Clients Favorite🩸	40000	50000000	180	3	30		t	28	t	1	15992
96	🏆 YT Likes【 High Quality【 Upto +30K/Day【 NonDrop【 Average Speed【 Lifetime Guarantee 🩸	100	1000000	130	3	50		t	28	t	1	15993
79	➤ IG Real Likes【 Upto +30K/Day【 Non Drop【 High Quality【 Cheapest【 R30 🩸	10	1000000	12	2	30		t	27	t	1	15996
88	🏆 IG ➠ Likes【 100% NonDrop【 High Quality【 SuperFast【 R30 🩸	10	1000000	15	3	20		t	27	t	1	15997
87	Instagram Comments  CUSTOM📝📝🏆 IG ➠ CUSTOM Comments【 100% NonDrop【 High Quality【 Average Speed【 Lifetime Guaranteed 💧	100	100000	250	24	30		t	27	t	1	16193
86	Instagram Comments 📝📝🏆 IG ➠ Random Comments【 100% NonDrop【 High Quality【 Average Speed【 Lifetime Guaranteed 💧	100	100000	140	24	30		t	27	t	1	15998
83	🏆 IG ➠ Followers【 High Quality【 Average Speed【 60Days Refill with Button 💧	20	100000	58	3	50		f	27	t	1	\N
89	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]	100	5000000	3	4	30		t	27	t	1	16688
97	🏆 YT Likes【 High Quality【 Upto +50K/Day【 NonDrop【 Average Speed【 Lifetime Guarantee 🩸	100	10000000	160	5	20		t	28	t	1	15994
98	🏆 YT Likes【 High Quality【 Upto +100K/Day【 NonDrop【 Average Speed【 Lifetime Guarantee 🩸	100	1000000	180	4	20		t	28	t	1	15994
85	🏆 IG ➠ Followers【 High Quality【 Average Speed【 60Days Refill with Button 💧]	10	10000000	58	3	30		t	27	t	1	15948
99	💫 Telegram » Channel/Group Member | 🔥 Cheapest | 💧 No Drop | ⏩ 15-20k+ Per Day | ▶️ Strat: Instant	500	1000	110	3	20		t	30	t	1	16419
100	💫 Telegram » Channel/Group Member | 🔥 Cheapest | 💧 No Drop | ⏩ 100k+ Per Day | ▶️ Strat: Instant	500	35000000	120	2	20		t	30	t	1	16413
101	💫 Telegram » Channel/Group Member | 🔥 Real | 💧 100% Non Drop | ⏩ 40k+ Per Day | ▶️ Start: Instant	1000	10000	108	1	30		t	30	t	1	16415
102	💫 Telegram » Channel/Group Member | 🔥 Real | 💧 100% Non Drop | ⏩ 50-100k+ Per Day | ▶️ Start: Instant	5000	300000	150	2	20		t	30	t	1	16414
104	💫 Telegram » Channel/Group Member |🔥 Real Russia |💧 100% No Drop | ⏩ 50-100k Per Day | ▶️ Start: Instant	10	4500000	210	1	20		t	30	t	1	16417
105	💫 Telegram » Channel Member | 🔥 Real | 💧 100% Non Drop | ♻️ 30 Day Refill | ⏩ 100k+ Per Day | ▶️ Start: Instant	10	3500000	250	1	30		t	30	t	1	16418
106	💫 Telegram » Member [🔥 Real Mix -💧 No Drop ] - [⏩ 20-30k+ Per Day - ▶️ Strat: Instant ]	100	5000000	150	1	30		t	30	t	1	15578
108	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 5 POST |  NON DROP |	100	1000000	9	1	20		t	31	t	1	15483
107	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 1 POST |  NON DROP |	1000	100000000	3	1	20		t	31	t	1	14602
110	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 10 POST |  NON DROP |	100	5000000	22	1	30		t	31	t	1	15484
111	TELEGRAM BULK POST VIEW |《 LAST 》| 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 10 POST |  NON DROP |	100	3000000	177	1	10		t	31	t	1	14604
115	TELEGRAM BULK POST VIEW |《 LAST 🌀 TELEGRAM INDIAN 🇮🇳 POST VIEW | LAST 100 POST | | NON DROP |	100	500000	150	1	10		t	31	t	1	14607
116	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 5 Future Posts	100	100000	9	1	20		t	32	t	1	14594
80	👑👑Instagram Likes - NON DROP - Lifetime Guarantee || 50k Per Day [recommended]👑👑	10	100000000	18	3	30		t	27	t	1	15997
78	IG 🇮🇳Indian Followers【 Upto +50K/Day 🇮🇳【 Pure 100% 🇮🇳Indian【 0-15/min【 Lifetime Guarantee【 R356 Days with Button💧	50	10000000	85	3	30		t	27	t	1	16321
82	👑🎥 Instagram Reel [Views] ~ [ TRENDING HITS ] [NON DROP] [ FAST ]🥵🔥👀	10	1000000	8	2	20		t	27	t	1	15363
77	🏆 IG ➠ Followers【 High Quality【 Average Speed【 30Days Refill with Button 💧	50	5000000	70	3	30		t	27	t	1	15947
118	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 20 Future Posts	100	30000000	36	\N	\N		t	32	t	1	14595
119	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 30 Future Posts	100	200000000	48	\N	\N		t	32	t	1	14598
120	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 50 Future Posts	100	50000000	78	\N	\N		t	32	t	1	14599
121	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 100 Future Posts	100	50000000	108	\N	\N		t	32	t	1	14599
122	TELEGRAM BULK POST VIEW |《 FUTURE 》⭐💯 TELEGRAM Auto Post View On 500 Future Posts	100	8000000	939	3	30		t	32	t	1	14600
38	360\t🌍1 Year Refill [Good Quality] CHEAPER THAN CHEAP [REAL] - Stable after refill [Recommended]	100	20000	75	4	30		f	1	f	\N	\N
76	👑👑IG Followers【 Upto +50K/Day【 Mix HQuality【 0-10/min【 Lifetime Guarantee【 365Refill with Button 💧💙👑	50	20000	55	3	30		t	27	t	1	15950
84	➤ IG » 🇮🇳Indian Followers【 30K-100K/Day 🇮🇳【 Pure 100% 🇮🇳Indian【 Instant【 Lifetime Guarantee【 365Refill with Button 💧]	10	100000	150	4	50		t	27	t	1	14099
123	INSTAGRAM REELS VIEWS 💥💥✨	100	1000000	3	1	30		t	25	t	1	14246
124	INSTAGRAM LIKES 👍👍	50	10000000	8	3	30		t	25	t	1	15996
125	IG Real Followers【 Non Drop【 365 Day Refill【 20-100k+ Per Day【 0-30 Min ] 🤩🤩💙💙	20	50000000	40	2	30	⌛ Start Time: Instant\r\n⚡ Speed: 100K-2000K Per Day\r\n💎 Quality: High Quality\r\n✅ Refill: 365Days\r\n🔻 Minimum Order: 10\r\n🔼 Maximum Order: 1000000	t	27	t	1	15361
126	🌍365 Days Refill -- Instagram Followers - {NON DROP} [ Max: 100K | Speed: 40000/D ] [ Superfast ][Recommended]	50	10000000	49	3	20	⌛ Start Time: Instant\r\n⚡ Speed: 50K-150K Per Day\r\n💎 Quality: High Quality\r\n✅ Refill: 365Days\r\n🔻 Minimum Order: 10\r\n🔼 Maximum Order: 1000000	t	27	t	1	15927
129	Instagram Followers || Very HQ || [ ⚡SuperFast⚡ ] [100-250K/D ][90 Days Refill] [Very Low Drop] -10M Start	50	8000000	35	4	20	𝗣𝗿𝗶𝗰𝗲 𝗗𝗿𝗼𝗽𝗽𝗲𝗱 ❌\r\n\r\n✦ 𝗦𝗧𝗔𝗥𝗧: Instant\r\n✦ 𝗦𝗣𝗘𝗘𝗗: 40K-60K/day\r\n✦ 𝗟𝗜𝗡𝗞: Profile Link/Username\r\n✦ 𝗤𝗨𝗔𝗟𝗜𝗧𝗬: High Quality\r\n✦ 𝗗𝗥𝗢𝗣: Not Expected\r\n✦ 𝗥𝗘𝗙𝗜𝗟𝗟: 365Days Refill\r\n\r\n▶ New Server\r\n▶ Quality is very good\r\n▶ Drop 0-5% In Some Conditions use the button for a refill\r\n▶ In this server we can't cancel after order so be careful	t	33	t	1	15370
130	IG Organic 🇮🇳IND Followers【 Real & Active Profiles【 5K-50K/Day【 0-1Hrs	100	500000000	149	4	20	➨ Start Time: 0-1 hrs\r\n➨ Speed: 5K-50k per Day\r\n➨ Quality: 100% Indian Profiles 🇮🇳 [ Active Accounts🇮🇳 ]\r\n➨ Drop Ratio: 0%\r\n➨ Refill: It Has 90 Days Refill Button + 275 Days Manual Refill\r\n➨ Cheap Price Service In All Market, Recommended for Quality\r\n\r\nNote: There is no drop in this service not even 1%. If you put the order on any big profiles later don't ask for a refill because the service has no drop. We do not fulfill your old drop.	t	33	t	1	14154
131	IG 🇮🇳Indian Followers【 +40K/Day 🇮🇳【 90% 🇮🇳Indian【 Lifetime Guarantee【 R356 Days 💧	50	680000000	75	3	20	▶ 𝗦𝗧𝗔𝗥𝗧 : 0-15/Min\r\n▶ 𝗦𝗣𝗘𝗘𝗗 : +50K/day\r\n▶ 𝗟𝗜𝗡𝗞 : Account Link/Username\r\n▶ 𝗤𝗨𝗔𝗟𝗜𝗧𝗬 : 99% Indian HQuality\r\n▶ 𝗗𝗥𝗢𝗣 : Non Drop - {Current: 0-5%}\r\n▶ 𝗥𝗘𝗙𝗜𝗟𝗟 : R356 Days with Button\r\n▶ 𝗥𝗘𝗩𝗜𝗘𝗪: http://prnt.sc/26ipxwf\r\n\r\n𝑪𝒍𝒂𝒔𝒉 𝑶𝒇 𝑴𝒂𝒓𝒌𝒆𝒕,𝑩𝒆𝒔𝒕 𝒐𝒇 𝑳𝒖𝒄𝒌 𝑪𝒐𝒎𝒑𝒆𝒕𝒊𝒕𝒐𝒓𝒔	t	33	t	1	16321
132	💎 IG » 𝗥𝗘𝗘𝗟 VIEWS || ALWAYS WORKING || SUPERFAST || Lifetime Guratantee ⚠️	100	50000000	5	2	10	𝗔𝗟𝗪𝗔𝗬𝗦 🔺 𝗪𝗢𝗥𝗞𝗜𝗡𝗚\r\n\r\n𝗦𝗧𝗔𝗥𝗧 : INSTANT\r\n𝗦𝗣𝗘𝗘𝗗 :10K-100K/HRS\r\n𝗤𝗨𝗔𝗟𝗜𝗧𝗬 : AMAZING\r\n𝗥𝗘𝗙𝗜𝗟𝗟 : AUTO REFILL + 300DAYS\r\n𝗠𝗜𝗡 : 100\r\n𝗠𝗔𝗫 : 10000000	t	33	t	1	16688
128	🤵Instagram Real Followers (Max-500k) (non drop ) [200 k day ] Super Instant 🔥🔥 Recommended 🔥❤️	50	5000000	38	3	20	🔥 100% HIGH-QUALITY!\r\n⌛ Start Time: Instant Super Fast \r\n ⚡ Delivery speed: 200k /Day!\r\n-----------------------------------------------------------\r\n♻ Guarantee: 365 Days Auto Refill Guarantee!\r\n☺ Less Dropping only 5%, But stable after refill.\r\n♛ Min: 50, Max: 500K!\r\n\r\nExample Link: https://www.instagram.com/instagram/-	t	33	t	1	15361
133	🏆 💥💥IG ➠ Likes【 100% NonDrop【 High Quality【 Average Speed【 R30 🩸🔥🔥	50	5000000	15	3	50	Non Drop Likes	t	33	t	1	16410
127	Instagram Followers // indian mix🇮🇳 Quality 😍 // Refill 365 Days ♻️ // 100k Day 🚀	50	10000000	45	3	30	⌛ Start Time: Instant\r\n⚡ Speed: 50K-150K Per Day\r\n💎 Quality: High Quality\r\n✅ Refill: 365Days\r\n🔻 Minimum Order: 10\r\n🔼 Maximum Order: 1000000	t	33	t	1	15927
\.


--
-- Data for Name: services_ticketsmodel; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.services_ticketsmodel (id, subject, status, created, last_updated, user_id) FROM stdin;
3	https://instagram.com/perfect_clicks.01?utm_medium=copy_link	Answered	2022-01-20 14:48:40.433698+05:30	2022-01-21 11:50:24.647517+05:30	14
4	Meri order processing kro	Answered	2022-01-24 07:05:47.30026+05:30	2022-01-25 11:56:01.17457+05:30	35
5	Paise jaldi krde	Answered	2022-01-24 15:55:17.705122+05:30	2022-01-25 11:56:18.319933+05:30	35
6	Paise jaldi krde	Answered	2022-01-27 14:21:46.782031+05:30	2022-01-28 20:24:12.350302+05:30	35
7	Meri order processing kro	Answered	2022-01-29 15:02:19.379978+05:30	2022-01-29 15:38:05.20093+05:30	35
8	Meri order processing kro	Answered	2022-01-30 22:21:10.742261+05:30	2022-01-30 23:05:45.371384+05:30	35
9	https://instagram.com/ravindra_darling_1223?utm_medium=copy_link	Pending	2022-03-05 00:26:38.617041+05:30	2022-03-05 00:26:38.617057+05:30	14
10	G.pay s fund add krna h	Pending	2022-04-08 12:23:57.803964+05:30	2022-04-08 12:23:57.803981+05:30	160
11	202206131207550019	Pending	2022-06-13 12:12:19.99041+05:30	2022-06-13 12:12:19.990425+05:30	45
12	Ruppes 	Pending	2022-07-18 23:12:46.300605+05:30	2022-07-18 23:12:46.300622+05:30	186
13		Pending	2022-08-06 16:41:10.166399+05:30	2022-08-06 16:41:10.166415+05:30	191
14	Hamara fund add nhi hua 	Pending	2022-08-10 00:15:24.854528+05:30	2022-08-10 00:15:24.854546+05:30	200
15	p	Pending	2022-08-11 17:07:40.700571+05:30	2022-08-11 17:07:40.700588+05:30	204
16	paise nahi aai 	Pending	2022-08-12 11:50:40.513158+05:30	2022-08-12 11:50:40.513178+05:30	204
17	Follow er nahi huya	Pending	2022-08-14 15:21:17.314839+05:30	2022-08-14 15:21:17.314855+05:30	208
18	Increase my followers 	Pending	2022-08-17 14:18:50.413277+05:30	2022-08-17 14:18:50.413293+05:30	224
19		Pending	2022-08-17 14:19:01.387607+05:30	2022-08-17 14:19:01.387625+05:30	224
20		Pending	2022-08-17 14:20:36.241482+05:30	2022-08-17 14:20:36.241499+05:30	224
21	Follow er nahi huya	Pending	2022-08-18 19:39:46.92307+05:30	2022-08-18 19:39:46.923088+05:30	208
22	Jye dokha hua mere sath 	Pending	2022-08-19 20:45:01.021247+05:30	2022-08-19 20:45:01.021265+05:30	229
23	Hy	Pending	2022-08-20 08:12:26.879801+05:30	2022-08-20 08:12:26.879815+05:30	229
24	Mera payment nhi aaya	Pending	2022-08-22 09:42:47.332987+05:30	2022-08-22 09:42:47.333004+05:30	250
25	Plz help me paisa abhi tak nhi auya h 	Pending	2022-08-26 16:47:39.048244+05:30	2022-08-26 16:47:39.048264+05:30	274
26	Pending me chala gaya followwesr nhi badha 	Pending	2022-08-26 19:22:00.822778+05:30	2022-08-26 19:22:00.8228+05:30	250
27	Abhi followers ka kia hai abhi tak start nhi	Pending	2022-08-27 09:58:02.693357+05:30	2022-08-27 09:58:02.693374+05:30	271
28	My order is pending	Pending	2022-08-27 14:31:27.447212+05:30	2022-08-27 14:31:27.447247+05:30	280
29	Instagram flowers offer 	Pending	2022-08-27 16:48:17.302527+05:30	2022-08-27 16:48:17.302547+05:30	281
30	Hello 	Pending	2022-08-29 15:17:26.856867+05:30	2022-08-29 15:17:26.856882+05:30	288
31	Mera like complete Nahi hua ha	Pending	2022-08-30 18:44:17.546321+05:30	2022-08-30 18:44:17.546339+05:30	270
32	Order I'd not receive	Pending	2022-09-02 23:44:55.517074+05:30	2022-09-02 23:44:55.51709+05:30	307
33		Pending	2022-09-02 23:45:00.217727+05:30	2022-09-02 23:45:00.217747+05:30	307
34	Mera like complete ku Nahi hua ha	Pending	2022-09-04 13:17:49.636023+05:30	2022-09-04 13:17:49.63604+05:30	270
35	Order id 698	Answered	2022-09-04 14:45:43.961099+05:30	2022-09-04 14:47:33.117342+05:30	305
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: authapp_money_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.authapp_money_id_seq', 323, true);


--
-- Name: authapp_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.authapp_user_groups_id_seq', 1, false);


--
-- Name: authapp_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.authapp_user_id_seq', 324, true);


--
-- Name: authapp_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.authapp_user_user_permissions_id_seq', 1, false);


--
-- Name: dashboard_api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.dashboard_api_id_seq', 1, true);


--
-- Name: dashboard_counterorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.dashboard_counterorder_id_seq', 1, true);


--
-- Name: dashboard_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.dashboard_settings_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1272, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 73, true);


--
-- Name: orders_ordersmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.orders_ordersmodel_id_seq', 717, true);


--
-- Name: orders_ordertransanctionmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.orders_ordertransanctionmodel_id_seq', 748, true);


--
-- Name: orders_transanctionsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.orders_transanctionsmodel_id_seq', 339, true);


--
-- Name: services_categorymodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.services_categorymodel_id_seq', 33, true);


--
-- Name: services_messagemodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.services_messagemodel_id_seq', 43, true);


--
-- Name: services_offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.services_offers_id_seq', 25, true);


--
-- Name: services_servicesmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.services_servicesmodel_id_seq', 133, true);


--
-- Name: services_ticketsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.services_ticketsmodel_id_seq', 35, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authapp_accountbalance authapp_money_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_accountbalance
    ADD CONSTRAINT authapp_money_pkey PRIMARY KEY (id);


--
-- Name: authapp_accountbalance authapp_money_user_id_key; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_accountbalance
    ADD CONSTRAINT authapp_money_user_id_key UNIQUE (user_id);


--
-- Name: authapp_user_groups authapp_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_groups
    ADD CONSTRAINT authapp_user_groups_pkey PRIMARY KEY (id);


--
-- Name: authapp_user_groups authapp_user_groups_user_id_group_id_532435ff_uniq; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_groups
    ADD CONSTRAINT authapp_user_groups_user_id_group_id_532435ff_uniq UNIQUE (user_id, group_id);


--
-- Name: authapp_user authapp_user_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user
    ADD CONSTRAINT authapp_user_pkey PRIMARY KEY (id);


--
-- Name: authapp_user_user_permissions authapp_user_user_permis_user_id_permission_id_d73ed934_uniq; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_user_permissions
    ADD CONSTRAINT authapp_user_user_permis_user_id_permission_id_d73ed934_uniq UNIQUE (user_id, permission_id);


--
-- Name: authapp_user_user_permissions authapp_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_user_permissions
    ADD CONSTRAINT authapp_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: authapp_user authapp_user_username_key; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user
    ADD CONSTRAINT authapp_user_username_key UNIQUE (username);


--
-- Name: dashboard_api dashboard_api_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.dashboard_api
    ADD CONSTRAINT dashboard_api_pkey PRIMARY KEY (id);


--
-- Name: dashboard_counterorder dashboard_counterorder_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.dashboard_counterorder
    ADD CONSTRAINT dashboard_counterorder_pkey PRIMARY KEY (id);


--
-- Name: dashboard_settings dashboard_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.dashboard_settings
    ADD CONSTRAINT dashboard_settings_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orders_ordersmodel orders_ordersmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_ordersmodel
    ADD CONSTRAINT orders_ordersmodel_pkey PRIMARY KEY (id);


--
-- Name: orders_ordertransanctionmodel orders_ordertransanctionmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_ordertransanctionmodel
    ADD CONSTRAINT orders_ordertransanctionmodel_pkey PRIMARY KEY (id);


--
-- Name: orders_transanctionsmodel orders_transanctionsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_transanctionsmodel
    ADD CONSTRAINT orders_transanctionsmodel_pkey PRIMARY KEY (id);


--
-- Name: services_categorymodel services_categorymodel_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_categorymodel
    ADD CONSTRAINT services_categorymodel_pkey PRIMARY KEY (id);


--
-- Name: services_categorymodel services_categorymodel_ranking_key; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_categorymodel
    ADD CONSTRAINT services_categorymodel_ranking_key UNIQUE (ranking);


--
-- Name: services_messagemodel services_messagemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_messagemodel
    ADD CONSTRAINT services_messagemodel_pkey PRIMARY KEY (id);


--
-- Name: services_offers services_offers_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_offers
    ADD CONSTRAINT services_offers_pkey PRIMARY KEY (id);


--
-- Name: services_servicesmodel services_servicesmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_servicesmodel
    ADD CONSTRAINT services_servicesmodel_pkey PRIMARY KEY (id);


--
-- Name: services_ticketsmodel services_ticketsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_ticketsmodel
    ADD CONSTRAINT services_ticketsmodel_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authapp_user_groups_group_id_361087d7; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX authapp_user_groups_group_id_361087d7 ON public.authapp_user_groups USING btree (group_id);


--
-- Name: authapp_user_groups_user_id_aad8a001; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX authapp_user_groups_user_id_aad8a001 ON public.authapp_user_groups USING btree (user_id);


--
-- Name: authapp_user_user_permissions_permission_id_ea3ff82e; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX authapp_user_user_permissions_permission_id_ea3ff82e ON public.authapp_user_user_permissions USING btree (permission_id);


--
-- Name: authapp_user_user_permissions_user_id_fb111ce4; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX authapp_user_user_permissions_user_id_fb111ce4 ON public.authapp_user_user_permissions USING btree (user_id);


--
-- Name: authapp_user_username_94c664b2_like; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX authapp_user_username_94c664b2_like ON public.authapp_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: orders_ordersmodel_service_id_21b4e9e0; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX orders_ordersmodel_service_id_21b4e9e0 ON public.orders_ordersmodel USING btree (service_id);


--
-- Name: orders_ordersmodel_user_id_98f94c50; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX orders_ordersmodel_user_id_98f94c50 ON public.orders_ordersmodel USING btree (user_id);


--
-- Name: orders_ordertransanctionmodel_order_id_e4ba15e5; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX orders_ordertransanctionmodel_order_id_e4ba15e5 ON public.orders_ordertransanctionmodel USING btree (order_id);


--
-- Name: orders_ordertransanctionmodel_user_id_3ea79b67; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX orders_ordertransanctionmodel_user_id_3ea79b67 ON public.orders_ordertransanctionmodel USING btree (user_id);


--
-- Name: orders_transanctionsmodel_user_id_a451c064; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX orders_transanctionsmodel_user_id_a451c064 ON public.orders_transanctionsmodel USING btree (user_id);


--
-- Name: services_messagemodel_ticket_id_225d3c1a; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX services_messagemodel_ticket_id_225d3c1a ON public.services_messagemodel USING btree (ticket_id);


--
-- Name: services_messagemodel_user_id_df72653b; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX services_messagemodel_user_id_df72653b ON public.services_messagemodel USING btree (user_id);


--
-- Name: services_offers_service_id_87b5fff3; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX services_offers_service_id_87b5fff3 ON public.services_offers USING btree (service_id);


--
-- Name: services_offers_user_id_a1c586c0; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX services_offers_user_id_a1c586c0 ON public.services_offers USING btree (user_id);


--
-- Name: services_servicesmodel_api_id_4c33eaa0; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX services_servicesmodel_api_id_4c33eaa0 ON public.services_servicesmodel USING btree (api_id);


--
-- Name: services_servicesmodel_category_id_49bf9005; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX services_servicesmodel_category_id_49bf9005 ON public.services_servicesmodel USING btree (category_id);


--
-- Name: services_ticketsmodel_user_id_821b71d2; Type: INDEX; Schema: public; Owner: appuser
--

CREATE INDEX services_ticketsmodel_user_id_821b71d2 ON public.services_ticketsmodel USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authapp_accountbalance authapp_money_user_id_1a3de1f6_fk_authapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_accountbalance
    ADD CONSTRAINT authapp_money_user_id_1a3de1f6_fk_authapp_user_id FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authapp_user_groups authapp_user_groups_group_id_361087d7_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_groups
    ADD CONSTRAINT authapp_user_groups_group_id_361087d7_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authapp_user_groups authapp_user_groups_user_id_aad8a001_fk_authapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_groups
    ADD CONSTRAINT authapp_user_groups_user_id_aad8a001_fk_authapp_user_id FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authapp_user_user_permissions authapp_user_user_pe_permission_id_ea3ff82e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_user_permissions
    ADD CONSTRAINT authapp_user_user_pe_permission_id_ea3ff82e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authapp_user_user_permissions authapp_user_user_pe_user_id_fb111ce4_fk_authapp_u; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.authapp_user_user_permissions
    ADD CONSTRAINT authapp_user_user_pe_user_id_fb111ce4_fk_authapp_u FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_authapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authapp_user_id FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_ordersmodel orders_ordersmodel_service_id_21b4e9e0_fk_services_; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_ordersmodel
    ADD CONSTRAINT orders_ordersmodel_service_id_21b4e9e0_fk_services_ FOREIGN KEY (service_id) REFERENCES public.services_servicesmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_ordersmodel orders_ordersmodel_user_id_98f94c50_fk_authapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_ordersmodel
    ADD CONSTRAINT orders_ordersmodel_user_id_98f94c50_fk_authapp_user_id FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_ordertransanctionmodel orders_ordertransanc_order_id_e4ba15e5_fk_orders_or; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_ordertransanctionmodel
    ADD CONSTRAINT orders_ordertransanc_order_id_e4ba15e5_fk_orders_or FOREIGN KEY (order_id) REFERENCES public.orders_ordersmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_ordertransanctionmodel orders_ordertransanc_user_id_3ea79b67_fk_authapp_u; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_ordertransanctionmodel
    ADD CONSTRAINT orders_ordertransanc_user_id_3ea79b67_fk_authapp_u FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_transanctionsmodel orders_transanctionsmodel_user_id_a451c064_fk_authapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.orders_transanctionsmodel
    ADD CONSTRAINT orders_transanctionsmodel_user_id_a451c064_fk_authapp_user_id FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: services_messagemodel services_messagemode_ticket_id_225d3c1a_fk_services_; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_messagemodel
    ADD CONSTRAINT services_messagemode_ticket_id_225d3c1a_fk_services_ FOREIGN KEY (ticket_id) REFERENCES public.services_ticketsmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: services_messagemodel services_messagemodel_user_id_df72653b_fk_authapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_messagemodel
    ADD CONSTRAINT services_messagemodel_user_id_df72653b_fk_authapp_user_id FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: services_offers services_offers_service_id_87b5fff3_fk_services_; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_offers
    ADD CONSTRAINT services_offers_service_id_87b5fff3_fk_services_ FOREIGN KEY (service_id) REFERENCES public.services_servicesmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: services_offers services_offers_user_id_a1c586c0_fk_authapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_offers
    ADD CONSTRAINT services_offers_user_id_a1c586c0_fk_authapp_user_id FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: services_servicesmodel services_servicesmod_category_id_49bf9005_fk_services_; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_servicesmodel
    ADD CONSTRAINT services_servicesmod_category_id_49bf9005_fk_services_ FOREIGN KEY (category_id) REFERENCES public.services_categorymodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: services_servicesmodel services_servicesmodel_api_id_4c33eaa0_fk_dashboard_api_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_servicesmodel
    ADD CONSTRAINT services_servicesmodel_api_id_4c33eaa0_fk_dashboard_api_id FOREIGN KEY (api_id) REFERENCES public.dashboard_api(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: services_ticketsmodel services_ticketsmodel_user_id_821b71d2_fk_authapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.services_ticketsmodel
    ADD CONSTRAINT services_ticketsmodel_user_id_821b71d2_fk_authapp_user_id FOREIGN KEY (user_id) REFERENCES public.authapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

