# Week 2: CI/CD Pipeline Automation

## Real-World Problem Addressed
When developers push code changes, manually compiling, testing, and deploying the application risks introducing human error and delays the release cycle.

## Solution Overview
This project implements a complete Continuous Integration and Continuous Deployment (CI/CD) pipeline using GitHub Actions, tailored for a Java Spring Boot application. 

## Pipeline Architecture
The workflow (`ci-cd-pipeline.yml`) consists of two main stages:
1. **Build & Test Stage:**
   - Triggers on Pull Requests and Pushes to the `main` branch.
   - Checks out the repository.
   - Sets up the Java Development Kit (JDK 17).
   - Simulates a Maven build and automated test execution.
2. **Deployment Stage:**
   - Depends on the successful completion of the Build stage (`needs: build-and-test`).
   - Only triggers on a direct push or merge to the `main` branch (Deployment Trigger).
   - Simulates deploying the artifact to a production/cloud environment.

## Instructions for Evaluators
*Note on Repository Structure:* To comply with the task instructions, the pipeline file is stored in the `Week2` folder. For GitHub Actions to actively execute this file in a real repository, a copy of this YAML file must be placed in the `.github/workflows/` directory at the root of the project.