FROM openknowledge/ckan-base:2.8

MAINTAINER Harald von Waldow <harald.vonwaldow@eawag.ch>

# Set timezone
ARG TZ
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime
RUN echo $TZ > /etc/timezone

# Install any extensions needed by your CKAN instance
# (Make sure to add the plugins to CKAN__PLUGINS in the .env file)
RUN pip install -e git+https://github.com/ckan/ckanext-scheming.git#egg=ckanext-scheming && \
    pip install -r https://raw.githubusercontent.com/ckan/ckanext-scheming/master/requirements.txt

# Install the extension(s) you wrote for your own project
# Use my own patched version until they got it sorted out in the original repo
RUN pip install -e git+https://github.com/eawag-rdm/ckanext-pdfview.git#egg=ckanext-pdfview
RUN pip install -e git+https://github.com/eawag-rdm/ckanext-spatial.git#egg=ckanext-spatial && \
    pip install -r https://raw.githubusercontent.com/eawag-rdm/ckanext-spatial/master/pip-requirements.txt

RUN pip install -e git+https://github.com/eawag-rdm/ckanext_eaw_schema.git@ericopen#egg=ckanext_eaw_schema
RUN pip install -e git+https://github.com/eawag-rdm/ckanext-eaw_theme.git#egg=ckanext-eaw_theme
RUN pip install -e git+https://github.com/eawag-rdm/ckanext-hierarchy_s.git#egg=ckanext-hierarchy_s && \
    pip install -r https://raw.githubusercontent.com/eawag-rdm/ckanext-hierarchy_s/master/requirements.txt
RUN pip install -e git+https://github.com/eawag-rdm/ckanext-repeating_s.git#egg=ckanext-repeating_s

# Copy additional setup scripts
COPY docker-entrypoint.d/* /docker-entrypoint.d/

# Apply any patches needed to CKAN core or any of the built extensions (not the
# runtime mounted ones)
# See https://github.com/okfn/docker-ckan#applying-patches
COPY patches ${APP_DIR}/patches

RUN for d in $APP_DIR/patches/*; do \
        if [ -d $d ]; then \
            for f in `ls $d/*.patch | sort -g`; do \
                cd $SRC_DIR/`basename "$d"` && echo "$0: Applying patch $f to $SRC_DIR/`basename $d`"; patch -p1 < "$f" ; \
            done ; \
        fi ; \
    done
