#!/bin/bash

psql $CKAN_SQLALCHEMY_URL -c "UPDATE system_info SET value='/base/images/eric_logo1_fontexo_open.svg' WHERE key='ckan.site_logo';"
psql $CKAN_SQLALCHEMY_URL -c "UPDATE system_info SET value=3 WHERE key='ckan.homepage_style';"                                                                
psql $CKAN_SQLALCHEMY_URL -c "UPDATE system_info SET value='ERIC-open' WHERE key='ckan.site_title';"
