================
netuitive-agent-formula
================

This is an example formula which may be used to deploy netuitive-agent through Salt.

Available states
================

.. contents::
    :local:

``netuitive-agent``
------------

Installs the netuitive-agent, extracts pillar configuration into the conf files, inserts the API key, restarts the agent and sets it as a service. 


Instructions for Use
================

1. Copy the contents of the pillar.example file and merge it into your Salt pillar. 
2. Insert your Linux Integration API key into the API_KEY value
3. By default, the agent will collect basic host data. You may enable and configure additional collectors in the pillar, and the formula will make the required conf file changes. 
4. Run the netuitive-agent formula within your salt state, or create a new one. A guide on how to use formulas can be found here: https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html