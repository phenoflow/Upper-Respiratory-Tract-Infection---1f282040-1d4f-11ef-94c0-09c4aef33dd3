cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  upper-respiratory-tract-infection-urti-laryngitis---primary:
    run: upper-respiratory-tract-infection-urti-laryngitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  other-upper-respiratory-tract-infection-urti---primary:
    run: other-upper-respiratory-tract-infection-urti---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-urti-laryngitis---primary/output
  acute-upper-respiratory-tract-infection-urti---primary:
    run: acute-upper-respiratory-tract-infection-urti---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: other-upper-respiratory-tract-infection-urti---primary/output
  upper-respiratory-tract-infection-urti-catarrhal---primary:
    run: upper-respiratory-tract-infection-urti-catarrhal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: acute-upper-respiratory-tract-infection-urti---primary/output
  upper-respiratory-tract-infection-urti-laryngotracheitis---primary:
    run: upper-respiratory-tract-infection-urti-laryngotracheitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-urti-catarrhal---primary/output
  upper-respiratory-tract-infection-urti-specified---primary:
    run: upper-respiratory-tract-infection-urti-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-urti-laryngotracheitis---primary/output
  upper-respiratory-tract-infection-urti-tracheopharyngitis---primary:
    run: upper-respiratory-tract-infection-urti-tracheopharyngitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-urti-specified---primary/output
  upper-respiratory-tract-infection-urti-obstruction---primary:
    run: upper-respiratory-tract-infection-urti-obstruction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-urti-tracheopharyngitis---primary/output
  upper-respiratory-tract-infection-urti---primary:
    run: upper-respiratory-tract-infection-urti---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-urti-obstruction---primary/output
  upper-respiratory-tract-infection-urti-epiglottitis---primary:
    run: upper-respiratory-tract-infection-urti-epiglottitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-urti---primary/output
  upper-respiratory-tract-infection-urti-organism---primary:
    run: upper-respiratory-tract-infection-urti-organism---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-urti-epiglottitis---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: upper-respiratory-tract-infection-urti-organism---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
