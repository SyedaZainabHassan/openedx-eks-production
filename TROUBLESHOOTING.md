# Troubleshooting Guide

This document explains why Tutor may still use its internal databases even when external databases are intended.

---

## Issue: Tutor continues using internal databases

### Symptoms
- External database settings appear to be ignored.
- Tutor uses internal MySQL/MongoDB instead.
- Database configuration changes do not persist after restart.

---

## Explanation

Tutor uses **internal databases by default**.  
If external databases are not configured **and saved in Tutor's configuration context**, Tutor will automatically fall back to its internal database services.

This is expected behavior unless external databases are explicitly enabled and saved.

---

## Correct Steps to Use External Databases

### 1. Enable external databases in Tutor config

Run the appropriate `tutor config set` commands.
