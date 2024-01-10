EXTENSION = maxtomin        # the extensions name
DATA = maxtomin--1.0.sql     # script file to install
PGFILEDESC = "max_to_min function"

# postgres build stuff
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
