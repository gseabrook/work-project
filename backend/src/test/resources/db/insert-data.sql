--
-- PostgreSQL database dump
--

--
-- Data for Name: container_containee; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: record_node; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-1', 'b7bc8b7449614d159ce0869306f04d36-c5c7e7e7d62c46a4a6fae91dc22004d9');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-2', 'b7bc8b7449614d159ce0869306f04d36-aa4c1ce39d044092a9f9691d178c4351');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-3', 'b7bc8b7449614d159ce0869306f04d36-cccab6d0af204c8795d11e13698796b8');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-4', 'b7bc8b7449614d159ce0869306f04d36-ca31bf19de8b4769a014a9e1d7c4d46d');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-5', 'b7bc8b7449614d159ce0869306f04d36-h37714a8ad974a8d8977d27bcbf6c52c');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-6', 'b7bc8b7449614d159ce0869306f04d36-j826cb9658cd41878c369f31af206ae9');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-7', 'b7bc8b7449614d159ce0869306f04d36-e1680dec494a42f3be778ea6bfb86190');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-8', 'b7bc8b7449614d159ce0869306f04d36-idb09fe3c9c049c8964fcb23c61dda24');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-9', 'b7bc8b7449614d159ce0869306f04d36-e90431d4422b4463b30d8dcf70d4d78e');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-10', 'b7bc8b7449614d159ce0869306f04d36-ef4c0e2eb45947d2a1d5b46d501c3943');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-11', 'b7bc8b7449614d159ce0869306f04d36-ca9dbe06eacc4662a1de95dd14c4b3a9');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-12', 'b7bc8b7449614d159ce0869306f04d36-b3d5a4c317534862a9d7b495ef2f59ce');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-13', 'b7bc8b7449614d159ce0869306f04d36-bdede6e0767e402786a2075763dc939a');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-14', 'b7bc8b7449614d159ce0869306f04d36-hd3203284c9745ddaf1a2edfb7b00085');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-15', 'b7bc8b7449614d159ce0869306f04d36-c56ac00fcc2f484d8323d87d3f224fcc');
INSERT INTO record_node (record_number, node_uid) VALUES ('BANK-2017-16', 'b7bc8b7449614d159ce0869306f04d36-b8c50e69c5544dc9829b7bda93bec482');
INSERT INTO record_node (record_number, node_uid) VALUES ('CUSTOMER-2017-1', 'f2bfeb5852264c5aa67f53f96ac28d39-cd0537ab5e1b4c66bab0eef4ecc054f3');
INSERT INTO record_node (record_number, node_uid) VALUES ('CUST-BANK-14032017-1', 'eb50047853d6486b8c7f78ad91d4f454-e8c43936e5964fa78934b38a440e1ab8');
INSERT INTO record_node (record_number, node_uid) VALUES ('CUST-BANK-14032017-2', 'eb50047853d6486b8c7f78ad91d4f454-e913beff31964fd4ad77b9e6c7ef64a0');
INSERT INTO record_node (record_number, node_uid) VALUES ('MERCHANT-ACC-14032017-1', 'c408fbc0ea084ec19b7ee3f4d94e7711-jd5585e3f0784fc386a35f74bea024f6');
INSERT INTO record_node (record_number, node_uid) VALUES ('MERCHANT-ACC-14032017-2', 'c408fbc0ea084ec19b7ee3f4d94e7711-cf4772bccf3e4f79b512094f596b60e2');
INSERT INTO record_node (record_number, node_uid) VALUES ('MERCHANT-2017-2', 'c22816ad803c47ed83400bc787d06ed4-cac5e82e2312435a9bc943028f22133a');


--
-- Data for Name: esign_wflow; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: lookupset; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO lookupset (uid, name, description) VALUES ('c0000000000000000000000000000000', 'Template Lookup', 'List of templates');
INSERT INTO lookupset (uid, name, description) VALUES ('acf7d22cb63b438b901e615391d87a3d', 'Merchant Bank Name', '');
INSERT INTO lookupset (uid, name, description) VALUES ('a9b72f76dfa94af88bc933fe99695b7f', 'Gender', '');
INSERT INTO lookupset (uid, name, description) VALUES ('f6cc79d5305f4e65a520b89146b5dbee', 'ID Type', '');
INSERT INTO lookupset (uid, name, description) VALUES ('i65f3cab798e4af68eecf22c9c0e02c4', 'Frequency', '');


--
-- Data for Name: store; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO store (uid, name, store_type, uri, acl_uid, readonly, encryption) VALUES ('b0000000000000000000000000000000', 'DEFAULT_STORE', '100', '$defaultStoreURI', NULL, 0, 1);


--
-- Data for Name: nodetype; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('f0000000000000000000000000000001', '$.EBIKKO.USER.DETAILS', 'Node Type used to store user details.', NULL, NULL, 1, 0, 1, 0, 0, 0, 1, 4, '(', ')', 2011, 0, 1, '', 1, 1, 3, NULL, NULL, NULL, 0, 0, 11, 0, 0, 0, ' function preSave(node,
	isNewRecord) {

 }

  function postSave(node,
	isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('f0000000000000000000000000000000', '$.EBIKKO.FAVOURITES', 'Node Type used to store favourites nodes based on owner principal', NULL, NULL, 1, 0, 1, 0, 0, 0, 1, 4, '(', ')', 2011, 0, 1, '', 1, 1, 3, NULL, NULL, NULL, 0, 0, 11, 0, 0, 0, ' function preSave(node,
	isNewRecord) {

 }

  function postSave(node,
	isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('f0000000000000000000000000000002', 'Email', 'Record Type used for email cataloging.', 'b0000000000000000000000000000000', NULL, 1, 0, 0, 0, 0, 1, 3, 2, '(', ')', 2011, 0, 1, '', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 1, 0, 0, ' function preSave(node,
	isNewRecord) {

 }

  function postSave(node,
	isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

 ', 'Email Subject', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('f0000000000000000000000000000003', 'Template', 'Templates as Records', 'b0000000000000000000000000000000', NULL, 1, 0, 0, 0, 0, 0, 1, 3, '(', ')', 2011, 0, 1, 'TPL-###', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 1, 0, 0, ' function preSave(node,isNewRecord) {

 }

  function postSave(node,isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

 ', 'Template Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('f0000000000000000000000000000004', 'Workflow Template', 'Workflow Design Template', 'b0000000000000000000000000000000', NULL, 1, 0, 0, 0, 0, 0, 1, 3, '(', ')', 2011, 0, 1, 'BPM-###', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 1, 0, 0, ' function preSave(node,isNewRecord) {

 }

  function postSave(node,isNewRecord) {

 }

  function preDelete(node) {

}

  function postDelete(node) {

 }

  function init(node) {

 }

 ', 'Workflow Design Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('f0000000000000000000000000000005', 'Email Catalog', 'Record Type used for email cataloging.', 'b0000000000000000000000000000000', NULL, 1, 0, 0, 0, 0, 1, 3, 2, '(', ')', 2011, 0, 1, '', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 1, 0, 0, ' function preSave(node,
	isNewRecord) {

 }

  function postSave(node,
	isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

 ', 'Email Catalog', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('f0000000000000000000000000000006', 'Email Attachments', 'Record Type used for email attachments.', 'b0000000000000000000000000000000', NULL, 1, 0, 0, 0, 0, 1, 2, 2, '(', ')', 2011, 0, 1, '', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 1, 0, 0, ' function preSave(node,
	isNewRecord) {

 }

  function postSave(node,
	isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

 ', 'Email Attachments', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('f0000000000000000000000000000007', '$.EBIKKO.FAVOURITES.CLASSIFICATION', 'Node Type used to store favourites classification based on owner principal', NULL, NULL, 1, 0, 0, 0, 0, 1, 3, 3, '(', ')', 2016, 0, 1, 'FAVCLASS-####', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 0, 0, 0, ' function preSave(node,
	isNewRecord) {

 }

  function postSave(node,
	isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'Merchant Information', '', 'b0000000000000000000000000000000', NULL, 1, 0, 0, 0, 0, 0, 4, 3, '(', ')', 2017, 1, 3, 'MERCHANT-YYYY-##########', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 1, 0, 0, 'importPackage(Packages.ebikko);
importPackage(Packages.ebikko.filter);

  function preSave(node, isNewRecord) {
  
  var session = node.getSession();
  var comName = node.getValue(''Company Name'');
  node.setTitle(comName);

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {
	if(node.getRecordNumber() == null || node.getRecordNumber() == "")
	{ 
			var session = node.getSession();
        	node.setTitle(''Merchant Information'');
        	
        	       	
    }
 }

', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 1, 0, '', 0, '', 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'Customer Information', '', 'b0000000000000000000000000000000', NULL, 1, 0, 0, 0, 0, 0, 4, 3, '(', ')', 2017, 1, 2, 'CUSTOMER-YYYY-##########', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 1, 0, 0, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 1, 0, '', 0, '', 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'eMandate Form', '', 'b0000000000000000000000000000000', NULL, 1, 0, 0, 0, 0, 0, 4, 3, '(', ')', 2017, 1, 0, 'MANDATE-DDMMYYYY-##########', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 1, 0, 0, '  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 1, 0, '', 0, '', 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711', 'Merchant Bank Account', '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 3, '(', ')', 2017, 1, 3, 'MERCHANT-ACC-DDMMYYYY-###############', 1, 1, 3, NULL, NULL, NULL, 1, 0, 11, 0, 0, 0, '  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 1, 0, '', 0, '', 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('b7bc8b7449614d159ce0869306f04d36', 'Bank Information', '', 'b0000000000000000000000000000000', NULL, 1, 0, 0, 0, 0, 0, 4, 3, '(', ')', 2017, 1, 17, 'BANK-YYYY-######', 1, 1, 3, NULL, NULL, NULL, 1, 1, 11, 1, 0, 0, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 1, 0, '', 0, '', 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO nodetype (uid, name, description, store_uid, acl_uid, apply_node_acl_filter, apply_nodetype_default_acl_filter, apply_owner_filter, apply_classification_default_acl_filter, apply_container_based_filter, is_container, level, record_numbering_method, enclosure_number_prefix, enclosure_number_suffix, current_record_year, reset_record_number_at_year_end, next_record_number, record_number_pattern, init_record_number, number_pattern_increment, enclosure_number_max_digits, default_acl_uid, default_security_level_uid, default_retention_schedule_uid, is_metadata_text_indexed, is_content_text_indexed, titling_method, can_attach_content, content_mandatory, is_shreddable, autoexec_script, titlealias, icon, description_alias, notes_alias, record_number_alias, barcode_alias, container_alias, external_barcode_alias, enclosure_number_alias, classification_alias, secondary_classification_alias, tertiary_classification_alias, date_registered_alias, creator_name_alias, creator_username_alias, master_alias, date_of_last_enclosure_alias, date_enclosed_alias, date_finalized_alias, assignee_alias, home_alias, owner_alias, disposition_status_alias, external_uid_alias, integrity_check_alias, finalized_alias, is_hybrid_alias, retention_schedule_alias, security_level_alias, date_last_modified_alias, date_last_modified_of_contents_alias, client_alias, combined_title_alias, mime_type_alias, date_closed_alias, num_digits_enclosure_number, apply_autoexec_scripting, uncompressed_record_number_alias, opened_temporarily_alias, date_created_alias, author_alias, batch_id_alias, date_archived_alias, date_made_inactive_alias, apply_content_template, content_template_node_uid, copy_content_template_on_create, copy_content_template_on_update, content_template_on_update_behaviour, launch_activity_on_node_create, activity_name, apply_content_conversion, conversion_format, default_auto_finalize, record_class_alias, default_record_class, is_voluming_enabled, is_auto_close_volume, is_close_volume_after_exceed_max_content, is_close_volume_on_particular_date, is_close_volume_on_triggered_event, is_auto_open_volume_after_exceed_max_content, is_auto_open_volume_on_particular_date, is_auto_open_volume_on_triggered_event, volume_max_content, volume_closing_date, volume_triggered_event, volume_triggered_event_type, volume_triggered_event_duration, volume_separator, num_of_digits_for_volume_number, volume_triggered_event_property_uid, record_event_setting, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, hybrid_remarks_alias, is_declassify_alias, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_imported, can_show_tab, can_show_alt_container, can_show_rel_record, can_show_retention) VALUES ('eb50047853d6486b8c7f78ad91d4f454', 'Customer Bank Account', '', NULL, NULL, 1, 0, 0, 0, 0, 0, 2, 3, '(', ')', 2017, 1, 3, 'CUST-BANK-DDMMYYYY-###############', 1, 1, 3, NULL, NULL, NULL, 0, 0, 11, 0, 0, 0, '  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, 1, 0, '', 0, '', 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, NULL, 3, NULL, 63, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0);


--
-- Data for Name: property; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000001', '$.EBIKKO.PROP.USER.PHOTO', 900, 0, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000000', '$.EBIKKO.PROP.FAVS.NODES', 1100, 0, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000002', 'Email From', 100, 255, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000003', 'Email Sender', 100, 255, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000004', 'Email To', 800, 0, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000005', 'Email Cc', 800, 0, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000006', 'Email Bcc', 800, 0, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000007', 'Email Date Sent', 100, 255, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000009', 'Email Timestamp Sent', 700, 255, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000010', 'Email Timestamp Received', 700, 255, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000008', 'Template Type', 100, 100, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, 'c0000000000000000000000000000000', 1, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000012', 'Email Attachments', 1100, 0, 0, NULL, 1, NULL, 3, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000011', 'Email Message', 800, 0, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000013', '$.EBIKKO.PROP.FAVS.FOLDER.NODES', 100, 0, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a0000000000000000000000000000014', '$.EBIKKO.PROP.FAVS.CLASSIFICATIONS', 1500, 0, 0, NULL, 1, NULL, 0, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('ha41c373c2f0413cb1458bb886048bb2', 'Company Name', 100, 255, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('f0970f3862f941338e162f34b75e6831', 'Company Registration No', 100, 20, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('f362b3fe8c934881b0a3ee7e829df929', 'Business Description', 800, 0, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('f3e001ad12ef439b9b7c3d67a6239f10', 'Business Address', 800, 0, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('d2800efb0ed84f738f8dff1b9be7860e', 'Business Phone No', 100, 15, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('f8fef67bb03c47faa48061fcd1c2f038', 'Business Fax No', 100, 15, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a219cee40a3f4ae9be8f695763b78d33', 'Home URL', 100, 255, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('d6376ccdb85c43af8260fb05786d731a', 'Contact Person Name', 100, 255, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('bf65f9219f944e47b00873d7bec3343c', 'Contact Person Phone No', 100, 15, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('gf1f763b063149df8529223e8b37a24b', 'Contact Person IC No', 100, 15, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('ec690c2952ef478ebcc6f25afbc367f2', 'Contact Person Email', 100, 255, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('cead45cc70f2415ca1054f2853a8a100', 'Merchant Account No', 100, 20, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('ae6c83a22dd849ebba2cfddb45a32a47', 'Gender', 100, 100, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, 'a9b72f76dfa94af88bc933fe99695b7f', 1, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('h763e35b6288452895b143ec4bad9d02', 'Customer Name', 100, 255, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('ac587b9bdb0545d9a4bb872848b12755', 'ID Type', 100, 100, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, 'f6cc79d5305f4e65a520b89146b5dbee', 1, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('c7b15198b7a844d2bbe56fa6116f9018', 'ID Number', 100, 15, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('ibdaf89d09234fef9826c0f2a81ef088', 'Email', 100, 255, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('e12bc6ec5ab144aab50b592c046de9f5', 'Address', 800, 0, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('f5da945a323c4488b407142013d47646', 'Phone Number', 100, 15, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('j8e43ac4e85940c6a15e4c35f0a5a7e5', 'Account Number', 100, 20, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('b5fb184441d941d6936f00708785f3f3', 'Bank Code', 100, 10, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('j72d25f47afb42ea84fd364233a29430', 'Reference Number', 100, 50, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('a4d54a1736fa45e796aa89ff04b83f55', 'Name', 100, 255, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('c6bc629517e44c6f982e25f8daf5bbd6', 'Registration Date', 500, 0, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('b1b99355d0834804a01b7a69fc2421bd', 'Maximum Amount', 300, 16, 2, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, 0.00000, 99999999999999.98000, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('f9ce8fde98e547699ff79602b2dce34f', 'Effective Date', 500, 0, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('hea71551e76346ad8f8e87f13911c1b3', 'Frequency', 100, 100, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, 'i65f3cab798e4af68eecf22c9c0e02c4', 1, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('c1fb9f1f82af496cbbfd8f387aefab42', 'Merchant ID', 100, 20, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('e797f68ea14741bc85f1b7813cd0d875', 'Customer Bank Account', 1100, 0, 0, 'eb50047853d6486b8c7f78ad91d4f454', 1, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('b6d28a5702d740cdb0f733f97aee88c5', 'Merchant Bank Account', 1100, 0, 0, 'c408fbc0ea084ec19b7ee3f4d94e7711', 1, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('afd1329c2de2421bbbe5a48f65b56818', 'Name of the Bank', 100, 255, 0, NULL, 0, NULL, 1, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);
INSERT INTO property (uid, name, property_type, length, decimals, refnodetypeid, refmultivalue, acl_uid, semantics, maskre, min_date_value, max_date_value, min_int_value, max_int_value, min_decimal_value, max_decimal_value, groups_only, non_groups_only, must_be_member_of, must_be_container, lookupset_uid, using_lookupset, allow_non_matching_values, apply_to_principal) VALUES ('fdc659695c944890b9c1720de461db2e', 'Bank Name', 1100, 0, 0, 'b7bc8b7449614d159ce0869306f04d36', 0, NULL, 2, NULL, NULL, NULL, 0, 2147483647, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, 0);


--
-- Data for Name: evt_based_notification; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: ftextindex; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('ee99b7f9e227453f82345b35cc3ae809', '2017-03-13 11:12:18.494', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-c56ac00fcc2f484d8323d87d3f224fcc', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.917', '2017-03-13 17:17:05.962');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('c26bba1564e24a069981df03bf1fbb60', '2017-03-13 09:45:20.954', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-c5c7e7e7d62c46a4a6fae91dc22004d9', 1, 'A', 'S', NULL, '2017-03-13 15:47:05.303', '2017-03-13 15:47:05.377');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('ifa06ce4dcee4c6ca2ea5e393c320c67', '2017-03-13 11:08:52.16', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-e1680dec494a42f3be778ea6bfb86190', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.388', '2017-03-13 17:17:05.415');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('d202cbdf92b74b52b1b5799a95360d1a', '2017-03-13 09:45:29.303', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-c5c7e7e7d62c46a4a6fae91dc22004d9', 2, 'A', 'S', NULL, '2017-03-13 15:47:05.378', '2017-03-13 15:47:05.447');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('e6e660f4c99d4f6fb15b6c0e08421bf3', '2017-03-13 09:45:52.269', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-aa4c1ce39d044092a9f9691d178c4351', 1, 'A', 'S', NULL, '2017-03-13 15:57:05.306', '2017-03-13 15:57:05.349');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('gdf9d1fd3a3b4bc883e02c1df3af6a93', '2017-03-13 11:09:27.152', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-idb09fe3c9c049c8964fcb23c61dda24', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.415', '2017-03-13 17:17:05.443');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('ee290ac01c054e5d976f2f4c579f6be9', '2017-03-13 10:29:22.718', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-cccab6d0af204c8795d11e13698796b8', 1, 'A', 'S', NULL, '2017-03-13 16:37:05.307', '2017-03-13 16:37:05.352');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('f9f1ce64f7424b06938b17fba8b68929', '2017-03-13 11:12:39.626', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-b8c50e69c5544dc9829b7bda93bec482', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.964', '2017-03-13 17:17:06.053');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('jb232153e5854f2483219c1b5870d62e', '2017-03-14 04:30:33.381', 'f2bfeb5852264c5aa67f53f96ac28d39', 'f2bfeb5852264c5aa67f53f96ac28d39-cd0537ab5e1b4c66bab0eef4ecc054f3', 2, 'A', 'S', NULL, '2017-03-14 12:37:05.722', '2017-03-14 12:37:05.77');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('e17e6b37ad8c4576a8abb8b44eff0a5c', '2017-03-13 11:09:59.138', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-e90431d4422b4463b30d8dcf70d4d78e', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.444', '2017-03-13 17:17:05.51');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('jfde6b38bd7b44fa89f60ca9b3cf5ee6', '2017-03-13 10:56:04.668', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-ca31bf19de8b4769a014a9e1d7c4d46d', 1, 'A', 'S', NULL, '2017-03-13 17:07:05.309', '2017-03-13 17:07:05.355');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('f27f459f109a400cbb7c60cfa4b7247c', '2017-03-13 11:10:27.84', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-ef4c0e2eb45947d2a1d5b46d501c3943', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.512', '2017-03-13 17:17:05.557');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('h4fc5bdcb0c8435390850aa4d70ec94e', '2017-03-13 11:08:02.066', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-h37714a8ad974a8d8977d27bcbf6c52c', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.305', '2017-03-13 17:17:05.353');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('jab1d7dbf7dc42ebacb524eebb0e5888', '2017-03-13 11:08:32.517', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-j826cb9658cd41878c369f31af206ae9', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.355', '2017-03-13 17:17:05.387');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('a64ff0e574b84fcfbc3f35a875d8b090', '2017-03-13 11:10:59.443', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-ca9dbe06eacc4662a1de95dd14c4b3a9', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.558', '2017-03-13 17:17:05.603');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('b6353fff7ff647ecb7ef7c4e2b7f3295', '2017-03-13 11:11:19.122', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-b3d5a4c317534862a9d7b495ef2f59ce', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.608', '2017-03-13 17:17:05.662');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('cef6bdbb63bf46a79fbf0f181fc50b6a', '2017-03-13 11:11:39.314', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-bdede6e0767e402786a2075763dc939a', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.663', '2017-03-13 17:17:05.865');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('d5ab8d1cf0174d29965cce672cf688ab', '2017-03-13 11:11:58.884', 'b7bc8b7449614d159ce0869306f04d36', 'b7bc8b7449614d159ce0869306f04d36-hd3203284c9745ddaf1a2edfb7b00085', 1, 'A', 'S', NULL, '2017-03-13 17:17:05.866', '2017-03-13 17:17:05.913');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('g6e12ca22a784d12b608717ca697fa47', '2017-03-14 04:51:02.918', 'c408fbc0ea084ec19b7ee3f4d94e7711', 'c408fbc0ea084ec19b7ee3f4d94e7711-jd5585e3f0784fc386a35f74bea024f6', 1, 'M', 'S', NULL, '2017-03-14 12:57:05.291', '2017-03-14 12:57:05.336');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('hce7fd9ec17b44d3a788977d0dfdb6bd', '2017-03-14 04:29:21.855', 'f2bfeb5852264c5aa67f53f96ac28d39', 'f2bfeb5852264c5aa67f53f96ac28d39-cd0537ab5e1b4c66bab0eef4ecc054f3', 1, 'A', 'S', NULL, '2017-03-14 12:37:05.524', '2017-03-14 12:37:05.587');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('c9cad9d35588441c851645f36c9516d3', '2017-03-14 04:29:39.11', 'f2bfeb5852264c5aa67f53f96ac28d39', 'f2bfeb5852264c5aa67f53f96ac28d39-cd0537ab5e1b4c66bab0eef4ecc054f3', 2, 'A', 'S', NULL, '2017-03-14 12:37:05.588', '2017-03-14 12:37:05.668');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('j30905716b6e4238ac3e49dc9b169952', '2017-03-14 04:51:45.681', 'c408fbc0ea084ec19b7ee3f4d94e7711', 'c408fbc0ea084ec19b7ee3f4d94e7711-cf4772bccf3e4f79b512094f596b60e2', 1, 'M', 'S', NULL, '2017-03-14 12:57:05.337', '2017-03-14 12:57:05.378');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('d7ec9994912f48f099777f34d4204478', '2017-03-14 04:29:54.245', 'f2bfeb5852264c5aa67f53f96ac28d39', 'f2bfeb5852264c5aa67f53f96ac28d39-cd0537ab5e1b4c66bab0eef4ecc054f3', 2, 'A', 'S', NULL, '2017-03-14 12:37:05.669', '2017-03-14 12:37:05.72');
INSERT INTO ftextindex (uid, insertion_timestamp, nodetype_id, node_id, index_code, target, completion_status, exception, index_timestamp, completion_timestamp) VALUES ('fe461a2e85a747a1b23f58523c3c14e6', '2017-03-14 04:51:56.935', 'c22816ad803c47ed83400bc787d06ed4', 'c22816ad803c47ed83400bc787d06ed4-cac5e82e2312435a9bc943028f22133a', 1, 'A', 'S', NULL, '2017-03-14 12:57:05.379', '2017-03-14 12:57:05.424');


--
-- Data for Name: hold; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: hold_node; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: lookupitem; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('d0000000000000000000000000000000', 'c0000000000000000000000000000000', '100', 'ADMINISTRATION', 'Default report template for administration use');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('d0000000000000000000000000000001', 'c0000000000000000000000000000000', '200', 'REPORT DESIGN', 'Default report template for record listing');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('d0000000000000000000000000000002', 'c0000000000000000000000000000000', '300', 'DOCUMENT TEMPLATE', 'Default report template for single record');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('d0000000000000000000000000000003', 'c0000000000000000000000000000000', '400', 'CONTENT TEMPLATE', 'Default template for content templating');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('cbe93f342aa24dbb85a00cbdd9570f6d', 'acf7d22cb63b438b901e615391d87a3d', 'AFFB0123', 'Affin Bank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('caedb4d625774360813cf76b40ab1d62', 'acf7d22cb63b438b901e615391d87a3d', 'BCBB0235', 'CIMB Bank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('c8d48fb90ec64d3f803fcfe6cf28dc04', 'acf7d22cb63b438b901e615391d87a3d', 'BIMB0340', 'Bank Islam', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('c3ddd158a7ac47a087fd4d8b882a4538', 'acf7d22cb63b438b901e615391d87a3d', 'BKR1602', 'Bank Rakyat', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('e9e4b58010ce4c14b1fe154aeea79376', 'acf7d22cb63b438b901e615391d87a3d', 'BOFA0207', 'Bank of America', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('b2d0aff6dbd5431ab6245ba37a29c126', 'acf7d22cb63b438b901e615391d87a3d', 'CIT0217', 'Citibank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('ic7d91fbc4d741b2b36eeeb0a87b20e1', 'acf7d22cb63b438b901e615391d87a3d', 'DBB0219', 'Deutsche Bank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('fd7cd734f73a4d5fa5788e5b68a6101f', 'acf7d22cb63b438b901e615391d87a3d', 'HLB0224', 'Hong Leong Bank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('bc97417477d9456dacf8c4d3933726d7', 'acf7d22cb63b438b901e615391d87a3d', 'HSBC0222', 'HSBC Bank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('j33dc4e0dc03467a9e9a11fecf85d882', 'acf7d22cb63b438b901e615391d87a3d', 'JPMC0215', 'JPMorgan', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('a35bb4a286b74d26a5b2b5e4e53eac32', 'acf7d22cb63b438b901e615391d87a3d', 'MBB0227', 'Maybank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('e3009da37594400f9e36193fd761ac1a', 'acf7d22cb63b438b901e615391d87a3d', 'OCBC0229', 'OCBC Bank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('gbe2abda751a4c4e9d8d7c64adbbaaca', 'acf7d22cb63b438b901e615391d87a3d', 'PBB0233', 'Public Bank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('f34b783bc762417ca6dfd0c5934a6025', 'acf7d22cb63b438b901e615391d87a3d', 'REV0123', 'TPAREVENUE', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('j867613bd60e41d09981f293f9ae4687', 'acf7d22cb63b438b901e615391d87a3d', 'RHB0218', 'RHB Bank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('c463d4fdc9554bf6b3584b44aec118c6', 'acf7d22cb63b438b901e615391d87a3d', 'SCB0214', 'Standard Chartered Bank', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('f0efc7d1a3424bc3bc6ddf004020fd12', 'a9b72f76dfa94af88bc933fe99695b7f', 'F', 'Female', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('ac0111750db643e38e5b1ac0eb3c7e48', 'a9b72f76dfa94af88bc933fe99695b7f', 'M', 'Male', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('i23f3c7062574d6897bd4d052a40ded6', 'f6cc79d5305f4e65a520b89146b5dbee', '01', 'New IC Number', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('cbc7f4e79a3048fa883a0d30f3dd8ab4', 'f6cc79d5305f4e65a520b89146b5dbee', '02', 'Old IC Number', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('def02501e4b140959d11c5a75c9ba74a', 'f6cc79d5305f4e65a520b89146b5dbee', '03', 'Passport Number', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('a0448da9da1f4bab97378c4d8a75050a', 'f6cc79d5305f4e65a520b89146b5dbee', '04', 'Business Registration Number', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('fb06d3feb10a4928984dadffd3434284', 'f6cc79d5305f4e65a520b89146b5dbee', '05', 'Others', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('a45ec2e4c8f74f60b469d77d6a02c7f8', 'i65f3cab798e4af68eecf22c9c0e02c4', '01', 'Daily', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('fda84f41aae648d397e86c664d2eb936', 'i65f3cab798e4af68eecf22c9c0e02c4', '02', 'Weekly', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('cb4cf0f19e1e4bfab9f49f83cda1f7e8', 'i65f3cab798e4af68eecf22c9c0e02c4', '03', 'Monthly', '');
INSERT INTO lookupitem (uid, lookupset_uid, code, val, description) VALUES ('e37b99f24d734c7cbde530831c19fcf7', 'i65f3cab798e4af68eecf22c9c0e02c4', '04', 'Yearly', '');


--
-- Data for Name: node_event; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:45:20.957', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-c5c7e7e7d62c46a4a6fae91dc22004d9', 'BANK-2017-1', 'Affin Bank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-1

Uncompressed Record Number set to BANK-2017-000001

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Affin Bank]

Combined Title set to [Affin Bank]

Date Registered set to Mon, 13 Mar 2017 09:45 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NnxT04d995

Next Enclosure Number set to 1

Property[Bank Code] set to [AFFB0123] 

Property[Bank Name] set to [Affin Bank] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:45:29.307', 'MODIFY', 'b7bc8b7449614d159ce0869306f04d36-c5c7e7e7d62c46a4a6fae91dc22004d9', 'BANK-2017-1', 'Affin Bank', '00000000000000000000000000000000', 'ROOT', 'Date Last Modified changed from NULL to Mon, 13 Mar 2017 09:45 AM +0000

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:45:52.271', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-aa4c1ce39d044092a9f9691d178c4351', 'BANK-2017-2', 'CIMB Bank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-2

Uncompressed Record Number set to BANK-2017-000002

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [CIMB Bank]

Combined Title set to [CIMB Bank]

Date Registered set to Mon, 13 Mar 2017 09:45 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to Nq54435142

Next Enclosure Number set to 1

Property[Bank Code] set to [BCBB0235] 

Property[Bank Name] set to [CIMB Bank] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:29:22.721', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-cccab6d0af204c8795d11e13698796b8', 'BANK-2017-3', 'Bank Islam', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-3

Uncompressed Record Number set to BANK-2017-000003

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Bank Islam]

Combined Title set to [Bank Islam]

Date Registered set to Mon, 13 Mar 2017 10:29 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NOlC96b832

Next Enclosure Number set to 1

Property[Bank Code] set to [BIMB0340] 

Property[Bank Name] set to [Bank Islam] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:31:22.834', 'CREATE', 'f2bfeb5852264c5aa67f53f96ac28d39-fd15f54efd07479fb573b57394fccf09', 'CUSTOMER-2017-1', 'Michelle Lim', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to CUSTOMER-2017-1

Uncompressed Record Number set to CUSTOMER-2017-0000000001

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Customer Information]

Title set to [Michelle Lim]

Combined Title set to [Michelle Lim]

Date Registered set to Mon, 13 Mar 2017 10:31 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to N2QWcf0909

Next Enclosure Number set to 1

Property[ID Number] set to [880520145678] 

Property[Customer Name] set to [Michelle Lim] 

Property[Address] set to [Unit 01-02, Damansara Jaya, Petaling Jaya, Selangor, Malaysia] 

Property[Email] set to [michelle@yahoo.com] 

Property[Phone Number] set to [0123456789] 

Property[Account Number] set to [117658904326] 

Property[Customer Bank Name] set to Affin Bank (BANK-2017-1)   

Property[ID Type] set to [New IC Number] 

Property[Gender] set to [Female] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:35:22.951', 'CREATE', 'c22816ad803c47ed83400bc787d06ed4-cf506e58b2f94a5590927b1f71863179', 'MERCHANT-2017-1', 'Ag I Solutions (M) Sdn Bhd', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to MERCHANT-2017-1

Uncompressed Record Number set to MERCHANT-2017-0000000001

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Merchant Information]

Title set to [Ag I Solutions (M) Sdn Bhd]

Combined Title set to [Ag I Solutions (M) Sdn Bhd]

Date Registered set to Mon, 13 Mar 2017 10:35 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NBd2317935

Next Enclosure Number set to 1

Property[Contact Person Email] set to [steve@gmail.com] 

Property[Contact Person Name] set to [Steve] 

Property[Company Name] set to [Ag I Solutions (M) Sdn Bhd] 

Property[Business Fax No] set to [62315679] 

Property[Business Address] set to [Unit 05-01,  Tower A, The Vertical, Bangsar South, Kuala Lumpur] 

Property[Business Description] set to [IT] 

Property[Company Registration No] set to [ABCD1234] 

Property[Home URL] set to [www.ag-isolutions.com] 

Property[Merchant Bank Name] set to CIMB Bank (BANK-2017-2)   

Property[Merchant Account No] set to [554367803214] 

Property[Business Phone No] set to [62315678] 

Property[Contact Person IC No] set to [A123686843] 

Property[Contact Person Phone No] set to [0121234567] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:56:04.671', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-ca31bf19de8b4769a014a9e1d7c4d46d', 'BANK-2017-4', 'Bank Rakyat', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-4

Uncompressed Record Number set to BANK-2017-000004

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Bank Rakyat]

Combined Title set to [Bank Rakyat]

Date Registered set to Mon, 13 Mar 2017 10:56 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to N7RXd46d05

Next Enclosure Number set to 1

Property[Bank Code] set to [BKR1602] 

Property[Bank Name] set to [Bank Rakyat] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:08:02.068', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-h37714a8ad974a8d8977d27bcbf6c52c', 'BANK-2017-5', 'Bank of America', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-5

Uncompressed Record Number set to BANK-2017-000005

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Bank of America]

Combined Title set to [Bank of America]

Date Registered set to Mon, 13 Mar 2017 11:08 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NUhKc52c22

Next Enclosure Number set to 1

Property[Bank Code] set to [BOFA0207] 

Property[Bank Name] set to [Bank of America] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:08:32.519', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-j826cb9658cd41878c369f31af206ae9', 'BANK-2017-6', 'Citibank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-6

Uncompressed Record Number set to BANK-2017-000006

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Citibank]

Combined Title set to [Citibank]

Date Registered set to Mon, 13 Mar 2017 11:08 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to N7Rr6ae983

Next Enclosure Number set to 1

Property[Bank Code] set to [CIT0217] 

Property[Bank Name] set to [Citibank] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:25:22.949', 'DELETE', 'f2bfeb5852264c5aa67f53f96ac28d39-fd15f54efd07479fb573b57394fccf09', 'CUSTOMER-2017-1', 'Michelle Lim', '00000000000000000000000000000000', 'ROOT', 'Record was deleted; Record Number = [CUSTOMER-2017-1], Title = [Michelle Lim]

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:08:52.162', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-e1680dec494a42f3be778ea6bfb86190', 'BANK-2017-7', 'Deutsche Bank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-7

Uncompressed Record Number set to BANK-2017-000007

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Deutsche Bank]

Combined Title set to [Deutsche Bank]

Date Registered set to Mon, 13 Mar 2017 11:08 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NwxZ619003

Next Enclosure Number set to 1

Property[Bank Code] set to [DBB0219] 

Property[Bank Name] set to [Deutsche Bank] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:09:27.154', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-idb09fe3c9c049c8964fcb23c61dda24', 'BANK-2017-8', 'Hong Leong Bank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-8

Uncompressed Record Number set to BANK-2017-000008

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Hong Leong Bank]

Combined Title set to [Hong Leong Bank]

Date Registered set to Mon, 13 Mar 2017 11:09 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to N6S6da2450

Next Enclosure Number set to 1

Property[Bank Code] set to [HLB0224] 

Property[Bank Name] set to [Hong Leong Bank] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:09:59.14', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-e90431d4422b4463b30d8dcf70d4d78e', 'BANK-2017-9', 'HSBC Bank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-9

Uncompressed Record Number set to BANK-2017-000009

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [HSBC Bank]

Combined Title set to [HSBC Bank]

Date Registered set to Mon, 13 Mar 2017 11:09 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to N23Dd78e75

Next Enclosure Number set to 1

Property[Bank Code] set to [HSBC0222] 

Property[Bank Name] set to [HSBC Bank] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:10:27.842', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-ef4c0e2eb45947d2a1d5b46d501c3943', 'BANK-2017-10', 'JPMorgan', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-10

Uncompressed Record Number set to BANK-2017-000010

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [JPMorgan]

Combined Title set to [JPMorgan]

Date Registered set to Mon, 13 Mar 2017 11:10 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NJoX394323

Next Enclosure Number set to 1

Property[Bank Code] set to [JPMC0215] 

Property[Bank Name] set to [JPMorgan] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:10:59.445', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-ca9dbe06eacc4662a1de95dd14c4b3a9', 'BANK-2017-11', 'Maybank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-11

Uncompressed Record Number set to BANK-2017-000011

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Maybank]

Combined Title set to [Maybank]

Date Registered set to Mon, 13 Mar 2017 11:10 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to Nxg0b3a950

Next Enclosure Number set to 1

Property[Bank Code] set to [MBB0227] 

Property[Bank Name] set to [Maybank] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:11:19.125', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-b3d5a4c317534862a9d7b495ef2f59ce', 'BANK-2017-12', 'OCBC Bank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-12

Uncompressed Record Number set to BANK-2017-000012

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [OCBC Bank]

Combined Title set to [OCBC Bank]

Date Registered set to Mon, 13 Mar 2017 11:11 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NNtu59ce27

Next Enclosure Number set to 1

Property[Bank Code] set to [OCBC0229] 

Property[Bank Name] set to [OCBC Bank] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:11:39.317', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-bdede6e0767e402786a2075763dc939a', 'BANK-2017-13', 'Public Bank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-13

Uncompressed Record Number set to BANK-2017-000013

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Public Bank]

Combined Title set to [Public Bank]

Date Registered set to Mon, 13 Mar 2017 11:11 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to N8GW939a85

Next Enclosure Number set to 1

Property[Bank Code] set to [PBB0233] 

Property[Bank Name] set to [Public Bank] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:11:58.887', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-hd3203284c9745ddaf1a2edfb7b00085', 'BANK-2017-14', 'TPAREVENUE', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-14

Uncompressed Record Number set to BANK-2017-000014

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [TPAREVENUE]

Combined Title set to [TPAREVENUE]

Date Registered set to Mon, 13 Mar 2017 11:11 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NTSF008531

Next Enclosure Number set to 1

Property[Bank Code] set to [REV0123] 

Property[Bank Name] set to [TPAREVENUE] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:12:18.498', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-c56ac00fcc2f484d8323d87d3f224fcc', 'BANK-2017-15', 'RHB Bank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-15

Uncompressed Record Number set to BANK-2017-000015

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [RHB Bank]

Combined Title set to [RHB Bank]

Date Registered set to Mon, 13 Mar 2017 11:12 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NeeR4fcc88

Next Enclosure Number set to 1

Property[Bank Code] set to [RHB0218] 

Property[Bank Name] set to [RHB Bank] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:12:39.628', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36-b8c50e69c5544dc9829b7bda93bec482', 'BANK-2017-16', 'Standard Chartered Bank', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to BANK-2017-16

Uncompressed Record Number set to BANK-2017-000016

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Bank Information]

Title set to [Standard Chartered Bank]

Combined Title set to [Standard Chartered Bank]

Date Registered set to Mon, 13 Mar 2017 11:12 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NUnIc48225

Next Enclosure Number set to 1

Property[Bank Code] set to [SCB0214] 

Property[Bank Name] set to [Standard Chartered Bank] 

', '192.168.1.92');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:25:23.068', 'DELETE', 'c22816ad803c47ed83400bc787d06ed4-cf506e58b2f94a5590927b1f71863179', 'MERCHANT-2017-1', 'Ag I Solutions (M) Sdn Bhd', '00000000000000000000000000000000', 'ROOT', 'Record was deleted; Record Number = [MERCHANT-2017-1], Title = [Ag I Solutions (M) Sdn Bhd]

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:29:13.696', 'CREATE', 'eb50047853d6486b8c7f78ad91d4f454-e8c43936e5964fa78934b38a440e1ab8', 'CUST-BANK-14032017-1', 'Bank Account', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to CUST-BANK-14032017-1

Uncompressed Record Number set to CUST-BANK-14032017-000000000000001

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Customer Bank Account]

Title set to [Bank Account]

Combined Title set to [Bank Account]

Date Registered set to Tue, 14 Mar 2017 04:29 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NrD81ab859

Next Enclosure Number set to 1

Property[ID Number] set to [890910147890] 

Property[Customer Name] set to [Michelle] 

Property[Account Number] set to [118904562345] 

Property[Merchant Bank Name] set to Maybank (BANK-2017-11)   

Property[ID Type] set to [New IC Number] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:29:21.857', 'CREATE', 'f2bfeb5852264c5aa67f53f96ac28d39-cd0537ab5e1b4c66bab0eef4ecc054f3', 'CUSTOMER-2017-1', 'Michelle Lim', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to CUSTOMER-2017-1

Uncompressed Record Number set to CUSTOMER-2017-0000000001

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Customer Information]

Title set to [Michelle Lim]

Combined Title set to [Michelle Lim]

Date Registered set to Tue, 14 Mar 2017 04:29 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to Nu9I54f344

Next Enclosure Number set to 1

Property[ID Number] set to [890120146780] 

Property[Customer Bank Account] set to [Bank Account (CUST-BANK-14032017-1),  ] 

Property[Customer Name] set to [Michelle Lim] 

Property[Address] set to [Unit 01-06, Kota Kelansing, Kuala Lumpur, Malaysia] 

Property[Email] set to [michelle@yahoo.com] 

Property[Phone Number] set to [0121234567] 

Property[ID Type] set to [New IC Number] 

Property[Gender] set to [Female] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:29:39.114', 'MODIFY', 'f2bfeb5852264c5aa67f53f96ac28d39-cd0537ab5e1b4c66bab0eef4ecc054f3', 'CUSTOMER-2017-1', 'Michelle Lim', '00000000000000000000000000000000', 'ROOT', 'Date Last Modified changed from NULL to Tue, 14 Mar 2017 04:29 AM +0000

Property[ID Number] changed from [890120146780] to [890910147890] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:29:51.801', 'MODIFY', 'eb50047853d6486b8c7f78ad91d4f454-e8c43936e5964fa78934b38a440e1ab8', 'CUST-BANK-14032017-1', 'Bank Account', '00000000000000000000000000000000', 'ROOT', 'Date Last Modified changed from NULL to Tue, 14 Mar 2017 04:29 AM +0000

Property[Customer Name] changed from [Michelle] to [Michelle Lim] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:30:31.299', 'CREATE', 'eb50047853d6486b8c7f78ad91d4f454-e913beff31964fd4ad77b9e6c7ef64a0', 'CUST-BANK-14032017-2', 'Bank Account', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to CUST-BANK-14032017-2

Uncompressed Record Number set to CUST-BANK-14032017-000000000000002

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Customer Bank Account]

Title set to [Bank Account]

Combined Title set to [Bank Account]

Date Registered set to Tue, 14 Mar 2017 04:30 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NUy764a048

Next Enclosure Number set to 1

Property[ID Number] set to [890910147890] 

Property[Customer Name] set to [Michelle Lim] 

Property[Account Number] set to [123456789012] 

Property[Merchant Bank Name] set to HSBC Bank (BANK-2017-9)   

Property[ID Type] set to [New IC Number] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:30:33.385', 'MODIFY', 'f2bfeb5852264c5aa67f53f96ac28d39-cd0537ab5e1b4c66bab0eef4ecc054f3', 'CUSTOMER-2017-1', 'Michelle Lim', '00000000000000000000000000000000', 'ROOT', 'Date Last Modified changed from Tue, 14 Mar 2017 04:29 AM +0000 to Tue, 14 Mar 2017 04:30 AM +0000

Property[Customer Bank Account] changed from [Bank Account (CUST-BANK-14032017-1),  ] to [Bank Account (CUST-BANK-14032017-1),  Bank Account (CUST-BANK-14032017-2),  ] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:36:13.409', 'MODIFY', 'eb50047853d6486b8c7f78ad91d4f454-e8c43936e5964fa78934b38a440e1ab8', 'CUST-BANK-14032017-1', 'Maybank Account', '00000000000000000000000000000000', 'ROOT', 'Title changed from [Bank Account] to [Maybank Account]

Combined Title changed from [Bank Account] to [Maybank Account]

Date Last Modified changed from Tue, 14 Mar 2017 04:29 AM +0000 to Tue, 14 Mar 2017 04:36 AM +0000

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:36:31.958', 'MODIFY', 'eb50047853d6486b8c7f78ad91d4f454-e913beff31964fd4ad77b9e6c7ef64a0', 'CUST-BANK-14032017-2', 'HSBC Account', '00000000000000000000000000000000', 'ROOT', 'Title changed from [Bank Account] to [HSBC Account]

Combined Title changed from [Bank Account] to [HSBC Account]

Date Last Modified changed from NULL to Tue, 14 Mar 2017 04:36 AM +0000

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:51:02.921', 'CREATE', 'c408fbc0ea084ec19b7ee3f4d94e7711-jd5585e3f0784fc386a35f74bea024f6', 'MERCHANT-ACC-14032017-1', 'HSBC Account', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to MERCHANT-ACC-14032017-1

Uncompressed Record Number set to MERCHANT-ACC-14032017-000000000000001

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Merchant Bank Account]

Title set to [HSBC Account]

Combined Title set to [HSBC Account]

Date Registered set to Tue, 14 Mar 2017 04:51 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to Ne2l24f634

Next Enclosure Number set to 1

Property[Company Name] set to [Ag I Solutions (M) Sdn Bhd] 

Property[Company Registration No] set to [ABCD1234] 

Property[Merchant Account No] set to [123123123123] 

Property[Bank Name] set to HSBC Bank (BANK-2017-9)   

Property[Merchant ID] set to [MI10009000] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:51:45.684', 'CREATE', 'c408fbc0ea084ec19b7ee3f4d94e7711-cf4772bccf3e4f79b512094f596b60e2', 'MERCHANT-ACC-14032017-2', 'RHB Account', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to MERCHANT-ACC-14032017-2

Uncompressed Record Number set to MERCHANT-ACC-14032017-000000000000002

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Merchant Bank Account]

Title set to [RHB Account]

Combined Title set to [RHB Account]

Date Registered set to Tue, 14 Mar 2017 04:51 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NxHq60e250

Next Enclosure Number set to 1

Property[Company Name] set to [Ag I Solutions (M) Sdn Bhd] 

Property[Company Registration No] set to [ABCD1234] 

Property[Merchant Account No] set to [343213567654] 

Property[Bank Name] set to RHB Bank (BANK-2017-15)   

Property[Merchant ID] set to [MI10008000] 

', '211.25.130.238');
INSERT INTO node_event (event_timestamp, event_type, node_uid, node_record_number, node_title, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:51:56.938', 'CREATE', 'c22816ad803c47ed83400bc787d06ed4-cac5e82e2312435a9bc943028f22133a', 'MERCHANT-2017-2', 'Ag I Solutions (M) Sdn Bhd', '00000000000000000000000000000000', 'ROOT', 'Owner set to ROOT

Record Number set to MERCHANT-2017-2

Uncompressed Record Number set to MERCHANT-2017-0000000002

Enclosure Number Increment set to 1

Disposition Status set to ACTIVE (0) 

Record Type name set to [Merchant Information]

Title set to [Ag I Solutions (M) Sdn Bhd]

Combined Title set to [Ag I Solutions (M) Sdn Bhd]

Date Registered set to Tue, 14 Mar 2017 04:51 AM +0000

Creator Name set to ROOT

Creator Username set to root

Assignee Principal set to ROOT 

Is Hybrid set to No

Barcode set to NtIj133a44

Next Enclosure Number set to 1

Property[Contact Person Email] set to [steve@ag-isolutions.com] 

Property[Contact Person Name] set to [Steve] 

Property[Business Fax No] set to [0320901235] 

Property[Company Name] set to [Ag I Solutions (M) Sdn Bhd] 

Property[Business Address] set to [Unit 05-01, The Vertical, Tower A, Bangsar South, KL, Malaysia.] 

Property[Business Description] set to [IT] 

Property[Company Registration No] set to [ABCD1234] 

Property[Home URL] set to [www.ag-isolutions.com] 

Property[Business Phone No] set to [0320901234] 

Property[Contact Person IC No] set to [A128909876] 

Property[Merchant Bank Account] set to [HSBC Account (MERCHANT-ACC-14032017-1),  RHB Account (MERCHANT-ACC-14032017-2),  ] 

Property[Contact Person Phone No] set to [01234567890] 

', '211.25.130.238');


--
-- Data for Name: nodetype_attribute; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000002', 3, 'Email Notes', 0);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000002', 1, 'Email Details', 0);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000002', 6, 'Email Details', 1);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000003', 1, 'Template Details', 1);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000004', 1, 'Template Details', 0);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000005', 3, 'Email Notes', 0);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000005', 1, 'Email Details', 0);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000005', 6, 'Email Details', 1);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000006', 1, 'Email Attachments', 0);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('f0000000000000000000000000000006', 6, 'Email Attachments', 1);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 1, 'General', 0);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('eb50047853d6486b8c7f78ad91d4f454', 1, 'General', 0);
INSERT INTO nodetype_attribute (nodetype_uid, attribute_no, group_name, _order) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711', 1, 'General', 0);


--
-- Data for Name: nodetype_b7bc8b7449614d159ce0869306f04d36; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-c5c7e7e7d62c46a4a6fae91dc22004d9', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-1', NULL, NULL, 0, 'Affin Bank', 'Affin Bank', NULL, '2017-03-13 09:45:20.936', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NnxT04d995', NULL, NULL, NULL, NULL, '2017-03-13 09:45:29.3', NULL, NULL, NULL, 1, 1, 'BANK-2017-000001', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Affin Bank', 'AFFB0123');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-aa4c1ce39d044092a9f9691d178c4351', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-2', NULL, NULL, 0, 'CIMB Bank', 'CIMB Bank', NULL, '2017-03-13 09:45:52.253', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'Nq54435142', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000002', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'CIMB Bank', 'BCBB0235');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-cccab6d0af204c8795d11e13698796b8', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-3', NULL, NULL, 0, 'Bank Islam', 'Bank Islam', NULL, '2017-03-13 10:29:22.704', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NOlC96b832', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000003', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Bank Islam', 'BIMB0340');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-ca31bf19de8b4769a014a9e1d7c4d46d', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-4', NULL, NULL, 0, 'Bank Rakyat', 'Bank Rakyat', NULL, '2017-03-13 10:56:04.653', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'N7RXd46d05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000004', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Bank Rakyat', 'BKR1602');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-h37714a8ad974a8d8977d27bcbf6c52c', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-5', NULL, NULL, 0, 'Bank of America', 'Bank of America', NULL, '2017-03-13 11:08:02.051', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NUhKc52c22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000005', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Bank of America', 'BOFA0207');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-j826cb9658cd41878c369f31af206ae9', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-6', NULL, NULL, 0, 'Citibank', 'Citibank', NULL, '2017-03-13 11:08:32.503', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'N7Rr6ae983', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000006', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Citibank', 'CIT0217');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-e1680dec494a42f3be778ea6bfb86190', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-7', NULL, NULL, 0, 'Deutsche Bank', 'Deutsche Bank', NULL, '2017-03-13 11:08:52.147', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NwxZ619003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000007', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Deutsche Bank', 'DBB0219');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-idb09fe3c9c049c8964fcb23c61dda24', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-8', NULL, NULL, 0, 'Hong Leong Bank', 'Hong Leong Bank', NULL, '2017-03-13 11:09:27.138', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'N6S6da2450', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000008', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Hong Leong Bank', 'HLB0224');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-e90431d4422b4463b30d8dcf70d4d78e', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-9', NULL, NULL, 0, 'HSBC Bank', 'HSBC Bank', NULL, '2017-03-13 11:09:59.123', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'N23Dd78e75', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000009', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'HSBC Bank', 'HSBC0222');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-ef4c0e2eb45947d2a1d5b46d501c3943', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-10', NULL, NULL, 0, 'JPMorgan', 'JPMorgan', NULL, '2017-03-13 11:10:27.823', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NJoX394323', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000010', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'JPMorgan', 'JPMC0215');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-ca9dbe06eacc4662a1de95dd14c4b3a9', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-11', NULL, NULL, 0, 'Maybank', 'Maybank', NULL, '2017-03-13 11:10:59.427', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'Nxg0b3a950', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000011', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Maybank', 'MBB0227');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-b3d5a4c317534862a9d7b495ef2f59ce', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-12', NULL, NULL, 0, 'OCBC Bank', 'OCBC Bank', NULL, '2017-03-13 11:11:19.107', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NNtu59ce27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000012', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'OCBC Bank', 'OCBC0229');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-bdede6e0767e402786a2075763dc939a', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-13', NULL, NULL, 0, 'Public Bank', 'Public Bank', NULL, '2017-03-13 11:11:39.301', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'N8GW939a85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000013', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Public Bank', 'PBB0233');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-hd3203284c9745ddaf1a2edfb7b00085', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-14', NULL, NULL, 0, 'TPAREVENUE', 'TPAREVENUE', NULL, '2017-03-13 11:11:58.87', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NTSF008531', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000014', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'TPAREVENUE', 'REV0123');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-c56ac00fcc2f484d8323d87d3f224fcc', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-15', NULL, NULL, 0, 'RHB Bank', 'RHB Bank', NULL, '2017-03-13 11:12:18.476', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NeeR4fcc88', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000015', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'RHB Bank', 'RHB0218');
INSERT INTO nodetype_b7bc8b7449614d159ce0869306f04d36 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, afd1329c2de2421bbbe5a48f65b56818, b5fb184441d941d6936f00708785f3f3) VALUES ('b7bc8b7449614d159ce0869306f04d36-b8c50e69c5544dc9829b7bda93bec482', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'BANK-2017-16', NULL, NULL, 0, 'Standard Chartered Bank', 'Standard Chartered Bank', NULL, '2017-03-13 11:12:39.612', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NUnIc48225', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'BANK-2017-000016', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Standard Chartered Bank', 'SCB0214');


--
-- Data for Name: nodetype_c22816ad803c47ed83400bc787d06ed4; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO nodetype_c22816ad803c47ed83400bc787d06ed4 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, ha41c373c2f0413cb1458bb886048bb2, f0970f3862f941338e162f34b75e6831, f362b3fe8c934881b0a3ee7e829df929, f3e001ad12ef439b9b7c3d67a6239f10, d2800efb0ed84f738f8dff1b9be7860e, f8fef67bb03c47faa48061fcd1c2f038, a219cee40a3f4ae9be8f695763b78d33, d6376ccdb85c43af8260fb05786d731a, bf65f9219f944e47b00873d7bec3343c, gf1f763b063149df8529223e8b37a24b, ec690c2952ef478ebcc6f25afbc367f2, b6d28a5702d740cdb0f733f97aee88c5) VALUES ('c22816ad803c47ed83400bc787d06ed4-cac5e82e2312435a9bc943028f22133a', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'MERCHANT-2017-2', NULL, NULL, 0, 'Ag I Solutions (M) Sdn Bhd', 'Ag I Solutions (M) Sdn Bhd', NULL, '2017-03-14 04:51:56.917', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NtIj133a44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'MERCHANT-2017-0000000002', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Ag I Solutions (M) Sdn Bhd', 'ABCD1234', 'IT', 'Unit 05-01, The Vertical, Tower A, Bangsar South, KL, Malaysia.', '0320901234', '0320901235', 'www.ag-isolutions.com', 'Steve', '01234567890', 'A128909876', 'steve@ag-isolutions.com', 'b6d28a5702d740cdb0f733f97aee88c5');


--
-- Data for Name: nodetype_c408fbc0ea084ec19b7ee3f4d94e7711; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO nodetype_c408fbc0ea084ec19b7ee3f4d94e7711 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, ha41c373c2f0413cb1458bb886048bb2, f0970f3862f941338e162f34b75e6831, c1fb9f1f82af496cbbfd8f387aefab42, fdc659695c944890b9c1720de461db2e, cead45cc70f2415ca1054f2853a8a100) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711-jd5585e3f0784fc386a35f74bea024f6', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'MERCHANT-ACC-14032017-1', NULL, NULL, 0, 'HSBC Account', 'HSBC Account', NULL, '2017-03-14 04:51:02.904', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'Ne2l24f634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'MERCHANT-ACC-14032017-000000000000001', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Ag I Solutions (M) Sdn Bhd', 'ABCD1234', 'MI10009000', 'b7bc8b7449614d159ce0869306f04d36-e90431d4422b4463b30d8dcf70d4d78e', '123123123123');
INSERT INTO nodetype_c408fbc0ea084ec19b7ee3f4d94e7711 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, ha41c373c2f0413cb1458bb886048bb2, f0970f3862f941338e162f34b75e6831, c1fb9f1f82af496cbbfd8f387aefab42, fdc659695c944890b9c1720de461db2e, cead45cc70f2415ca1054f2853a8a100) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711-cf4772bccf3e4f79b512094f596b60e2', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'MERCHANT-ACC-14032017-2', NULL, NULL, 0, 'RHB Account', 'RHB Account', NULL, '2017-03-14 04:51:45.668', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NxHq60e250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'MERCHANT-ACC-14032017-000000000000002', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Ag I Solutions (M) Sdn Bhd', 'ABCD1234', 'MI10008000', 'b7bc8b7449614d159ce0869306f04d36-c56ac00fcc2f484d8323d87d3f224fcc', '343213567654');


--
-- Data for Name: nodetype_dc8e3bc6f41f4f15aa445184108a680a; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: nodetype_eb50047853d6486b8c7f78ad91d4f454; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO nodetype_eb50047853d6486b8c7f78ad91d4f454 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, fdc659695c944890b9c1720de461db2e, j8e43ac4e85940c6a15e4c35f0a5a7e5, h763e35b6288452895b143ec4bad9d02, c7b15198b7a844d2bbe56fa6116f9018, ac587b9bdb0545d9a4bb872848b12755) VALUES ('eb50047853d6486b8c7f78ad91d4f454-e8c43936e5964fa78934b38a440e1ab8', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'CUST-BANK-14032017-1', NULL, NULL, 0, 'Maybank Account', 'Maybank Account', NULL, '2017-03-14 04:29:13.681', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NrD81ab859', NULL, NULL, NULL, NULL, '2017-03-14 04:36:13.403', NULL, NULL, NULL, 1, 1, 'CUST-BANK-14032017-000000000000001', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'b7bc8b7449614d159ce0869306f04d36-ca9dbe06eacc4662a1de95dd14c4b3a9', '118904562345', 'Michelle Lim', '890910147890', 'New IC Number');
INSERT INTO nodetype_eb50047853d6486b8c7f78ad91d4f454 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, fdc659695c944890b9c1720de461db2e, j8e43ac4e85940c6a15e4c35f0a5a7e5, h763e35b6288452895b143ec4bad9d02, c7b15198b7a844d2bbe56fa6116f9018, ac587b9bdb0545d9a4bb872848b12755) VALUES ('eb50047853d6486b8c7f78ad91d4f454-e913beff31964fd4ad77b9e6c7ef64a0', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'CUST-BANK-14032017-2', NULL, NULL, 0, 'HSBC Account', 'HSBC Account', NULL, '2017-03-14 04:30:31.284', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'NUy764a048', NULL, NULL, NULL, NULL, '2017-03-14 04:36:31.953', NULL, NULL, NULL, 1, 1, 'CUST-BANK-14032017-000000000000002', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'b7bc8b7449614d159ce0869306f04d36-e90431d4422b4463b30d8dcf70d4d78e', '123456789012', 'Michelle Lim', '890910147890', 'New IC Number');


--
-- Data for Name: nodetype_f0000000000000000000000000000000; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: nodetype_f0000000000000000000000000000001; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: nodetype_f0000000000000000000000000000002; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: nodetype_f0000000000000000000000000000003; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: nodetype_f0000000000000000000000000000004; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: nodetype_f0000000000000000000000000000005; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: nodetype_f0000000000000000000000000000006; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: nodetype_f0000000000000000000000000000007; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: nodetype_f2bfeb5852264c5aa67f53f96ac28d39; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO nodetype_f2bfeb5852264c5aa67f53f96ac28d39 (uid, acl_uid, owner_uid, classification_uid, secondary_classification_uid, tertiary_classification_uid, record_number, retention_schedule_uid, hold_uid, disposition_status, title, combined_title, description, date_registered, creator_name, creator_username, notes, home_uid, assignee_uid, is_finalized, is_hybrid, date_finalized, barcode, external_barcode, external_uid, integrity_check, security_level_uid, date_last_modified, date_last_modified_of_contents, client_uid, date_closed, next_enclosure_number, enclosure_number_increment, uncompressed_record_number, security_based_on_container, bypass_referenced_acls, opened_temporarily, date_created, author, batch_id, date_archived, date_made_inactive, date_of_last_enclosure, date_enclosed, record_class, container_record_number, classification_full_number, secondary_classification_full_number, tertiary_classification_full_number, assignee_name, home_name, owner_name, retention_schedule_number, security_level_number, client_name, is_container_removed_on_ret_trig, is_set_home_on_container_ret_trig, retention_schedule_new_home, is_misfiled, master_uid, hybrid_remarks, date_last_modified_of_security_level, is_declassify, is_imported, enforce_single_creation_in_a_workflow, check_in_as_new_version, check_in_as_override_previous_content, is_declassify_alias, is_auto_update_security_level, is_auto_update_security_level_on_particular_date, security_level_trigger_date, is_update_security_level_on_triggered_event, security_level_triggered_event, security_level_triggered_event_type, security_level_triggered_event_duration, security_level_triggered_event_property, auto_update_security_level_id, ae6c83a22dd849ebba2cfddb45a32a47, h763e35b6288452895b143ec4bad9d02, ac587b9bdb0545d9a4bb872848b12755, c7b15198b7a844d2bbe56fa6116f9018, ibdaf89d09234fef9826c0f2a81ef088, e12bc6ec5ab144aab50b592c046de9f5, f5da945a323c4488b407142013d47646, e797f68ea14741bc85f1b7813cd0d875) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39-cd0537ab5e1b4c66bab0eef4ecc054f3', NULL, '00000000000000000000000000000000', NULL, NULL, NULL, 'CUSTOMER-2017-1', NULL, NULL, 0, 'Michelle Lim', 'Michelle Lim', NULL, '2017-03-14 04:29:21.838', 'ROOT', 'root', NULL, NULL, '00000000000000000000000000000000', 0, 0, NULL, 'Nu9I54f344', NULL, NULL, NULL, NULL, '2017-03-14 04:30:33.378', NULL, NULL, NULL, 1, 1, 'CUSTOMER-2017-0000000001', 0, 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ROOT', NULL, 'ROOT', NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 1, NULL, NULL, 'Female', 'Michelle Lim', 'New IC Number', '890910147890', 'michelle@yahoo.com', 'Unit 01-06, Kota Kelansing, Kuala Lumpur, Malaysia', '0121234567', 'e797f68ea14741bc85f1b7813cd0d875');


--
-- Data for Name: nodetype_property; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000001', 'a0000000000000000000000000000001', '$.EBIKKO.PROP.USER.PHOTO', 0, 0, NULL, NULL, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000000', 'a0000000000000000000000000000000', '$.EBIKKO.PROP.FAVS.NODES', 0, 0, NULL, NULL, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000002', 'a0000000000000000000000000000002', 'Email From', 0, 0, 'Email Details', 2, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000002', 'a0000000000000000000000000000003', 'Email Sender', 0, 0, 'Email Details', 3, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000002', 'a0000000000000000000000000000004', 'Email To', 0, 0, 'Email Details', 4, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000002', 'a0000000000000000000000000000005', 'Email Cc', 0, 0, 'Email Details', 5, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000002', 'a0000000000000000000000000000006', 'Email Bcc', 0, 0, 'Email Details', 6, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000002', 'a0000000000000000000000000000007', 'Email Date Sent', 0, 0, 'Email Details', 7, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000002', 'a0000000000000000000000000000009', 'Email Timestamp Sent', 0, 0, 'Email Details', 8, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000002', 'a0000000000000000000000000000010', 'Email Timestamp Received', 0, 0, 'Email Details', 9, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000003', 'a0000000000000000000000000000008', 'Template Type', 1, 0, 'Template Details', 0, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000005', 'a0000000000000000000000000000002', 'Email From', 0, 0, 'Email Details', 2, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000005', 'a0000000000000000000000000000003', 'Email Sender', 0, 0, 'Email Details', 3, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000005', 'a0000000000000000000000000000004', 'Email To', 0, 0, 'Email Details', 4, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000005', 'a0000000000000000000000000000005', 'Email Cc', 0, 0, 'Email Details', 5, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000005', 'a0000000000000000000000000000006', 'Email Bcc', 0, 0, 'Email Details', 6, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000005', 'a0000000000000000000000000000007', 'Email Date Sent', 0, 0, 'Email Details', 7, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000005', 'a0000000000000000000000000000011', 'Email Messsage', 0, 0, 'Email Details', 8, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000005', 'a0000000000000000000000000000012', 'Email Attachments', 0, 0, 'Email Details', 9, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000000', 'a0000000000000000000000000000013', '$.EBIKKO.PROP.FAVS.FOLDER.NODES', 0, 0, NULL, NULL, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000007', 'a0000000000000000000000000000014', '$.EBIKKO.PROP.FAVS.CLASSIFICATIONS', 0, 0, NULL, NULL, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000007', 'a0000000000000000000000000000013', '$.EBIKKO.PROP.FAVS.FOLDER.NODES', 0, 0, NULL, NULL, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f0000000000000000000000000000007', 'a0000000000000000000000000000000', '$.EBIKKO.PROP.FAVS.NODES', 0, 0, NULL, NULL, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'a4d54a1736fa45e796aa89ff04b83f55', '', 0, 0, 'General', 1, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'ibdaf89d09234fef9826c0f2a81ef088', '', 0, 0, 'General', 2, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'f5da945a323c4488b407142013d47646', '', 0, 0, 'General', 3, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'ac587b9bdb0545d9a4bb872848b12755', '', 0, 0, 'General', 4, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'c7b15198b7a844d2bbe56fa6116f9018', '', 0, 0, 'General', 5, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'b1b99355d0834804a01b7a69fc2421bd', '', 0, 0, 'General', 6, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'hea71551e76346ad8f8e87f13911c1b3', '', 0, 0, 'General', 7, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'c6bc629517e44c6f982e25f8daf5bbd6', '', 0, 0, 'General', 8, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'f9ce8fde98e547699ff79602b2dce34f', '', 0, 0, 'General', 9, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'j72d25f47afb42ea84fd364233a29430', '', 0, 0, 'General', 10, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'e797f68ea14741bc85f1b7813cd0d875', '', 0, 0, 'General', 11, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'h763e35b6288452895b143ec4bad9d02', '', 0, 0, 'GENERAL INFORMATION', 0, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'ae6c83a22dd849ebba2cfddb45a32a47', '', 0, 0, 'GENERAL INFORMATION', 1, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'ac587b9bdb0545d9a4bb872848b12755', '', 0, 0, 'GENERAL INFORMATION', 2, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'c7b15198b7a844d2bbe56fa6116f9018', '', 0, 0, 'GENERAL INFORMATION', 3, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'ibdaf89d09234fef9826c0f2a81ef088', '', 0, 0, 'GENERAL INFORMATION', 4, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'e12bc6ec5ab144aab50b592c046de9f5', '', 0, 0, 'GENERAL INFORMATION', 5, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'f5da945a323c4488b407142013d47646', '', 0, 0, 'GENERAL INFORMATION', 6, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'e797f68ea14741bc85f1b7813cd0d875', '', 0, 0, 'GENERAL INFORMATION', 7, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('b7bc8b7449614d159ce0869306f04d36', 'b5fb184441d941d6936f00708785f3f3', '', 0, 0, 'General', 0, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('b7bc8b7449614d159ce0869306f04d36', 'afd1329c2de2421bbbe5a48f65b56818', '', 0, 0, 'General', 1, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('eb50047853d6486b8c7f78ad91d4f454', 'h763e35b6288452895b143ec4bad9d02', '', 0, 0, 'General', 1, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('eb50047853d6486b8c7f78ad91d4f454', 'ac587b9bdb0545d9a4bb872848b12755', '', 0, 0, 'General', 2, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('eb50047853d6486b8c7f78ad91d4f454', 'c7b15198b7a844d2bbe56fa6116f9018', '', 0, 0, 'General', 3, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('eb50047853d6486b8c7f78ad91d4f454', 'fdc659695c944890b9c1720de461db2e', '', 0, 0, 'General', 4, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('eb50047853d6486b8c7f78ad91d4f454', 'j8e43ac4e85940c6a15e4c35f0a5a7e5', '', 0, 0, 'General', 5, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711', 'ha41c373c2f0413cb1458bb886048bb2', '', 0, 0, 'General', 1, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711', 'f0970f3862f941338e162f34b75e6831', '', 0, 0, 'General', 2, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711', 'c1fb9f1f82af496cbbfd8f387aefab42', '', 0, 0, 'General', 3, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711', 'fdc659695c944890b9c1720de461db2e', '', 0, 0, 'General', 4, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711', 'cead45cc70f2415ca1054f2853a8a100', '', 0, 0, 'General', 5, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'ha41c373c2f0413cb1458bb886048bb2', '', 0, 0, 'GENERAL INFORMATION', 0, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'f0970f3862f941338e162f34b75e6831', '', 0, 0, 'GENERAL INFORMATION', 1, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'f362b3fe8c934881b0a3ee7e829df929', '', 0, 0, 'GENERAL INFORMATION', 2, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'f3e001ad12ef439b9b7c3d67a6239f10', '', 0, 0, 'GENERAL INFORMATION', 3, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'd2800efb0ed84f738f8dff1b9be7860e', '', 0, 0, 'GENERAL INFORMATION', 4, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'f8fef67bb03c47faa48061fcd1c2f038', '', 0, 0, 'GENERAL INFORMATION', 5, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'a219cee40a3f4ae9be8f695763b78d33', '', 0, 0, 'GENERAL INFORMATION', 6, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'd6376ccdb85c43af8260fb05786d731a', '', 0, 0, 'GENERAL INFORMATION', 7, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'bf65f9219f944e47b00873d7bec3343c', '', 0, 0, 'GENERAL INFORMATION', 8, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'gf1f763b063149df8529223e8b37a24b', '', 0, 0, 'GENERAL INFORMATION', 9, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'ec690c2952ef478ebcc6f25afbc367f2', '', 0, 0, 'GENERAL INFORMATION', 10, NULL);
INSERT INTO nodetype_property (nodetype_uid, property_uid, alias, is_mandatory, is_readonly, property_group_name, property_order, default_value) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'b6d28a5702d740cdb0f733f97aee88c5', '', 0, 0, 'GENERAL INFORMATION', 11, NULL);


--
-- Data for Name: object_event; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 07:03:28.516', 'UPDATE', '00000000000000000000000000000000', 2, 'ROOT', '00000000000000000000000000000000', 'ROOT', 'User Preferences set to [{"formattedCols_recListing":[1,4,10,4.1],"formattedCols_viewPane":[1,4,10,4.1],"formattedCols_browseRecs":[1,4,10,4.1],"formattedCols_recListing_width":[150,150,150,150],"formattedCols_browseRecs_width":[150,150,150,150],"defLang":"en_US","enableClassificationPaging":"true","defTimeZoneContinent":"UTC","defTimeZoneRegion":"UTC","defTimeZoneId":"UTC","defMode":"","defProcessMode":"Default","loginMessage":"","pageSize":"20","enableLookupDropDown":"1","classificationExpandOnDoubleClick":"2","calendarWeekendSetting":"1","enableEbikkoMMHelpMenu":"1","enableEbikkoMMTitle":"Ebikko MeetingManager","enableEbikkoMMNotificationAutoPopulate":"1","repoAuthMethod":"database","esignUseGuardTime":"0","defSessionTimeOut":1800000,"minQuickSearchChar":3,"ddmsCustomizeMenu":"","ddmsJabatanName":"null","emailCatalogMsg":"","lampiranId":"a0000000000000000000000000000012","recordNotesUserStampAppend":"1","recordNotesUserStampShow":"2","menuUpdateAttendance":"2","propertyStringMaxValue":"255","isShowWarningForCombinedTitleInClassificationForm":true,"isHideRelevanceColumn":false,"isSearchDefaultFilter":true,"expandFirstClassication":false,"uploadScanPath":"/NetApps/ebikko-data/mdd/temp/tempdir","username":"","password":"","createLink":false,"invalidFileType":"exe,bat","DragAndDropZoneMaximumAttachmentUpload":"10","emailClient":true,"containerBrowseType":"","emailClientServerPath":"","extCallTimeout":"120000","getAllFavouritesChildMenu":[],"isSecureShareCCOptional":true,"useHtml5Viewer":"false","usePdfViewer":"false","expandTopLevelNodesIntoNewTab":"false","repoId":"mdd","repoDomain":"","ebikkoMMDashboardColor":"#8FBC8F","ebikkoMMthemePrimary":"red","ebikkoMMthemePrimaryHue":"500","ebikkoMMthemeAccent":"orange","ebikkoMMthemeAccentHue":"800","ebikkoMMcssLocation":"","ebikkoMMhelpManualUrl":"http://211.25.130.238:80/meetingmanager-help/index.html","nodeTypeForCopy":"Meeting Invitation"}]', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 07:06:38.941', 'UPDATE', '00000000000000000000000000000000', 2, 'ROOT', '00000000000000000000000000000000', 'ROOT', 'User Preferences set to [{"formattedCols_recListing":[1,4,10,4.1],"formattedCols_viewPane":[1,4,10,4.1],"formattedCols_browseRecs":[1,4,10,4.1],"formattedCols_recListing_width":[150,150,150,150],"formattedCols_browseRecs_width":[150,150,150,150],"defLang":"en_US","enableClassificationPaging":"true","defTimeZoneId":"UTC","defTimeZoneContinent":"UTC","defTimeZoneRegion":"UTC","defMode":"Advanced","defProcessMode":"Default","defSessionTimeOut":1800000,"username":"","password":"","createLink":false}]', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:21:37.984', 'CREATE', 'g20eed9e621a489e9bbd19390993d5dc', 16, 'Merchant Code', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant Code] 
 
Type set to [String] 
 
Length set to [20] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:21:53.555', 'CREATE', 'd298f339dcb74ec3bdcc28071d0cf5fe', 16, 'Merchant Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant Name] 
 
Type set to [String] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:28:26.452', 'DELETE', 'g20eed9e621a489e9bbd19390993d5dc', 16, 'Merchant Code', '00000000000000000000000000000000', 'ROOT', 'Property was deleted; Name = [Merchant Code] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:28:29.189', 'DELETE', 'd298f339dcb74ec3bdcc28071d0cf5fe', 16, 'Merchant Name', '00000000000000000000000000000000', 'ROOT', 'Property was deleted; Name = [Merchant Name] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:29:28.241', 'CREATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant] 
 
Description set to [] 
 
Store set to [DEFAULT_STORE] 
 
Is Apply Record Acl Filter set to [Yes] 
 
Level set to [4] 
 
Record Numbering Method set to [Using a Numbering Pattern] 
 
Is Reset Record Number At Year End set to [Yes] 
 
Next Record Number set to [0] 
 
Record Number Pattern set to [MERCHANT-YYYY-##########] 
 
Is Metadata Text Indexed set to [Yes] 
 
Is Content Text Indexed set to [Yes] 
 
Is Can Attach Content set to [Yes] 
 
Auto Exec Script set to [  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

] 
 
Is Copy Content Template On Record Create set to [Yes] 
 
Activity Name set to [] 
 
Conversion Format set to [] 
 
Record Event Settings: [CREATE] Enabled. 
 
Record Event Settings: [DELETE] Enabled. 
 
Record Event Settings: [DOWNLOAD] Enabled. 
 
Record Event Settings: [EXPORT] Enabled. 
 
Record Event Settings: [MODIFY] Enabled. 
 
Record Event Settings: [VIEW] Enabled. 
 
Form set to[General(Title)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:29:39.928', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [0] to [1] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:30:25.307', 'CREATE', 'ha41c373c2f0413cb1458bb886048bb2', 16, 'Company Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Company Name] 
 
Type set to [String] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:31:06.015', 'CREATE', 'f0970f3862f941338e162f34b75e6831', 16, 'Company Registration No', '00000000000000000000000000000000', 'ROOT', 'Name set to [Company Registration No] 
 
Type set to [String] 
 
Length set to [20] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:31:29.592', 'CREATE', 'f362b3fe8c934881b0a3ee7e829df929', 16, 'Business Description', '00000000000000000000000000000000', 'ROOT', 'Name set to [Business Description] 
 
Type set to [Text] 
 
Length set to [0] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:32:09.212', 'CREATE', 'f3e001ad12ef439b9b7c3d67a6239f10', 16, 'Business Address', '00000000000000000000000000000000', 'ROOT', 'Name set to [Business Address] 
 
Type set to [Text] 
 
Length set to [0] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:32:42.164', 'CREATE', 'd2800efb0ed84f738f8dff1b9be7860e', 16, 'Business Phone No', '00000000000000000000000000000000', 'ROOT', 'Name set to [Business Phone No] 
 
Type set to [String] 
 
Length set to [15] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:33:01.313', 'CREATE', 'f8fef67bb03c47faa48061fcd1c2f038', 16, 'Business Fax No', '00000000000000000000000000000000', 'ROOT', 'Name set to [Business Fax No] 
 
Type set to [String] 
 
Length set to [15] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:33:23.548', 'CREATE', 'a219cee40a3f4ae9be8f695763b78d33', 16, 'Home URL', '00000000000000000000000000000000', 'ROOT', 'Name set to [Home URL] 
 
Type set to [String] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:33:55.613', 'CREATE', 'd6376ccdb85c43af8260fb05786d731a', 16, 'Contact Person Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Contact Person Name] 
 
Type set to [String] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:34:26.272', 'CREATE', 'bf65f9219f944e47b00873d7bec3343c', 16, 'Contact Person Phone No', '00000000000000000000000000000000', 'ROOT', 'Name set to [Contact Person Phone No] 
 
Type set to [String] 
 
Length set to [15] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:35:06.433', 'CREATE', 'gf1f763b063149df8529223e8b37a24b', 16, 'Contact Person IC No', '00000000000000000000000000000000', 'ROOT', 'Name set to [Contact Person IC No] 
 
Type set to [String] 
 
Length set to [15] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:35:30.891', 'CREATE', 'ec690c2952ef478ebcc6f25afbc367f2', 16, 'Contact Person Email', '00000000000000000000000000000000', 'ROOT', 'Name set to [Contact Person Email] 
 
Type set to [String] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:45:26.387', 'CREATE', 'acf7d22cb63b438b901e615391d87a3d', 13, 'Merchant Bank Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant Bank Name] 
 
Description set to [] 
 
Lookup Items set to [(Code=AFFB0123, Name=Affin Bank, Description=); (Code=BCBB0235, Name=CIMB Bank, Description=); (Code=BIMB0340, Name=Bank Islam, Description=); (Code=BKR1602, Name=Bank Rakyat, Description=); (Code=BOFA0207, Name=Bank of America, Description=); (Code=CIT0217, Name=Citibank, Description=); (Code=DBB0219, Name=Deutsche Bank, Description=); (Code=HLB0224, Name=Hong Leong Bank, Description=); (Code=HSBC0222, Name=HSBC Bank, Description=); (Code=JPMC0215, Name=JPMorgan, Description=); (Code=MBB0227, Name=Maybank, Description=); (Code=OCBC0229, Name=OCBC Bank, Description=); (Code=PBB0233, Name=Public Bank, Description=); (Code=REV0123, Name=TPAREVENUE, Description=); (Code=RHB0218, Name=RHB Bank, Description=); (Code=SCB0214, Name=Standard Chartered Bank, Description=)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:45:30.971', 'CREATE', 'a8e79eb97e6848dcb39771e68e642100', 16, 'Merchant Bank Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant Bank Name] 
 
Type set to [String] 
 
Length set to [100] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
Using Lookup Set set to [Yes] 
 
Lookup Set set to [Merchant Bank Name] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:46:08.018', 'CREATE', 'cead45cc70f2415ca1054f2853a8a100', 16, 'Merchant Account No', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant Account No] 
 
Type set to [String] 
 
Length set to [20] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:47:25.156', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant', '00000000000000000000000000000000', 'ROOT', 'Property[Company Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Company Registration No(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Business Description(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Business Address(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Business Phone No(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Business Fax No(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Home URL(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Contact Person Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Contact Person Phone No(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Contact Person IC No(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Contact Person Email(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Merchant Bank Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Merchant Account No(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [General(Title)] to [GENERAL INFORMATION(Title, Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email, Merchant Bank Name, Merchant Account No)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:51:41.308', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant', '00000000000000000000000000000000', 'ROOT', 'Icon has changed 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:52:34.032', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant', '00000000000000000000000000000000', 'ROOT', 'Icon has changed 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 08:55:33.246', 'CREATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer', '00000000000000000000000000000000', 'ROOT', 'Name set to [Customer] 
 
Description set to [] 
 
Store set to [DEFAULT_STORE] 
 
Is Apply Record Acl Filter set to [Yes] 
 
Level set to [4] 
 
Record Numbering Method set to [Using a Numbering Pattern] 
 
Is Reset Record Number At Year End set to [Yes] 
 
Record Number Pattern set to [CUSTOMER-YYYY-##########] 
 
Is Metadata Text Indexed set to [Yes] 
 
Is Content Text Indexed set to [Yes] 
 
Is Can Attach Content set to [Yes] 
 
Auto Exec Script set to [  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

] 
 
Is Copy Content Template On Record Create set to [Yes] 
 
Activity Name set to [] 
 
Conversion Format set to [] 
 
Record Event Settings: [CREATE] Enabled. 
 
Record Event Settings: [DELETE] Enabled. 
 
Record Event Settings: [DOWNLOAD] Enabled. 
 
Record Event Settings: [EXPORT] Enabled. 
 
Record Event Settings: [MODIFY] Enabled. 
 
Record Event Settings: [VIEW] Enabled. 
 
Form set to[General(Title)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:09:07.038', 'CREATE', 'a9b72f76dfa94af88bc933fe99695b7f', 13, 'Gender', '00000000000000000000000000000000', 'ROOT', 'Name set to [Gender] 
 
Description set to [] 
 
Lookup Items set to [(Code=F, Name=Female, Description=); (Code=M, Name=Male, Description=)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:09:10.376', 'CREATE', 'ae6c83a22dd849ebba2cfddb45a32a47', 16, 'Gender', '00000000000000000000000000000000', 'ROOT', 'Name set to [Gender] 
 
Type set to [String] 
 
Length set to [100] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
Using Lookup Set set to [Yes] 
 
Lookup Set set to [Gender] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:09:26.719', 'CREATE', 'h763e35b6288452895b143ec4bad9d02', 16, 'Customer Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Customer Name] 
 
Type set to [String] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:11:42.781', 'CREATE', 'f6cc79d5305f4e65a520b89146b5dbee', 13, 'ID Type', '00000000000000000000000000000000', 'ROOT', 'Name set to [ID Type] 
 
Description set to [] 
 
Lookup Items set to [(Code=01, Name=New IC Number, Description=); (Code=02, Name=Old IC Number, Description=); (Code=03, Name=Passport Number, Description=); (Code=04, Name=Business Registration Number, Description=); (Code=05, Name=Others, Description=)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:11:48.433', 'CREATE', 'ac587b9bdb0545d9a4bb872848b12755', 16, 'ID Type', '00000000000000000000000000000000', 'ROOT', 'Name set to [ID Type] 
 
Type set to [String] 
 
Length set to [100] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
Using Lookup Set set to [Yes] 
 
Lookup Set set to [ID Type] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:12:07.121', 'CREATE', 'c7b15198b7a844d2bbe56fa6116f9018', 16, 'ID Number', '00000000000000000000000000000000', 'ROOT', 'Name set to [ID Number] 
 
Type set to [String] 
 
Length set to [15] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:12:35.296', 'CREATE', 'ibdaf89d09234fef9826c0f2a81ef088', 16, 'Email', '00000000000000000000000000000000', 'ROOT', 'Name set to [Email] 
 
Type set to [String] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:12:48.194', 'CREATE', 'e12bc6ec5ab144aab50b592c046de9f5', 16, 'Address', '00000000000000000000000000000000', 'ROOT', 'Name set to [Address] 
 
Type set to [Text] 
 
Length set to [0] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:13:16.923', 'CREATE', 'f5da945a323c4488b407142013d47646', 16, 'Phone Number', '00000000000000000000000000000000', 'ROOT', 'Name set to [Phone Number] 
 
Type set to [String] 
 
Length set to [15] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:14:09.243', 'CREATE', 'b4cf09e3151e4018b5ca1b047ff62fc8', 16, 'Bank Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Bank Name] 
 
Type set to [String] 
 
Length set to [100] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
Using Lookup Set set to [Yes] 
 
Lookup Set set to [Merchant Bank Name] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:14:33.134', 'CREATE', 'j8e43ac4e85940c6a15e4c35f0a5a7e5', 16, 'Account Number', '00000000000000000000000000000000', 'ROOT', 'Name set to [Account Number] 
 
Type set to [String] 
 
Length set to [20] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:29:22.715', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [3] to [4] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:00:44.648', 'CREATE', 'j72d25f47afb42ea84fd364233a29430', 16, 'Reference Number', '00000000000000000000000000000000', 'ROOT', 'Name set to [Reference Number] 
 
Type set to [String] 
 
Length set to [50] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:15:25.061', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer', '00000000000000000000000000000000', 'ROOT', 'Property[Gender(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Customer Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[ID Type(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[ID Number(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Email(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Address(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Phone Number(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Bank Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Account Number(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [General(Title)] to [GENERAL INFORMATION(Title, Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Bank Name, Account Number)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:17:51.075', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer', '00000000000000000000000000000000', 'ROOT', 'Icon has changed 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:32:17.475', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Name changed from [Customer] to [Customer Information] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:32:28.298', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Name changed from [Merchant] to [Merchant Information] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:33:07.662', 'CREATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Name set to [Bank Information] 
 
Description set to [] 
 
Is Apply Record Acl Filter set to [Yes] 
 
Level set to [4] 
 
Record Numbering Method set to [Using a Numbering Pattern] 
 
Is Reset Record Number At Year End set to [Yes] 
 
Record Number Pattern set to [BANK-YYYY-######] 
 
Auto Exec Script set to [  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

] 
 
Is Copy Content Template On Record Create set to [Yes] 
 
Activity Name set to [] 
 
Conversion Format set to [] 
 
Record Event Settings: [CREATE] Enabled. 
 
Record Event Settings: [DELETE] Enabled. 
 
Record Event Settings: [DOWNLOAD] Enabled. 
 
Record Event Settings: [EXPORT] Enabled. 
 
Record Event Settings: [MODIFY] Enabled. 
 
Record Event Settings: [VIEW] Enabled. 
 
Form set to[General(Title)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:34:45.222', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Icon has changed 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:35:03.925', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Store changed from [NULL] to [DEFAULT_STORE] 
 
Is Metadata Text Indexed changed from [No] to [Yes] 
 
Is Content Text Indexed changed from [No] to [Yes] 
 
Is Can Attach Content changed from [No] to [Yes] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:36:12.436', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Property[Bank Name] removed from the Record Type. 
 
Form changed from [GENERAL INFORMATION(Title, Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Bank Name, Account Number)] to [GENERAL INFORMATION(Title, Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Account Number)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:36:37.636', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Property[Merchant Bank Name] removed from the Record Type. 
 
Form changed from [GENERAL INFORMATION(Title, Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email, Merchant Bank Name, Merchant Account No)] to [GENERAL INFORMATION(Title, Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email, Merchant Account No)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:36:52.78', 'DELETE', 'b4cf09e3151e4018b5ca1b047ff62fc8', 16, 'Bank Name', '00000000000000000000000000000000', 'ROOT', 'Property was deleted; Name = [Bank Name] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:36:58.836', 'DELETE', 'a8e79eb97e6848dcb39771e68e642100', 16, 'Merchant Bank Name', '00000000000000000000000000000000', 'ROOT', 'Property was deleted; Name = [Merchant Bank Name] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:37:15.909', 'CREATE', 'afd1329c2de2421bbbe5a48f65b56818', 16, 'Bank Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Bank Name] 
 
Type set to [String] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:37:32.399', 'CREATE', 'b5fb184441d941d6936f00708785f3f3', 16, 'Bank Code', '00000000000000000000000000000000', 'ROOT', 'Name set to [Bank Code] 
 
Type set to [String] 
 
Length set to [10] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:37:43.697', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Property[Bank Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Bank Code(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [General(Title)] to [General(Title, Bank Name, Bank Code)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:38:27.234', 'CREATE', 'fb976239d6cb41ea8eb79027e90faf0c', 16, 'Customer Bank Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Customer Bank Name] 
 
Type set to [Record] 
 
Length set to [0] 
 
Ref Record Type set to [Bank Information] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Lookup] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:38:48.167', 'CREATE', 'fdc659695c944890b9c1720de461db2e', 16, 'Merchant Bank Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant Bank Name] 
 
Type set to [Record] 
 
Length set to [0] 
 
Ref Record Type set to [Bank Information] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Lookup] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:39:14.14', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Property[Customer Bank Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [GENERAL INFORMATION(Title, Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Account Number)] to [GENERAL INFORMATION(Title, Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Customer Bank Name, Account Number)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:29:46.488', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Form changed from [GENERAL INFORMATION(Title, Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Customer Bank Name, Account Number)] to [GENERAL INFORMATION(Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Customer Bank Name, Account Number)] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:39:37.048', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Property[Merchant Bank Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [GENERAL INFORMATION(Title, Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email, Merchant Account No)] to [GENERAL INFORMATION(Title, Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email, Merchant Bank Name, Merchant Account No)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:43:32.383', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Auto Exec Script changed from [  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

] to [importPackage(Packages.ebikko);
importPackage(Packages.ebikko.filter);

  function preSave(node, isNewRecord) {
  
  var session = node.getSession();
  var bankName = node.getValue(''Bank Name'');
  node.setTitle(bankName);

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {
	if(node.getRecordNumber() == null || node.getRecordNumber() == "")
	{ 
			var session = node.getSession();
        	node.setTitle(''Bank Information'');
        	
        	       	
    }
 }

] 
 
Is Apply Auto Exec Scripting changed from [No] to [Yes] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:45:20.949', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [1] to [2] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:45:52.265', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [2] to [3] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:48:49.319', 'CREATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Name set to [List of Banks] 
 
Description set to [] 
 
Owner set to [ROOT] 
 
Query set to [{"query":{"op":"","lhs":"10","rhs":"2010-03-13T00:00:00","rhs2":"2050-03-13T23:59:59"},"filters":["b7bc8b7449614d159ce0869306f04d36"],"sort_orders":[{"1":"ASC"}]}] 
 
ACL set to [ROOT(Use, See, Change, Delete, Give Access)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:48:51.328', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:49:12.474', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:50:11.838', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'ACL changed from [ROOT(Use, See, Change, Delete, Give Access)] to [] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:50:13.467', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:50:23.188', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:57:52.071', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:58:28.627', 'UPDATE', '00000000000000000000000000000000', 2, 'ROOT', '00000000000000000000000000000000', 'ROOT', 'User Preferences set to [{"formattedCols_recListing":[1,"afd1329c2de2421bbbe5a48f65b56818","b5fb184441d941d6936f00708785f3f3",4],"formattedCols_viewPane":[1,4,10,4.1],"formattedCols_browseRecs":[1,4,10,4.1],"formattedCols_recListing_width":[150,150,150,150],"formattedCols_browseRecs_width":[150,150,150,150],"defLang":"en_US","enableClassificationPaging":"true","defTimeZoneId":"UTC","defTimeZoneContinent":"UTC","defTimeZoneRegion":"UTC","defMode":"Advanced","defProcessMode":"Default","defSessionTimeOut":1800000,"username":"","password":"","createLink":false}]', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:58:28.939', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:58:54.665', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 09:59:16.733', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:00:26.681', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:09:30.164', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:10:11.448', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:10:54.057', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:25:58.019', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Auto Exec Script changed from [  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

] to [importPackage(Packages.ebikko);
importPackage(Packages.ebikko.filter);

  function preSave(node, isNewRecord) {
  
  var session = node.getSession();
  var custName = node.getValue(''Customer Name'');
  node.setTitle(custName);

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {
	if(node.getRecordNumber() == null || node.getRecordNumber() == "")
	{ 
			var session = node.getSession();
        	node.setTitle(''Customer Information'');
        	
        	       	
    }
 }

] 
 
Is Apply Auto Exec Scripting changed from [No] to [Yes] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:27:24.16', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Auto Exec Script changed from [  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

] to [importPackage(Packages.ebikko);
importPackage(Packages.ebikko.filter);

  function preSave(node, isNewRecord) {
  
  var session = node.getSession();
  var comName = node.getValue(''Company Name'');
  node.setTitle(comName);

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {
	if(node.getRecordNumber() == null || node.getRecordNumber() == "")
	{ 
			var session = node.getSession();
        	node.setTitle(''Merchant Information'');
        	
        	       	
    }
 }

] 
 
Is Apply Auto Exec Scripting changed from [No] to [Yes] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:28:14.576', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Form changed from [General(Title, Bank Name, Bank Code)] to [General(Bank Name, Bank Code)] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:29:55.788', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Form changed from [GENERAL INFORMATION(Title, Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email, Merchant Bank Name, Merchant Account No)] to [GENERAL INFORMATION(Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email, Merchant Bank Name, Merchant Account No)] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:31:22.826', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [1] to [2] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:32:00.827', 'UPDATE', '00000000000000000000000000000000', 2, 'ROOT', '00000000000000000000000000000000', 'ROOT', 'User Preferences set to [{"formattedCols_recListing":[1,10,4],"formattedCols_viewPane":[1,4,10,4.1],"formattedCols_browseRecs":[1,4,10,4.1],"formattedCols_recListing_width":[150,150,150],"formattedCols_browseRecs_width":[150,150,150,150],"defLang":"en_US","enableClassificationPaging":"true","defTimeZoneId":"UTC","defTimeZoneContinent":"UTC","defTimeZoneRegion":"UTC","defMode":"Advanced","defProcessMode":"Default","defSessionTimeOut":1800000,"username":"","password":"","createLink":false}]', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:32:41.144', 'UPDATE', '00000000000000000000000000000000', 2, 'ROOT', '00000000000000000000000000000000', 'ROOT', 'User Preferences set to [{"formattedCols_recListing":[1,10,4,4.1],"formattedCols_viewPane":[1,4,10,4.1],"formattedCols_browseRecs":[1,4,10,4.1],"formattedCols_recListing_width":[150,150,150,150],"formattedCols_browseRecs_width":[150,150,150,150],"defLang":"en_US","enableClassificationPaging":"true","defTimeZoneId":"UTC","defTimeZoneContinent":"UTC","defTimeZoneRegion":"UTC","defMode":"Advanced","defProcessMode":"Default","defSessionTimeOut":1800000,"username":"","password":"","createLink":false}]', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:35:22.941', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [1] to [2] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:55:11.152', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Auto Exec Script changed from [importPackage(Packages.ebikko);
importPackage(Packages.ebikko.filter);

  function preSave(node, isNewRecord) {
  
  var session = node.getSession();
  var bankName = node.getValue(''Bank Name'');
  node.setTitle(bankName);

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {
	if(node.getRecordNumber() == null || node.getRecordNumber() == "")
	{ 
			var session = node.getSession();
        	node.setTitle(''Bank Information'');
        	
        	       	
    }
 }

] to [importPackage(Packages.ebikko);
importPackage(Packages.ebikko.filter);

  function preSave(node, isNewRecord) {
  
  var session = node.getSession();
  var bankName = node.getValue(''Bank Name'');
  node.setTitle(bankName);
  
  if(isNewRecord)
	{
	 var bankCode = node.getValue(''Bank Code'');
     var BankID = session.getPropertyByName("Bank Code");
	
     //Defining the query for the search
     var filter = Equals(BankID,bankCode);

     //Define the filter and the record type for the search
     var multiQuery =  MultiQuery(session, "Example", session.getNodeTypeByPartialName(''Bank Information''), filter, null, 10);
     
     //Execute the query
     multiQuery.execute();

     //Get the number of results return
     var found = multiQuery.getCount();

     if (found>0)
	 { 
	 throw ''Duplicate Bank Code: Bank Code already exists in the system.'';
	 }
    }

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {
	if(node.getRecordNumber() == null || node.getRecordNumber() == "")
	{ 
			var session = node.getSession();
        	node.setTitle(''Bank Information'');
        	
        	       	
    }
 }

] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:56:04.665', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [4] to [5] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:56:12.637', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:58:56.275', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:07:36.816', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:08:02.063', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [5] to [6] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:08:10.737', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Form changed from [General(Bank Name, Bank Code)] to [General(Bank Code, Bank Name)] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:08:32.514', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [6] to [7] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:08:52.157', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [7] to [8] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:09:27.149', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [8] to [9] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:09:59.135', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [9] to [10] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:10:27.836', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [10] to [11] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:10:59.44', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [11] to [12] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:11:19.118', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [12] to [13] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:11:39.311', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [13] to [14] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:11:58.881', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [14] to [15] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:12:18.489', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [15] to [16] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:12:39.622', 'UPDATE', 'b7bc8b7449614d159ce0869306f04d36', 1, 'Bank Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [16] to [17] 
 
', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 11:12:52.412', 'UPDATE', 'fe8e1711cd5a4fb780d2c2d67806528c', 14, 'List of Banks', '00000000000000000000000000000000', 'ROOT', 'Saved search executed', '192.168.1.92');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:01:15.713', 'CREATE', 'a4d54a1736fa45e796aa89ff04b83f55', 16, 'Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Name] 
 
Type set to [String] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:02:40.408', 'CREATE', 'c6bc629517e44c6f982e25f8daf5bbd6', 16, 'Registration Date', '00000000000000000000000000000000', 'ROOT', 'Name set to [Registration Date] 
 
Type set to [Date] 
 
Length set to [0] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:03:38.312', 'CREATE', 'b1b99355d0834804a01b7a69fc2421bd', 16, 'Maximum Amount', '00000000000000000000000000000000', 'ROOT', 'Name set to [Maximum Amount] 
 
Type set to [Decimal] 
 
Length set to [16] 
 
Decimals set to [2] 
 
Max Decimal Value set to [99999999999999.98] 
 
Min Decimal Value set to [0.0] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:04:08.396', 'CREATE', 'f9ce8fde98e547699ff79602b2dce34f', 16, 'Effective Date', '00000000000000000000000000000000', 'ROOT', 'Name set to [Effective Date] 
 
Type set to [Date] 
 
Length set to [0] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:05:28.158', 'CREATE', 'i65f3cab798e4af68eecf22c9c0e02c4', 13, 'Frequency', '00000000000000000000000000000000', 'ROOT', 'Name set to [Frequency] 
 
Description set to [] 
 
Lookup Items set to [(Code=01, Name=Daily, Description=); (Code=02, Name=Weekly, Description=); (Code=03, Name=Monthly, Description=); (Code=04, Name=Yearly, Description=)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:05:36.155', 'CREATE', 'hea71551e76346ad8f8e87f13911c1b3', 16, 'Frequency', '00000000000000000000000000000000', 'ROOT', 'Name set to [Frequency] 
 
Type set to [String] 
 
Length set to [100] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
Using Lookup Set set to [Yes] 
 
Lookup Set set to [Frequency] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:06:13.975', 'CREATE', 'dc8e3bc6f41f4f15aa445184108a680a', 1, 'Mandate Form', '00000000000000000000000000000000', 'ROOT', 'Name set to [Mandate Form] 
 
Description set to [] 
 
Store set to [DEFAULT_STORE] 
 
Property[Reference Number(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Email(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Phone Number(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[ID Type(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[ID Number(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Bank Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Account Number(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Registration Date(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Maximum Amount(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Effective Date(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Frequency(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Is Apply Record Acl Filter set to [Yes] 
 
Level set to [4] 
 
Record Numbering Method set to [Using a Numbering Pattern] 
 
Is Reset Record Number At Year End set to [Yes] 
 
Next Record Number set to [0] 
 
Record Number Pattern set to [MANDATE-DDMMYYYY-##########] 
 
Is Metadata Text Indexed set to [Yes] 
 
Is Content Text Indexed set to [Yes] 
 
Is Can Attach Content set to [Yes] 
 
Auto Exec Script set to [  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

] 
 
Is Copy Content Template On Record Create set to [Yes] 
 
Activity Name set to [] 
 
Conversion Format set to [] 
 
Record Event Settings: [CREATE] Enabled. 
 
Record Event Settings: [DELETE] Enabled. 
 
Record Event Settings: [DOWNLOAD] Enabled. 
 
Record Event Settings: [EXPORT] Enabled. 
 
Record Event Settings: [MODIFY] Enabled. 
 
Record Event Settings: [VIEW] Enabled. 
 
Form set to[General(Title, Name, Email, Phone Number, ID Type, ID Number, Bank Name, Account Number, Maximum Amount, Frequency, Registration Date, Effective Date, Reference Number)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:07:30.228', 'UPDATE', 'dc8e3bc6f41f4f15aa445184108a680a', 1, 'eMandate Form', '00000000000000000000000000000000', 'ROOT', 'Name changed from [Mandate Form] to [eMandate Form] 
 
Icon has changed 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-13 10:10:18.605', 'UPDATE', 'dc8e3bc6f41f4f15aa445184108a680a', 1, 'eMandate Form', '00000000000000000000000000000000', 'ROOT', 'Property[Bank Name] removed from the Record Type. 
 
Property[Customer Bank Name(Mandatory: No, Read Only: No, Alias: Bank Name, Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [General(Title, Name, Email, Phone Number, ID Type, ID Number, Bank Name, Account Number, Maximum Amount, Frequency, Registration Date, Effective Date, Reference Number)] to [General(Title, Name, Email, Phone Number, ID Type, ID Number, Customer Bank Name, Account Number, Maximum Amount, Frequency, Registration Date, Effective Date, Reference Number)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:25:52.684', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Property[Account Number] removed from the Record Type. 
 
Property[Customer Bank Name] removed from the Record Type. 
 
Next Record Number changed from [2] to [1] 
 
Form changed from [GENERAL INFORMATION(Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Customer Bank Name, Account Number)] to [GENERAL INFORMATION(Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:27:21.744', 'UPDATE', 'dc8e3bc6f41f4f15aa445184108a680a', 1, 'eMandate Form', '00000000000000000000000000000000', 'ROOT', 'Form changed from [General(Title, Name, Email, Phone Number, ID Type, ID Number, Customer Bank Name, Account Number, Maximum Amount, Frequency, Registration Date, Effective Date, Reference Number)] to [General(Title, Name, Email, Phone Number, ID Type, ID Number, Maximum Amount, Frequency, Registration Date, Effective Date, Reference Number)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:28:14.891', 'UPDATE', 'dc8e3bc6f41f4f15aa445184108a680a', 1, 'eMandate Form', '00000000000000000000000000000000', 'ROOT', 'Property[Account Number] removed from the Record Type. 
 
Property[Customer Bank Name] removed from the Record Type. 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:28:19.896', 'DELETE', 'fb976239d6cb41ea8eb79027e90faf0c', 16, 'Customer Bank Name', '00000000000000000000000000000000', 'ROOT', 'Property was deleted; Name = [Customer Bank Name] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:30:58.393', 'CREATE', 'eb50047853d6486b8c7f78ad91d4f454', 1, 'Customer Bank Account', '00000000000000000000000000000000', 'ROOT', 'Name set to [Customer Bank Account] 
 
Description set to [] 
 
Property[Merchant Bank Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Account Number(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Customer Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[ID Number(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[ID Type(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Is Apply Record Acl Filter set to [Yes] 
 
Level set to [2] 
 
Record Numbering Method set to [Using a Numbering Pattern] 
 
Is Reset Record Number At Year End set to [Yes] 
 
Next Record Number set to [0] 
 
Record Number Pattern set to [CUST-BANK-DDMMYYYY-###############] 
 
Auto Exec Script set to [  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

] 
 
Is Copy Content Template On Record Create set to [Yes] 
 
Activity Name set to [] 
 
Conversion Format set to [] 
 
Record Event Settings: [CREATE] Enabled. 
 
Record Event Settings: [DELETE] Enabled. 
 
Record Event Settings: [DOWNLOAD] Enabled. 
 
Record Event Settings: [EXPORT] Enabled. 
 
Record Event Settings: [MODIFY] Enabled. 
 
Record Event Settings: [VIEW] Enabled. 
 
Form set to[General(Title, Customer Name, ID Type, ID Number, Merchant Bank Name, Account Number)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:33:38.533', 'CREATE', 'a9e061d5ec554e70bc0bd212010f9fdf', 16, 'Customer Bank Name', '00000000000000000000000000000000', 'ROOT', 'Name set to [Customer Bank Name] 
 
Type set to [Record] 
 
Length set to [0] 
 
Ref Record Type set to [Customer Bank Account] 
 
Ref Multi Value set to [Yes] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Master Detail] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:33:50.783', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Property[Customer Bank Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [GENERAL INFORMATION(Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number)] to [GENERAL INFORMATION(Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Customer Bank Name)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:37:00.579', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Property[Merchant Bank Name] removed from the Record Type. 
 
Property[Merchant Account No] removed from the Record Type. 
 
Form changed from [GENERAL INFORMATION(Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email, Merchant Bank Name, Merchant Account No)] to [GENERAL INFORMATION(Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:44:49.472', 'CREATE', 'c1fb9f1f82af496cbbfd8f387aefab42', 16, 'Merchant ID', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant ID] 
 
Type set to [String] 
 
Length set to [20] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:45:19.079', 'CREATE', 'c408fbc0ea084ec19b7ee3f4d94e7711', 1, 'Merchant Bank Account', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant Bank Account] 
 
Description set to [] 
 
Property[Company Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Company Registration No(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Merchant ID(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Merchant Bank Name(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Property[Merchant Account No(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Is Apply Record Acl Filter set to [Yes] 
 
Level set to [2] 
 
Record Numbering Method set to [Using a Numbering Pattern] 
 
Is Reset Record Number At Year End set to [Yes] 
 
Next Record Number set to [0] 
 
Record Number Pattern set to [MERCHANT-ACC-DDMMYYYY-###############] 
 
Is Metadata Text Indexed set to [Yes] 
 
Auto Exec Script set to [  function preSave(node, isNewRecord) {

 }

  function postSave(node, isNewRecord) {

 }

  function preDelete(node) {

 }

  function postDelete(node) {

 }

  function init(node) {

 }

] 
 
Is Copy Content Template On Record Create set to [Yes] 
 
Activity Name set to [] 
 
Conversion Format set to [] 
 
Record Event Settings: [CREATE] Enabled. 
 
Record Event Settings: [DELETE] Enabled. 
 
Record Event Settings: [DOWNLOAD] Enabled. 
 
Record Event Settings: [EXPORT] Enabled. 
 
Record Event Settings: [MODIFY] Enabled. 
 
Record Event Settings: [VIEW] Enabled. 
 
Form set to[General(Title, Company Name, Company Registration No, Merchant ID, Merchant Bank Name, Merchant Account No)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:46:33.393', 'CREATE', 'f37b286e025d4cb5a9daf28baa81f155', 16, 'Merchant Bank Account', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant Bank Account] 
 
Type set to [Record] 
 
Length set to [0] 
 
Ref Record Type set to [Merchant Bank Account] 
 
Ref Multi Value set to [Yes] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Master Detail] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:46:40.637', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Property[Merchant Bank Account(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:46:55.136', 'UPDATE', 'a9e061d5ec554e70bc0bd212010f9fdf', 16, 'Customer Bank Account', '00000000000000000000000000000000', 'ROOT', 'Name changed from [Customer Bank Name] to [Customer Bank Account] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:47:48.548', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Property[Customer Bank Account] removed from the Record Type. 
 
Form changed from [GENERAL INFORMATION(Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Customer Bank Account)] to [GENERAL INFORMATION(Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:48:15.131', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Property[Merchant Bank Account] removed from the Record Type. 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:48:27.127', 'DELETE', 'a9e061d5ec554e70bc0bd212010f9fdf', 16, 'Customer Bank Account', '00000000000000000000000000000000', 'ROOT', 'Property was deleted; Name = [Customer Bank Account] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:49:00.295', 'CREATE', 'e797f68ea14741bc85f1b7813cd0d875', 16, 'Customer Bank Account', '00000000000000000000000000000000', 'ROOT', 'Name set to [Customer Bank Account] 
 
Type set to [Record] 
 
Length set to [0] 
 
Ref Record Type set to [Customer Bank Account] 
 
Ref Multi Value set to [Yes] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:49:17.006', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Property[Customer Bank Account(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [GENERAL INFORMATION(Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number)] to [GENERAL INFORMATION(Customer Name, Gender, ID Type, ID Number, Email, Address, Phone Number, Customer Bank Account)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:49:31.568', 'DELETE', 'f37b286e025d4cb5a9daf28baa81f155', 16, 'Merchant Bank Account', '00000000000000000000000000000000', 'ROOT', 'Property was deleted; Name = [Merchant Bank Account] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:50:00.867', 'CREATE', 'b6d28a5702d740cdb0f733f97aee88c5', 16, 'Merchant Bank Account', '00000000000000000000000000000000', 'ROOT', 'Name set to [Merchant Bank Account] 
 
Type set to [Record] 
 
Length set to [0] 
 
Ref Record Type set to [Merchant Bank Account] 
 
Ref Multi Value set to [Yes] 
 
Constraints set to [Can Be Person Or Group] 
 
Semantics set to [Relationship] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:50:12.553', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Property[Merchant Bank Account(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [GENERAL INFORMATION(Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email)] to [GENERAL INFORMATION(Company Name, Company Registration No, Business Description, Business Address, Business Phone No, Business Fax No, Home URL, Contact Person Name, Contact Person Phone No, Contact Person IC No, Contact Person Email, Merchant Bank Account)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 03:55:03.017', 'UPDATE', 'dc8e3bc6f41f4f15aa445184108a680a', 1, 'eMandate Form', '00000000000000000000000000000000', 'ROOT', 'Property[Customer Bank Account(Mandatory: No, Read Only: No, Alias: , Default Value: Unspecified)] added to the Record Type. 
 
Form changed from [General(Title, Name, Email, Phone Number, ID Type, ID Number, Maximum Amount, Frequency, Registration Date, Effective Date, Reference Number)] to [General(Title, Name, Email, Phone Number, ID Type, ID Number, Maximum Amount, Frequency, Registration Date, Effective Date, Reference Number, Customer Bank Account)] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:06:37.488', 'UPDATE', 'eb50047853d6486b8c7f78ad91d4f454', 1, 'Customer Bank Account', '00000000000000000000000000000000', 'ROOT', 'Icon has changed 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:07:40.096', 'UPDATE', 'c408fbc0ea084ec19b7ee3f4d94e7711', 1, 'Merchant Bank Account', '00000000000000000000000000000000', 'ROOT', 'Icon has changed 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:29:13.69', 'UPDATE', 'eb50047853d6486b8c7f78ad91d4f454', 1, 'Customer Bank Account', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [0] to [2] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:29:21.851', 'UPDATE', 'f2bfeb5852264c5aa67f53f96ac28d39', 1, 'Customer Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [1] to [2] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:30:31.293', 'UPDATE', 'eb50047853d6486b8c7f78ad91d4f454', 1, 'Customer Bank Account', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [2] to [3] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:36:56.532', 'UPDATE', '00000000000000000000000000000000', 2, 'ROOT', '00000000000000000000000000000000', 'ROOT', 'User Preferences set to [{"formattedCols_recListing":[1,10,4,4.1],"formattedCols_viewPane":[1,4,10,4.1],"formattedCols_browseRecs":["j8e43ac4e85940c6a15e4c35f0a5a7e5",1,4,10,4.1],"formattedCols_recListing_width":[150,150,150,150],"formattedCols_browseRecs_width":[150,150,150,150,150],"defLang":"en_US","enableClassificationPaging":"true","defTimeZoneId":"UTC","defTimeZoneContinent":"UTC","defTimeZoneRegion":"UTC","defMode":"Advanced","defProcessMode":"Default","defSessionTimeOut":1800000,"username":"","password":"","createLink":false}]', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:37:33.129', 'UPDATE', '00000000000000000000000000000000', 2, 'ROOT', '00000000000000000000000000000000', 'ROOT', 'User Preferences set to [{"formattedCols_recListing":[1,10,4,4.1],"formattedCols_viewPane":[1,4,10,4.1],"formattedCols_browseRecs":["fdc659695c944890b9c1720de461db2e","j8e43ac4e85940c6a15e4c35f0a5a7e5"],"formattedCols_recListing_width":[150,150,150,150],"formattedCols_browseRecs_width":[150,150],"defLang":"en_US","enableClassificationPaging":"true","defTimeZoneId":"UTC","defTimeZoneContinent":"UTC","defTimeZoneRegion":"UTC","defMode":"Advanced","defProcessMode":"Default","defSessionTimeOut":1800000,"username":"","password":"","createLink":false}]', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:43:31.4', 'UPDATE', 'afd1329c2de2421bbbe5a48f65b56818', 16, 'Name of the Bank', '00000000000000000000000000000000', 'ROOT', 'Name changed from [Bank Name] to [Name of the Bank] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:43:57.156', 'UPDATE', 'fdc659695c944890b9c1720de461db2e', 16, 'Bank Name', '00000000000000000000000000000000', 'ROOT', 'Name changed from [Merchant Bank Name] to [Bank Name] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:44:16.208', 'UPDATE', '00000000000000000000000000000000', 2, 'ROOT', '00000000000000000000000000000000', 'ROOT', 'User Preferences set to [{"formattedCols_recListing":[1,10,4,4.1],"formattedCols_viewPane":[1,4,10,4.1],"formattedCols_browseRecs":["fdc659695c944890b9c1720de461db2e","j8e43ac4e85940c6a15e4c35f0a5a7e5"],"formattedCols_recListing_width":[150,150,150,150],"formattedCols_browseRecs_width":[150,150],"defLang":"en_US","enableClassificationPaging":"true","defTimeZoneId":"UTC","defTimeZoneContinent":"UTC","defTimeZoneRegion":"UTC","defMode":"Advanced","defProcessMode":"Default","defSessionTimeOut":1800000,"username":"","password":"","createLink":false}]', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:51:02.914', 'UPDATE', 'c408fbc0ea084ec19b7ee3f4d94e7711', 1, 'Merchant Bank Account', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [0] to [2] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:51:45.677', 'UPDATE', 'c408fbc0ea084ec19b7ee3f4d94e7711', 1, 'Merchant Bank Account', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [2] to [3] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:51:56.932', 'UPDATE', 'c22816ad803c47ed83400bc787d06ed4', 1, 'Merchant Information', '00000000000000000000000000000000', 'ROOT', 'Next Record Number changed from [2] to [3] 
 
', '211.25.130.238');
INSERT INTO object_event (event_timestamp, event_type, object_uid, object_type, object_name, principal_uid, principal_name, details, ipaddress) VALUES ('2017-03-14 04:57:07.233', 'UPDATE', '00000000000000000000000000000000', 2, 'ROOT', '00000000000000000000000000000000', 'ROOT', 'User Preferences set to [{"formattedCols_recListing":[1,10,4,4.1],"formattedCols_viewPane":[1,4,10,4.1],"formattedCols_browseRecs":["fdc659695c944890b9c1720de461db2e","cead45cc70f2415ca1054f2853a8a100"],"formattedCols_recListing_width":[150,150,150,150],"formattedCols_browseRecs_width":[150,150],"defLang":"en_US","enableClassificationPaging":"true","defTimeZoneId":"UTC","defTimeZoneContinent":"UTC","defTimeZoneRegion":"UTC","defMode":"Advanced","defProcessMode":"Default","defSessionTimeOut":1800000,"username":"","password":"","createLink":false}]', '211.25.130.238');


--
-- Data for Name: principal_group; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- Data for Name: profile; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO profile (uid, name, p1000, p1, p11, p21, p41, p42, p51, p52, p53, p54, p61, p71, p81, p91, p92, p93, p94, p95, p100, p101, p102, p103, p111, p112, p121, p122, p123, p2001, p2002, p2003, p2005, p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013, p2014, p2015, p2016, p2017, p2018, p2019, p2020, p2021, p2022, p2023, p2024, p2025, p2026, p2027, p2028, p2029, p3000, p4000, p5000, p6000, p6001, p7000, p8000, p8001, p9000, p10000, p11000, p12000, p13000, p14000, p15000, p16000, p17000, p18000, p19000, p20000, p21000, p22000, p23000, p25000, p26000, p27000, p28000, p29000, p30000, p31000, p40000, p41000, p42000, p43000) VALUES ('00000000000000000000000000000000', 'Administrator', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1);
INSERT INTO profile (uid, name, p1000, p1, p11, p21, p41, p42, p51, p52, p53, p54, p61, p71, p81, p91, p92, p93, p94, p95, p100, p101, p102, p103, p111, p112, p121, p122, p123, p2001, p2002, p2003, p2005, p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013, p2014, p2015, p2016, p2017, p2018, p2019, p2020, p2021, p2022, p2023, p2024, p2025, p2026, p2027, p2028, p2029, p3000, p4000, p5000, p6000, p6001, p7000, p8000, p8001, p9000, p10000, p11000, p12000, p13000, p14000, p15000, p16000, p17000, p18000, p19000, p20000, p21000, p22000, p23000, p25000, p26000, p27000, p28000, p29000, p30000, p31000, p40000, p41000, p42000, p43000) VALUES ('00000000000000000000000000000001', 'Information Manager', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0);
INSERT INTO profile (uid, name, p1000, p1, p11, p21, p41, p42, p51, p52, p53, p54, p61, p71, p81, p91, p92, p93, p94, p95, p100, p101, p102, p103, p111, p112, p121, p122, p123, p2001, p2002, p2003, p2005, p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013, p2014, p2015, p2016, p2017, p2018, p2019, p2020, p2021, p2022, p2023, p2024, p2025, p2026, p2027, p2028, p2029, p3000, p4000, p5000, p6000, p6001, p7000, p8000, p8001, p9000, p10000, p11000, p12000, p13000, p14000, p15000, p16000, p17000, p18000, p19000, p20000, p21000, p22000, p23000, p25000, p26000, p27000, p28000, p29000, p30000, p31000, p40000, p41000, p42000, p43000) VALUES ('00000000000000000000000000000002', 'Information Worker', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0);
INSERT INTO profile (uid, name, p1000, p1, p11, p21, p41, p42, p51, p52, p53, p54, p61, p71, p81, p91, p92, p93, p94, p95, p100, p101, p102, p103, p111, p112, p121, p122, p123, p2001, p2002, p2003, p2005, p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013, p2014, p2015, p2016, p2017, p2018, p2019, p2020, p2021, p2022, p2023, p2024, p2025, p2026, p2027, p2028, p2029, p3000, p4000, p5000, p6000, p6001, p7000, p8000, p8001, p9000, p10000, p11000, p12000, p13000, p14000, p15000, p16000, p17000, p18000, p19000, p20000, p21000, p22000, p23000, p25000, p26000, p27000, p28000, p29000, p30000, p31000, p40000, p41000, p42000, p43000) VALUES ('00000000000000000000000000000003', 'End User', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0);
INSERT INTO profile (uid, name, p1000, p1, p11, p21, p41, p42, p51, p52, p53, p54, p61, p71, p81, p91, p92, p93, p94, p95, p100, p101, p102, p103, p111, p112, p121, p122, p123, p2001, p2002, p2003, p2005, p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013, p2014, p2015, p2016, p2017, p2018, p2019, p2020, p2021, p2022, p2023, p2024, p2025, p2026, p2027, p2028, p2029, p3000, p4000, p5000, p6000, p6001, p7000, p8000, p8001, p9000, p10000, p11000, p12000, p13000, p14000, p15000, p16000, p17000, p18000, p19000, p20000, p21000, p22000, p23000, p25000, p26000, p27000, p28000, p29000, p30000, p31000, p40000, p41000, p42000, p43000) VALUES ('00000000000000000000000000000004', 'Inquiry User', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO profile (uid, name, p1000, p1, p11, p21, p41, p42, p51, p52, p53, p54, p61, p71, p81, p91, p92, p93, p94, p95, p100, p101, p102, p103, p111, p112, p121, p122, p123, p2001, p2002, p2003, p2005, p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013, p2014, p2015, p2016, p2017, p2018, p2019, p2020, p2021, p2022, p2023, p2024, p2025, p2026, p2027, p2028, p2029, p3000, p4000, p5000, p6000, p6001, p7000, p8000, p8001, p9000, p10000, p11000, p12000, p13000, p14000, p15000, p16000, p17000, p18000, p19000, p20000, p21000, p22000, p23000, p25000, p26000, p27000, p28000, p29000, p30000, p31000, p40000, p41000, p42000, p43000) VALUES ('00000000000000000000000000000005', 'Impersonator', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


--
-- Data for Name: property_group; Type: TABLE DATA; Schema: mdd; Owner: mdd
--

INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('f0000000000000000000000000000002', 'Email Details', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('f0000000000000000000000000000002', 'Email Notes', 1);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('f0000000000000000000000000000003', 'Template Details', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('f0000000000000000000000000000004', 'Template Details', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('f0000000000000000000000000000005', 'Email Details', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('f0000000000000000000000000000005', 'Email Notes', 1);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('f0000000000000000000000000000006', 'Email Attachments', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('dc8e3bc6f41f4f15aa445184108a680a', 'General', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('f2bfeb5852264c5aa67f53f96ac28d39', 'GENERAL INFORMATION', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('b7bc8b7449614d159ce0869306f04d36', 'General', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('eb50047853d6486b8c7f78ad91d4f454', 'General', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('c408fbc0ea084ec19b7ee3f4d94e7711', 'General', 0);
INSERT INTO property_group (nodetype_uid, name, group_order) VALUES ('c22816ad803c47ed83400bc787d06ed4', 'GENERAL INFORMATION', 0);


--
-- Data for Name: recent_container; Type: TABLE DATA; Schema: mdd; Owner: mdd
--



--
-- PostgreSQL database dump complete
--

