SET DATABASE SQL REGULAR NAMES FALSE;
CREATE TYPE TEXT AS VARCHAR(1000000)
CREATE TYPE BYTEA AS VARBINARY(1000000);
--
-- PostgreSQL database dump
--





--
-- Name: container_containee; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE container_containee (
    container_uid character(65) NOT NULL,
    containee_uid character(65) NOT NULL,
    enclosure_number integer
);


--
-- Name: esign_wflow; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE esign_wflow (
    uid character(32) NOT NULL,
    node_uid character(65) NOT NULL,
    message text,
    status smallint DEFAULT 0 NOT NULL,
    esign_type smallint DEFAULT 0 NOT NULL,
    initiator_uid character(32) NOT NULL,
    abortion_reason text,
    esign bytea,
    start_ts timestamp without time zone,
    end_ts timestamp without time zone,
    bank_type smallint DEFAULT 1 NOT NULL,
    use_guard_time smallint DEFAULT 0 NOT NULL
);


--
-- Name: evt_based_notification; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE evt_based_notification (
    uid character(32) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    acl_uid character(32),
    active_from timestamp without time zone,
    active_to timestamp without time zone,
    suspend smallint DEFAULT 0 NOT NULL,
    nodetype_uid character(32) NOT NULL,
    use_node_filter_script smallint DEFAULT 0 NOT NULL,
    node_filter_script text,
    notify_on_create_event smallint DEFAULT 0 NOT NULL,
    notify_on_change_event smallint DEFAULT 0 NOT NULL,
    notify_on_delete_event smallint DEFAULT 0 NOT NULL,
    urgent smallint DEFAULT 0 NOT NULL,
    send_as_bcc smallint DEFAULT 0 NOT NULL,
    email_template_uid character(32),
    recipients_email text,
    include_assignee smallint DEFAULT 0 NOT NULL,
    include_home smallint DEFAULT 0 NOT NULL,
    include_owner smallint DEFAULT 0 NOT NULL,
    include_members_of_group smallint DEFAULT 0 NOT NULL,
    group_uid character(32),
    include_principals_from_property smallint DEFAULT 0 NOT NULL,
    property_uid character(32),
    sender_email character varying(255),
    cc_email text,
    include_principals_from_propertycc smallint DEFAULT 0 NOT NULL,
    propertycc_uid character(32)
);


--
-- Name: ftextindex; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE ftextindex (
    uid character(32) NOT NULL,
    insertion_timestamp timestamp without time zone NOT NULL,
    nodetype_id character(32) NOT NULL,
    node_id character(65) NOT NULL,
    index_code smallint DEFAULT 1 NOT NULL,
    target character(1) DEFAULT 'A',
    completion_status character(1) DEFAULT 'P',
    exception character varying(255),
    index_timestamp timestamp without time zone,
    completion_timestamp timestamp without time zone
);


--
-- Name: hold; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE hold (
    uid character(32) NOT NULL,
    name character varying(50) NOT NULL,
    acl_uid character(32),
    description character varying(255),
    active_from timestamp without time zone,
    active_to timestamp without time zone,
    contact_uid character(32),
    only_prevent_disposition_changes smallint
);


--
-- Name: hold_node; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE hold_node (
    hold_uid character(32) NOT NULL,
    node_uid character(65) NOT NULL
);


--
-- Name: lookupitem; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE lookupitem (
    uid character(32) NOT NULL,
    lookupset_uid character(32) NOT NULL,
    code character varying(10) NOT NULL,
    val character varying(50) NOT NULL,
    description text
);


--
-- Name: lookupset; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE lookupset (
    uid character(32) NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


--
-- Name: node_event; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE node_event (
    event_timestamp timestamp without time zone NOT NULL,
    event_type character varying(100) NOT NULL,
    node_uid character(65) NOT NULL,
    node_record_number character varying(50),
    node_title character varying(255) NOT NULL,
    principal_uid character(32) NOT NULL,
    principal_name character varying(255) NOT NULL,
    details text,
    ipaddress character varying(45)
);


--
-- Name: node_refs; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE node_refs (
    property_uid character(32) NOT NULL,
    from_node_uid character(65) NOT NULL,
    to_node_uid character(65) NOT NULL
);


--
-- Name: nodetype; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype (
    uid character(32) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    store_uid character(32),
    acl_uid character(32),
    apply_node_acl_filter smallint DEFAULT 0 NOT NULL,
    apply_nodetype_default_acl_filter smallint DEFAULT 0 NOT NULL,
    apply_owner_filter smallint DEFAULT 0 NOT NULL,
    apply_classification_default_acl_filter smallint DEFAULT 0 NOT NULL,
    apply_container_based_filter smallint DEFAULT 0 NOT NULL,
    is_container smallint DEFAULT 0 NOT NULL,
    level smallint DEFAULT 1 NOT NULL,
    record_numbering_method smallint,
    enclosure_number_prefix character varying(3),
    enclosure_number_suffix character varying(3),
    current_record_year integer,
    reset_record_number_at_year_end smallint DEFAULT 0 NOT NULL,
    next_record_number integer,
    record_number_pattern character varying(50),
    init_record_number integer DEFAULT 1,
    number_pattern_increment integer DEFAULT 1 NOT NULL,
    enclosure_number_max_digits integer DEFAULT 3 NOT NULL,
    default_acl_uid character(32),
    default_security_level_uid character(32),
    default_retention_schedule_uid character(32),
    is_metadata_text_indexed smallint DEFAULT 0 NOT NULL,
    is_content_text_indexed smallint DEFAULT 0 NOT NULL,
    titling_method smallint DEFAULT 11 NOT NULL,
    can_attach_content smallint DEFAULT 0 NOT NULL,
    content_mandatory smallint DEFAULT 0 NOT NULL,
    is_shreddable smallint DEFAULT 0 NOT NULL,
    autoexec_script text,
    titlealias character varying(255) DEFAULT 'Title',
    icon bytea,
    description_alias character varying(255),
    notes_alias character varying(255),
    record_number_alias character varying(255),
    barcode_alias character varying(255),
    container_alias character varying(255),
    external_barcode_alias character varying(255),
    enclosure_number_alias character varying(255),
    classification_alias character varying(255),
    secondary_classification_alias character varying(255),
    tertiary_classification_alias character varying(255),
    date_registered_alias character varying(255),
    creator_name_alias character varying(255),
    creator_username_alias character varying(255),
    master_alias character varying(255),
    date_of_last_enclosure_alias character varying(255),
    date_enclosed_alias character varying(255),
    date_finalized_alias character varying(255),
    assignee_alias character varying(255),
    home_alias character varying(255),
    owner_alias character varying(255),
    disposition_status_alias character varying(255),
    external_uid_alias character varying(255),
    integrity_check_alias character varying(255),
    finalized_alias character varying(255),
    is_hybrid_alias character varying(255),
    retention_schedule_alias character varying(255),
    security_level_alias character varying(255),
    date_last_modified_alias character varying(255),
    date_last_modified_of_contents_alias character varying(255),
    client_alias character varying(255),
    combined_title_alias character varying(255),
    mime_type_alias character varying(255),
    date_closed_alias character varying(255),
    num_digits_enclosure_number smallint DEFAULT 3 NOT NULL,
    apply_autoexec_scripting smallint DEFAULT 0 NOT NULL,
    uncompressed_record_number_alias character varying(255),
    opened_temporarily_alias character varying(255),
    date_created_alias character varying(255),
    author_alias character varying(255),
    batch_id_alias character varying(255),
    date_archived_alias character varying(255),
    date_made_inactive_alias character varying(255),
    apply_content_template smallint DEFAULT 0 NOT NULL,
    content_template_node_uid character(65),
    copy_content_template_on_create smallint DEFAULT 0 NOT NULL,
    copy_content_template_on_update smallint DEFAULT 0 NOT NULL,
    content_template_on_update_behaviour smallint DEFAULT 1 NOT NULL,
    launch_activity_on_node_create smallint DEFAULT 0 NOT NULL,
    activity_name character varying(50),
    apply_content_conversion smallint DEFAULT 0 NOT NULL,
    conversion_format character varying(10),
    default_auto_finalize smallint DEFAULT 0 NOT NULL,
    record_class_alias character varying(255),
    default_record_class integer DEFAULT 0 NOT NULL,
    is_voluming_enabled smallint DEFAULT 0 NOT NULL,
    is_auto_close_volume smallint DEFAULT 0 NOT NULL,
    is_close_volume_after_exceed_max_content smallint DEFAULT 0 NOT NULL,
    is_close_volume_on_particular_date smallint DEFAULT 0 NOT NULL,
    is_close_volume_on_triggered_event smallint DEFAULT 0 NOT NULL,
    is_auto_open_volume_after_exceed_max_content smallint DEFAULT 0 NOT NULL,
    is_auto_open_volume_on_particular_date smallint DEFAULT 0 NOT NULL,
    is_auto_open_volume_on_triggered_event smallint DEFAULT 0 NOT NULL,
    volume_max_content integer DEFAULT 1,
    volume_closing_date timestamp without time zone,
    volume_triggered_event integer DEFAULT 0,
    volume_triggered_event_type integer DEFAULT 0,
    volume_triggered_event_duration integer DEFAULT 1,
    volume_separator character varying(5),
    num_of_digits_for_volume_number integer DEFAULT 3 NOT NULL,
    volume_triggered_event_property_uid character(32),
    record_event_setting integer DEFAULT 63 NOT NULL,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 1,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    hybrid_remarks_alias character varying(255),
    is_declassify_alias text,
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_imported smallint DEFAULT 0 NOT NULL,
    can_show_tab smallint DEFAULT 1 NOT NULL,
    can_show_alt_container smallint DEFAULT 1 NOT NULL,
    can_show_rel_record smallint DEFAULT 1 NOT NULL,
    can_show_retention smallint DEFAULT 1 NOT NULL
);


--
-- Name: nodetype_attribute; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_attribute (
    nodetype_uid character(32) NOT NULL,
    attribute_no smallint NOT NULL,
    group_name character varying(50),
    _order integer
);


--
-- Name: nodetype_b7bc8b7449614d159ce0869306f04d36; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_b7bc8b7449614d159ce0869306f04d36 (
    uid character(65) NOT NULL,
    acl_uid character(32),
    owner_uid character(32),
    classification_uid character(32),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    record_number character varying(100),
    retention_schedule_uid character(32),
    hold_uid character(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    notes text,
    home_uid character(32),
    assignee_uid character(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(100),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    batch_id character varying(40),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    is_misfiled smallint DEFAULT 0,
    master_uid character(65),
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    is_declassify smallint DEFAULT 0,
    is_imported smallint DEFAULT 0,
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 0,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    afd1329c2de2421bbbe5a48f65b56818 character varying(255),
    b5fb184441d941d6936f00708785f3f3 character varying(10)
);


--
-- Name: nodetype_c22816ad803c47ed83400bc787d06ed4; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_c22816ad803c47ed83400bc787d06ed4 (
    uid character(65) NOT NULL,
    acl_uid character(32),
    owner_uid character(32),
    classification_uid character(32),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    record_number character varying(100),
    retention_schedule_uid character(32),
    hold_uid character(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    notes text,
    home_uid character(32),
    assignee_uid character(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(100),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    batch_id character varying(40),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    is_misfiled smallint DEFAULT 0,
    master_uid character(65),
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    is_declassify smallint DEFAULT 0,
    is_imported smallint DEFAULT 0,
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 0,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    ha41c373c2f0413cb1458bb886048bb2 character varying(255),
    f0970f3862f941338e162f34b75e6831 character varying(20),
    f362b3fe8c934881b0a3ee7e829df929 text,
    f3e001ad12ef439b9b7c3d67a6239f10 text,
    d2800efb0ed84f738f8dff1b9be7860e character varying(15),
    f8fef67bb03c47faa48061fcd1c2f038 character varying(15),
    a219cee40a3f4ae9be8f695763b78d33 character varying(255),
    d6376ccdb85c43af8260fb05786d731a character varying(255),
    bf65f9219f944e47b00873d7bec3343c character varying(15),
    gf1f763b063149df8529223e8b37a24b character varying(15),
    ec690c2952ef478ebcc6f25afbc367f2 character varying(255),
    d5858a70d49d4cf2b0d009ffac1c2f01 character(32),
    j1a034132d74409fa321444e8b7ff4b2 character(32)
);


--
-- Name: nodetype_c408fbc0ea084ec19b7ee3f4d94e7711; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_c408fbc0ea084ec19b7ee3f4d94e7711 (
    uid character(65) NOT NULL,
    acl_uid character(32),
    owner_uid character(32),
    classification_uid character(32),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    record_number character varying(100),
    retention_schedule_uid character(32),
    hold_uid character(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    notes text,
    home_uid character(32),
    assignee_uid character(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(100),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    batch_id character varying(40),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    is_misfiled smallint DEFAULT 0,
    master_uid character(65),
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    is_declassify smallint DEFAULT 0,
    is_imported smallint DEFAULT 0,
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 0,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    c1fb9f1f82af496cbbfd8f387aefab42 character varying(20),
    fdc659695c944890b9c1720de461db2e character(65),
    cead45cc70f2415ca1054f2853a8a100 character varying(20)
);


--
-- Name: nodetype_dc8e3bc6f41f4f15aa445184108a680a; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_dc8e3bc6f41f4f15aa445184108a680a (
    uid character(65) NOT NULL,
    acl_uid character(32),
    owner_uid character(32),
    classification_uid character(32),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    record_number character varying(100),
    retention_schedule_uid character(32),
    hold_uid character(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    notes text,
    home_uid character(32),
    assignee_uid character(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(100),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    batch_id character varying(40),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    is_misfiled smallint DEFAULT 0,
    master_uid character(65),
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    is_declassify smallint DEFAULT 0,
    is_imported smallint DEFAULT 0,
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 0,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    j72d25f47afb42ea84fd364233a29430 character varying(50),
    a4d54a1736fa45e796aa89ff04b83f55 character varying(255),
    ibdaf89d09234fef9826c0f2a81ef088 character varying(255),
    f5da945a323c4488b407142013d47646 character varying(15),
    ac587b9bdb0545d9a4bb872848b12755 character varying(100),
    c7b15198b7a844d2bbe56fa6116f9018 character varying(15),
    c6bc629517e44c6f982e25f8daf5bbd6 timestamp without time zone,
    b1b99355d0834804a01b7a69fc2421bd numeric(16,2),
    f9ce8fde98e547699ff79602b2dce34f timestamp without time zone,
    hea71551e76346ad8f8e87f13911c1b3 character varying(100),
    a36e65cb8ea243f894f405bb4a9e3e0d character varying(20),
    afd1329c2de2421bbbe5a48f65b56818 character varying(255),
    fdc5a29e8ead4b2f841ee80af03f5aa7 character(65),
    c1fb9f1f82af496cbbfd8f387aefab42 character varying(20),
    f792c310e30b4a43b21658046926cc6b character(65)
);


--
-- Name: nodetype_eb50047853d6486b8c7f78ad91d4f454; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_eb50047853d6486b8c7f78ad91d4f454 (
    uid character(65) NOT NULL,
    acl_uid character(32),
    owner_uid character(32),
    classification_uid character(32),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    record_number character varying(100),
    retention_schedule_uid character(32),
    hold_uid character(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    notes text,
    home_uid character(32),
    assignee_uid character(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(100),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    batch_id character varying(40),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    is_misfiled smallint DEFAULT 0,
    master_uid character(65),
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    is_declassify smallint DEFAULT 0,
    is_imported smallint DEFAULT 0,
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 0,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    fdc659695c944890b9c1720de461db2e character(65),
    j8e43ac4e85940c6a15e4c35f0a5a7e5 character varying(20)
);


--
-- Name: nodetype_f0000000000000000000000000000000; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_f0000000000000000000000000000000 (
    uid character varying(65) NOT NULL,
    acl_uid character varying(32),
    owner_uid character varying(32),
    classification_uid character varying(32),
    record_number character varying(50),
    retention_schedule_uid character varying(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    notes text,
    home_uid character varying(32),
    assignee_uid character varying(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character varying(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character varying(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(50),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    batch_id character varying(255),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    hold_uid character(32),
    is_misfiled smallint DEFAULT 0,
    is_declassify smallint DEFAULT 0,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 1,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_imported smallint DEFAULT 0,
    a0000000000000000000000000000000 character varying(65),
    master_uid character(65),
    a0000000000000000000000000000013 character varying(65)
);


--
-- Name: nodetype_f0000000000000000000000000000001; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_f0000000000000000000000000000001 (
    uid character varying(65) NOT NULL,
    acl_uid character varying(32),
    owner_uid character varying(32),
    classification_uid character varying(32),
    record_number character varying(50),
    retention_schedule_uid character varying(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    notes text,
    home_uid character varying(32),
    assignee_uid character varying(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character varying(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character varying(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(50),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    batch_id character varying(255),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    hold_uid character(32),
    is_misfiled smallint DEFAULT 0,
    is_declassify smallint DEFAULT 0,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 1,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_imported smallint DEFAULT 0,
    a0000000000000000000000000000001 bytea,
    master_uid character(65)
);


--
-- Name: nodetype_f0000000000000000000000000000002; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_f0000000000000000000000000000002 (
    uid character varying(65) NOT NULL,
    acl_uid character varying(32),
    owner_uid character varying(32),
    classification_uid character varying(32),
    record_number character varying(50),
    retention_schedule_uid character varying(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    notes text,
    home_uid character varying(32),
    assignee_uid character varying(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character varying(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character varying(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(50),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    batch_id character varying(255),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    hold_uid character(32),
    is_misfiled smallint DEFAULT 0,
    is_declassify smallint DEFAULT 0,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 1,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_imported smallint DEFAULT 0,
    a0000000000000000000000000000002 character varying(255),
    a0000000000000000000000000000003 character varying(255),
    a0000000000000000000000000000004 text,
    a0000000000000000000000000000005 text,
    a0000000000000000000000000000006 text,
    a0000000000000000000000000000007 character varying(255),
    a0000000000000000000000000000009 timestamp without time zone,
    a0000000000000000000000000000010 timestamp without time zone,
    master_uid character(65)
);


--
-- Name: nodetype_f0000000000000000000000000000003; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_f0000000000000000000000000000003 (
    uid character varying(65) NOT NULL,
    acl_uid character varying(32),
    owner_uid character varying(32),
    classification_uid character varying(32),
    record_number character varying(50),
    retention_schedule_uid character varying(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    notes text,
    home_uid character varying(32),
    assignee_uid character varying(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character varying(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character varying(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(50),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    batch_id character varying(255),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    hold_uid character(32),
    is_misfiled smallint DEFAULT 0,
    is_declassify smallint DEFAULT 0,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 1,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_imported smallint DEFAULT 0,
    a0000000000000000000000000000008 character varying(100),
    master_uid character(65)
);


--
-- Name: nodetype_f0000000000000000000000000000004; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_f0000000000000000000000000000004 (
    uid character varying(65) NOT NULL,
    acl_uid character varying(32),
    owner_uid character varying(32),
    classification_uid character varying(32),
    record_number character varying(50),
    retention_schedule_uid character varying(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    notes text,
    home_uid character varying(32),
    assignee_uid character varying(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character varying(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character varying(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(50),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    batch_id character varying(255),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    hold_uid character(32),
    is_misfiled smallint DEFAULT 0,
    is_declassify smallint DEFAULT 0,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 1,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_imported smallint DEFAULT 0,
    master_uid character(65)
);


--
-- Name: nodetype_f0000000000000000000000000000005; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_f0000000000000000000000000000005 (
    uid character varying(65) NOT NULL,
    acl_uid character varying(32),
    owner_uid character varying(32),
    classification_uid character varying(32),
    record_number character varying(50),
    retention_schedule_uid character varying(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    notes text,
    home_uid character varying(32),
    assignee_uid character varying(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character varying(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character varying(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(50),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    batch_id character varying(255),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    hold_uid character(32),
    is_misfiled smallint DEFAULT 0,
    is_declassify smallint DEFAULT 0,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 1,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_imported smallint DEFAULT 0,
    a0000000000000000000000000000002 character varying(255),
    a0000000000000000000000000000003 character varying(255),
    a0000000000000000000000000000004 text,
    a0000000000000000000000000000005 text,
    a0000000000000000000000000000006 text,
    a0000000000000000000000000000007 character varying(255),
    a0000000000000000000000000000011 text,
    a0000000000000000000000000000012 character varying(32),
    master_uid character(65)
);


--
-- Name: nodetype_f0000000000000000000000000000006; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_f0000000000000000000000000000006 (
    uid character varying(65) NOT NULL,
    acl_uid character varying(32),
    owner_uid character varying(32),
    classification_uid character varying(32),
    record_number character varying(50),
    retention_schedule_uid character varying(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    notes text,
    home_uid character varying(32),
    assignee_uid character varying(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character varying(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character varying(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(50),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    batch_id character varying(255),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    hold_uid character(32),
    is_misfiled smallint DEFAULT 0,
    is_declassify smallint DEFAULT 0,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 1,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_imported smallint DEFAULT 0,
    master_uid character(65)
);


--
-- Name: nodetype_f0000000000000000000000000000007; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_f0000000000000000000000000000007 (
    uid character varying(65) NOT NULL,
    acl_uid character varying(32),
    owner_uid character varying(32),
    classification_uid character varying(32),
    record_number character varying(50),
    retention_schedule_uid character varying(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    notes text,
    home_uid character varying(32),
    assignee_uid character varying(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character varying(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character varying(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(50),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    batch_id character varying(255),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    hold_uid character(32),
    is_misfiled smallint DEFAULT 0,
    is_declassify smallint DEFAULT 0,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 1,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_imported smallint DEFAULT 0,
    a0000000000000000000000000000000 character varying(65),
    a0000000000000000000000000000014 character varying(255),
    a0000000000000000000000000000013 character varying(65),
    master_uid character(65)
);


--
-- Name: nodetype_f2bfeb5852264c5aa67f53f96ac28d39; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_f2bfeb5852264c5aa67f53f96ac28d39 (
    uid character(65) NOT NULL,
    acl_uid character(32),
    owner_uid character(32),
    classification_uid character(32),
    secondary_classification_uid character(32),
    tertiary_classification_uid character(32),
    record_number character varying(100),
    retention_schedule_uid character(32),
    hold_uid character(32),
    disposition_status integer,
    title character varying(255),
    combined_title text,
    description text,
    date_registered timestamp without time zone,
    creator_name character varying(255),
    creator_username character varying(255),
    notes text,
    home_uid character(32),
    assignee_uid character(32),
    is_finalized smallint,
    is_hybrid smallint DEFAULT 0,
    date_finalized timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    external_uid character varying(50),
    integrity_check text,
    security_level_uid character(32),
    date_last_modified timestamp without time zone,
    date_last_modified_of_contents timestamp without time zone,
    client_uid character(32),
    date_closed timestamp without time zone,
    next_enclosure_number integer DEFAULT 1 NOT NULL,
    enclosure_number_increment integer DEFAULT 1 NOT NULL,
    uncompressed_record_number character varying(100),
    security_based_on_container smallint DEFAULT 0,
    bypass_referenced_acls smallint DEFAULT 0,
    opened_temporarily smallint DEFAULT 0,
    date_created timestamp without time zone,
    author character varying(255),
    batch_id character varying(40),
    date_archived timestamp without time zone,
    date_made_inactive timestamp without time zone,
    date_of_last_enclosure timestamp without time zone,
    date_enclosed timestamp without time zone,
    record_class integer DEFAULT 0 NOT NULL,
    container_record_number character varying(50),
    classification_full_number character varying(255),
    secondary_classification_full_number character varying(255),
    tertiary_classification_full_number character varying(255),
    assignee_name character varying(255),
    home_name character varying(255),
    owner_name character varying(255),
    retention_schedule_number character varying(100),
    security_level_number smallint,
    client_name character varying(255),
    is_container_removed_on_ret_trig smallint DEFAULT 0,
    is_set_home_on_container_ret_trig smallint DEFAULT 0,
    retention_schedule_new_home character(32),
    is_misfiled smallint DEFAULT 0,
    master_uid character(65),
    hybrid_remarks text,
    date_last_modified_of_security_level timestamp without time zone,
    is_declassify smallint DEFAULT 0,
    is_imported smallint DEFAULT 0,
    enforce_single_creation_in_a_workflow smallint DEFAULT 0 NOT NULL,
    check_in_as_new_version smallint DEFAULT 0 NOT NULL,
    check_in_as_override_previous_content smallint DEFAULT 0 NOT NULL,
    is_declassify_alias text,
    is_auto_update_security_level smallint DEFAULT 0 NOT NULL,
    is_auto_update_security_level_on_particular_date smallint DEFAULT 0 NOT NULL,
    security_level_trigger_date timestamp without time zone,
    is_update_security_level_on_triggered_event smallint DEFAULT 0 NOT NULL,
    security_level_triggered_event integer DEFAULT 0,
    security_level_triggered_event_type integer DEFAULT 0,
    security_level_triggered_event_duration integer DEFAULT 0,
    security_level_triggered_event_property character(32),
    auto_update_security_level_id character(32),
    ae6c83a22dd849ebba2cfddb45a32a47 character varying(100),
    h763e35b6288452895b143ec4bad9d02 character varying(255),
    ac587b9bdb0545d9a4bb872848b12755 character varying(100),
    c7b15198b7a844d2bbe56fa6116f9018 character varying(15),
    ibdaf89d09234fef9826c0f2a81ef088 character varying(255),
    e12bc6ec5ab144aab50b592c046de9f5 text,
    f5da945a323c4488b407142013d47646 character varying(15),
    he2bb392ca384d81a11181cdea5a9006 character(32)
);


--
-- Name: nodetype_property; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE nodetype_property (
    nodetype_uid character(32) NOT NULL,
    property_uid character(32) NOT NULL,
    alias character varying(255) DEFAULT '',
    is_mandatory smallint DEFAULT 0 NOT NULL,
    is_readonly smallint DEFAULT 0 NOT NULL,
    property_group_name character varying(50),
    property_order integer,
    default_value text
);


--
-- Name: object_event; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE object_event (
    event_timestamp timestamp without time zone NOT NULL,
    event_type character varying(100) NOT NULL,
    object_uid character(32) NOT NULL,
    object_type integer NOT NULL,
    object_name character varying(255) NOT NULL,
    principal_uid character(32) NOT NULL,
    principal_name character varying(255) NOT NULL,
    details text NOT NULL,
    ipaddress character varying(45)
);


--
-- Name: principal; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE principal (
    uid character(32) NOT NULL,
    name character varying(255) NOT NULL,
    extid character varying(50),
    username character varying(50),
    password character varying(255),
    isgroup smallint DEFAULT 0 NOT NULL,
    acl_uid character(32),
    security_level_uid character(32),
    isinternal smallint DEFAULT 0 NOT NULL,
    issuspended smallint DEFAULT 0 NOT NULL,
    gender smallint DEFAULT 3 NOT NULL,
    email character varying(255),
    profile_uid character(32),
    canlogin smallint DEFAULT 0 NOT NULL,
    active_from timestamp without time zone,
    active_to timestamp without time zone,
    date_registered timestamp without time zone,
    barcode character varying(50),
    external_barcode character varying(50),
    ptype smallint DEFAULT 0 NOT NULL,
    date_last_modified_of_password timestamp without time zone,
    loginmessage text,
    address text,
    ic_passport_no character varying(32),
    date_of_birth timestamp without time zone,
    nationality character varying(50),
    business_occupation character varying(255),
    phone_number character varying(20),
    mobile_phone character varying(20)
);


--
-- Name: principal_group; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE principal_group (
    principal_uid character(32) NOT NULL,
    group_uid character(32) NOT NULL
);


--
-- Name: profile; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE profile (
    uid character(32) NOT NULL,
    name character varying(50) NOT NULL,
    p1000 smallint DEFAULT 0 NOT NULL,
    p1 smallint DEFAULT 0 NOT NULL,
    p11 smallint DEFAULT 0 NOT NULL,
    p21 smallint DEFAULT 0 NOT NULL,
    p41 smallint DEFAULT 0 NOT NULL,
    p42 smallint DEFAULT 0 NOT NULL,
    p51 smallint DEFAULT 0 NOT NULL,
    p52 smallint DEFAULT 0 NOT NULL,
    p53 smallint DEFAULT 0 NOT NULL,
    p54 smallint DEFAULT 0 NOT NULL,
    p61 smallint DEFAULT 0 NOT NULL,
    p71 smallint DEFAULT 0 NOT NULL,
    p81 smallint DEFAULT 0 NOT NULL,
    p91 smallint DEFAULT 0 NOT NULL,
    p92 smallint DEFAULT 0 NOT NULL,
    p93 smallint DEFAULT 0 NOT NULL,
    p94 smallint DEFAULT 0 NOT NULL,
    p95 smallint DEFAULT 0 NOT NULL,
    p100 smallint DEFAULT 0 NOT NULL,
    p101 smallint DEFAULT 0 NOT NULL,
    p102 smallint DEFAULT 0 NOT NULL,
    p103 smallint DEFAULT 0 NOT NULL,
    p111 smallint DEFAULT 0 NOT NULL,
    p112 smallint DEFAULT 0 NOT NULL,
    p121 smallint DEFAULT 0 NOT NULL,
    p122 smallint DEFAULT 0 NOT NULL,
    p123 smallint DEFAULT 0 NOT NULL,
    p2001 smallint DEFAULT 0 NOT NULL,
    p2002 smallint DEFAULT 0 NOT NULL,
    p2003 smallint DEFAULT 0 NOT NULL,
    p2005 smallint DEFAULT 0 NOT NULL,
    p2006 smallint DEFAULT 0 NOT NULL,
    p2007 smallint DEFAULT 0 NOT NULL,
    p2008 smallint DEFAULT 0 NOT NULL,
    p2009 smallint DEFAULT 0 NOT NULL,
    p2010 smallint DEFAULT 0 NOT NULL,
    p2011 smallint DEFAULT 0 NOT NULL,
    p2012 smallint DEFAULT 0 NOT NULL,
    p2013 smallint DEFAULT 0 NOT NULL,
    p2014 smallint DEFAULT 0 NOT NULL,
    p2015 smallint DEFAULT 0 NOT NULL,
    p2016 smallint DEFAULT 0 NOT NULL,
    p2017 smallint DEFAULT 0 NOT NULL,
    p2018 smallint DEFAULT 0 NOT NULL,
    p2019 smallint DEFAULT 0 NOT NULL,
    p2020 smallint DEFAULT 0 NOT NULL,
    p2021 smallint DEFAULT 0 NOT NULL,
    p2022 smallint DEFAULT 0 NOT NULL,
    p2023 smallint DEFAULT 0 NOT NULL,
    p2024 smallint DEFAULT 0 NOT NULL,
    p2025 smallint DEFAULT 0 NOT NULL,
    p2026 smallint DEFAULT 0 NOT NULL,
    p2027 smallint DEFAULT 0 NOT NULL,
    p2028 smallint DEFAULT 0 NOT NULL,
    p2029 smallint DEFAULT 0 NOT NULL,
    p3000 smallint DEFAULT 0 NOT NULL,
    p4000 smallint DEFAULT 0 NOT NULL,
    p5000 smallint DEFAULT 0 NOT NULL,
    p6000 smallint DEFAULT 0 NOT NULL,
    p6001 smallint DEFAULT 0 NOT NULL,
    p7000 smallint DEFAULT 0 NOT NULL,
    p8000 smallint DEFAULT 0 NOT NULL,
    p8001 smallint DEFAULT 0 NOT NULL,
    p9000 smallint DEFAULT 0 NOT NULL,
    p10000 smallint DEFAULT 0 NOT NULL,
    p11000 smallint DEFAULT 0 NOT NULL,
    p12000 smallint DEFAULT 0 NOT NULL,
    p13000 smallint DEFAULT 0 NOT NULL,
    p14000 smallint DEFAULT 0 NOT NULL,
    p15000 smallint DEFAULT 0 NOT NULL,
    p16000 smallint DEFAULT 0 NOT NULL,
    p17000 smallint DEFAULT 0 NOT NULL,
    p18000 smallint DEFAULT 0 NOT NULL,
    p19000 smallint DEFAULT 0 NOT NULL,
    p20000 smallint DEFAULT 0 NOT NULL,
    p21000 smallint DEFAULT 0 NOT NULL,
    p22000 smallint DEFAULT 0 NOT NULL,
    p23000 smallint DEFAULT 0 NOT NULL,
    p25000 smallint DEFAULT 0 NOT NULL,
    p26000 smallint DEFAULT 0 NOT NULL,
    p27000 smallint DEFAULT 0 NOT NULL,
    p28000 smallint DEFAULT 0 NOT NULL,
    p29000 smallint DEFAULT 0 NOT NULL,
    p30000 smallint DEFAULT 0 NOT NULL,
    p31000 smallint DEFAULT 0 NOT NULL,
    p40000 smallint DEFAULT 0 NOT NULL,
    p41000 smallint DEFAULT 0 NOT NULL,
    p42000 smallint DEFAULT 0 NOT NULL,
    p43000 smallint DEFAULT 0 NOT NULL
);


--
-- Name: property; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE property (
    uid character(32) NOT NULL,
    name character varying(100) NOT NULL,
    property_type integer NOT NULL,
    length integer NOT NULL,
    decimals integer NOT NULL,
    refnodetypeid character(32),
    refmultivalue smallint,
    acl_uid character(32),
    semantics smallint,
    maskre character varying(255),
    min_date_value timestamp without time zone,
    max_date_value timestamp without time zone,
    min_int_value integer,
    max_int_value integer,
    min_decimal_value numeric(31,5),
    max_decimal_value numeric(31,5),
    groups_only smallint,
    non_groups_only smallint,
    must_be_member_of character(32),
    must_be_container smallint,
    lookupset_uid character(32),
    using_lookupset smallint DEFAULT 0 NOT NULL,
    allow_non_matching_values smallint DEFAULT 0 NOT NULL,
    apply_to_principal smallint DEFAULT 0 NOT NULL
);


--
-- Name: property_group; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE property_group (
    nodetype_uid character(32) NOT NULL,
    name character varying(50) NOT NULL,
    group_order integer NOT NULL
);


--
-- Name: recent_container; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE recent_container (
    uid character(32) NOT NULL,
    node_uid character(65) NOT NULL,
    action_timestamp timestamp without time zone NOT NULL,
    actor_uid character(32) NOT NULL,
    container_level integer NOT NULL
);


--
-- Name: record_node; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE record_node (
    record_number character varying(50) NOT NULL,
    node_uid character(65) NOT NULL
);


--
-- Name: store; Type: TABLE; Schema: mdd; Owner: -; Tablespace: 
--

CREATE TABLE store (
    uid character(32) NOT NULL,
    name character varying(50) NOT NULL,
    store_type character(3) NOT NULL,
    uri character varying(255) NOT NULL,
    acl_uid character(32),
    readonly smallint DEFAULT 0 NOT NULL,
    encryption smallint DEFAULT 0 NOT NULL
);


--
-- Name: container_containee_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: esign_wflow_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: evt_based_notification_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: ftextindex_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: hold_node_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: hold_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: lookupitem_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: lookupset_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: node_refs_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_attribute_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_b7bc8b7449614d159ce0869306f04d36_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_c22816ad803c47ed83400bc787d06ed4_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_c408fbc0ea084ec19b7ee3f4d94e7711_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_dc8e3bc6f41f4f15aa445184108a680a_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_eb50047853d6486b8c7f78ad91d4f454_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_f0000000000000000000000000000000_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_f0000000000000000000000000000001_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_f0000000000000000000000000000002_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_f0000000000000000000000000000003_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_f0000000000000000000000000000004_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_f0000000000000000000000000000005_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_f0000000000000000000000000000006_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_f0000000000000000000000000000007_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_f2bfeb5852264c5aa67f53f96ac28d39_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: nodetype_property_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: principal_group_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: principal_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: profile_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: property_group_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: property_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: recent_container_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: record_node_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: store_pkey; Type: CONSTRAINT; Schema: mdd; Owner: -; Tablespace: 
--




--
-- Name: actor_uid_node_uid_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: containee_uid_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: index_event_timestamp; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: index_nodeevent_event_timestamp; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: lkset_code_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: lkset_name_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: lkset_val_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: node_uid_uniq; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: nodetype_attribute_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: nodetype_level_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: nodetype_name_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: principal_barcode; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: principal_ext_barcode; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: principal_extid_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: principal_uname_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: profile_name_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: property_group_nodetype_name_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: property_group_order_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: property_name_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: store_name_idx; Type: INDEX; Schema: mdd; Owner: -; Tablespace: 
--



--
-- Name: actor_uid_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: ct_node_uid_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: ebn_et_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: ebn_group_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: ebn_nodetype_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: ebn_prop_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_b7bc8b7449614d159ce0869306f04d36; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_c22816ad803c47ed83400bc787d06ed4; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_c408fbc0ea084ec19b7ee3f4d94e7711; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_dc8e3bc6f41f4f15aa445184108a680a; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_eb50047853d6486b8c7f78ad91d4f454; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_f0000000000000000000000000000000; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_f0000000000000000000000000000001; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_f0000000000000000000000000000002; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_f0000000000000000000000000000003; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_f0000000000000000000000000000004; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_f0000000000000000000000000000005; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_f0000000000000000000000000000006; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_f0000000000000000000000000000007; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_acl_f2bfeb5852264c5aa67f53f96ac28d39; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_b7bc8b7449614d159ce0869306f04d36; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_c22816ad803c47ed83400bc787d06ed4; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_c408fbc0ea084ec19b7ee3f4d94e7711; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_dc8e3bc6f41f4f15aa445184108a680a; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_eb50047853d6486b8c7f78ad91d4f454; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_f0000000000000000000000000000000; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_f0000000000000000000000000000001; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_f0000000000000000000000000000002; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_f0000000000000000000000000000003; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_f0000000000000000000000000000004; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_f0000000000000000000000000000005; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_f0000000000000000000000000000006; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_f0000000000000000000000000000007; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_assignee_f2bfeb5852264c5aa67f53f96ac28d39; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_b7bc8b7449614d159ce0869306f04d36; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_c22816ad803c47ed83400bc787d06ed4; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_c408fbc0ea084ec19b7ee3f4d94e7711; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_dc8e3bc6f41f4f15aa445184108a680a; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_eb50047853d6486b8c7f78ad91d4f454; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_f0000000000000000000000000000000; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_f0000000000000000000000000000001; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_f0000000000000000000000000000002; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_f0000000000000000000000000000003; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_f0000000000000000000000000000004; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_f0000000000000000000000000000005; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_f0000000000000000000000000000006; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_f0000000000000000000000000000007; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_classif_f2bfeb5852264c5aa67f53f96ac28d39; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_b7bc8b7449614d159ce0869306f04d36; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_c22816ad803c47ed83400bc787d06ed4; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_c408fbc0ea084ec19b7ee3f4d94e7711; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_dc8e3bc6f41f4f15aa445184108a680a; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_eb50047853d6486b8c7f78ad91d4f454; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_f0000000000000000000000000000000; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_f0000000000000000000000000000001; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_f0000000000000000000000000000002; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_f0000000000000000000000000000003; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_f0000000000000000000000000000004; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_f0000000000000000000000000000005; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_f0000000000000000000000000000006; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_f0000000000000000000000000000007; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_client_f2bfeb5852264c5aa67f53f96ac28d39; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_b7bc8b7449614d159ce0869306f04d36; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_c22816ad803c47ed83400bc787d06ed4; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_c408fbc0ea084ec19b7ee3f4d94e7711; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_dc8e3bc6f41f4f15aa445184108a680a; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_eb50047853d6486b8c7f78ad91d4f454; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_f0000000000000000000000000000000; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_f0000000000000000000000000000001; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_f0000000000000000000000000000002; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_f0000000000000000000000000000003; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_f0000000000000000000000000000004; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_f0000000000000000000000000000005; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_f0000000000000000000000000000006; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_f0000000000000000000000000000007; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_hold_f2bfeb5852264c5aa67f53f96ac28d39; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_b7bc8b7449614d159ce0869306f04d36; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_c22816ad803c47ed83400bc787d06ed4; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_c408fbc0ea084ec19b7ee3f4d94e7711; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_dc8e3bc6f41f4f15aa445184108a680a; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_eb50047853d6486b8c7f78ad91d4f454; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_f0000000000000000000000000000000; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_f0000000000000000000000000000001; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_f0000000000000000000000000000002; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_f0000000000000000000000000000003; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_f0000000000000000000000000000004; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_f0000000000000000000000000000005; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_f0000000000000000000000000000006; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_f0000000000000000000000000000007; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_home_f2bfeb5852264c5aa67f53f96ac28d39; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_b7bc8b7449614d159ce0869306f04d36; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_c22816ad803c47ed83400bc787d06ed4; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_c408fbc0ea084ec19b7ee3f4d94e7711; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_dc8e3bc6f41f4f15aa445184108a680a; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_eb50047853d6486b8c7f78ad91d4f454; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_f0000000000000000000000000000000; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_f0000000000000000000000000000001; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_f0000000000000000000000000000002; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_f0000000000000000000000000000003; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_f0000000000000000000000000000004; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_f0000000000000000000000000000005; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_f0000000000000000000000000000006; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_f0000000000000000000000000000007; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_owner_f2bfeb5852264c5aa67f53f96ac28d39; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_principal_esign_wflow; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_record_node_esign_wflow; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_b7bc8b7449614d159ce0869306f04d36; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_c22816ad803c47ed83400bc787d06ed4; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_c408fbc0ea084ec19b7ee3f4d94e7711; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_dc8e3bc6f41f4f15aa445184108a680a; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_eb50047853d6486b8c7f78ad91d4f454; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_f0000000000000000000000000000000; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_f0000000000000000000000000000001; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_f0000000000000000000000000000002; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_f0000000000000000000000000000003; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_f0000000000000000000000000000004; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_f0000000000000000000000000000005; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_f0000000000000000000000000000006; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_f0000000000000000000000000000007; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_retsched_f2bfeb5852264c5aa67f53f96ac28d39; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_b7bc8b7449614d159ce0869306f04d36; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_c22816ad803c47ed83400bc787d06ed4; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_c408fbc0ea084ec19b7ee3f4d94e7711; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_dc8e3bc6f41f4f15aa445184108a680a; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_eb50047853d6486b8c7f78ad91d4f454; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_f0000000000000000000000000000000; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_f0000000000000000000000000000001; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_f0000000000000000000000000000002; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_f0000000000000000000000000000003; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_f0000000000000000000000000000004; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_f0000000000000000000000000000005; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_f0000000000000000000000000000006; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_f0000000000000000000000000000007; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: fk_sec_level_f2bfeb5852264c5aa67f53f96ac28d39; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: group_uid_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: hold_acl_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: hold_contact_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: hold_node_hold_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: lkpitm_fk1; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: node_refs_property_uid_fkey; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: nodetype_acl_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: nodetype_attribute_nodetype_uid_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: nodetype_c22816ad803c47ed8340_j1a034132d74409fa321444e8b7f_fkey; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: nodetype_c408fbc0ea084ec19b7e_fdc659695c944890b9c1720de461_fkey; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: nodetype_dc8e3bc6f41f4f15aa44_f792c310e30b4a43b21658046926_fkey; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: nodetype_dc8e3bc6f41f4f15aa44_fdc5a29e8ead4b2f841ee80af03f_fkey; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: nodetype_eb50047853d6486b8c7f_fdc659695c944890b9c1720de461_fkey; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: nodetype_uid_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: nt_rs_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: principal_profile_uid_fkey; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: principal_uid_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: prop_lkpset_fk1; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: property_group_nodetype_uid_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: property_member_of_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: property_refnodetype_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: property_uid_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- Name: store_uid_fk; Type: FK CONSTRAINT; Schema: mdd; Owner: -
--




--
-- PostgreSQL database dump complete
--

