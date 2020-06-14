class MatchRouter(object):
    """
    A router to control all database operations on models in the
    console application.
    """
    def db_for_read(self, model, **hints):
        """
        Attempts to read console models go to console.
        """
        if model._meta.app_label == 'matches':
            return 'default'
        return None

    def db_for_write(self, model, **hints):
        """
        Attempts to write console models go to console_db.
        """
        if model._meta.app_label == 'matches':
            return 'default'
        return None

    def allow_relation(self, obj1, obj2, **hints):
        """
        Allow relations if a model in the console app is involved.
        """
        if obj1._meta.app_label == 'matches' or \
           obj2._meta.app_label == 'matches':
           return True
        return None

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        """
        Make sure the console app only appears in the 'console_db'
        database.
        """
        if app_label == 'matches':
            return db == 'default'
        return None
