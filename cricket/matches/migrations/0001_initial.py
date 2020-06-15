# Generated by Django 2.2.13 on 2020-06-15 09:21

from django.db import migrations, models
import django.db.models.deletion
import django_extensions.db.fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('game', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='AmMatches',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, null=True)),
                ('slug', django_extensions.db.fields.RandomCharField(blank=True, editable=False, include_digits=False, length=6, unique=True)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('match_own', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='match_winner', to='game.AmTeam')),
                ('team_one', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='team_one', to='game.AmTeam')),
                ('team_two', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='team_two', to='game.AmTeam')),
            ],
            options={
                'verbose_name': 'Matches',
                'verbose_name_plural': 'Matches',
                'db_table': 'am_matches',
            },
        ),
        migrations.CreateModel(
            name='AmPoints',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('deleted_at', models.DateTimeField(blank=True, editable=False, null=True)),
                ('points', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('match', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='match', to='matches.AmMatches')),
                ('team', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='points', to='game.AmTeam')),
            ],
            options={
                'verbose_name': 'Points',
                'verbose_name_plural': 'Points',
                'db_table': 'am_points',
            },
        ),
    ]
