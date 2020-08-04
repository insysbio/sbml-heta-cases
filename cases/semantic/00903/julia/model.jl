#= 
    This code was generated by heta-compiler of v0.5.9
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    C2 = 1.5
    C1 = 1.5
    C1_proc = 0.5 * C2 - 0.2 * C1
    C2_proc = 0.75 * C1 - 2.1 * C2
    
    # save results

    return (
        [
            C1,
            C2,
        ],
        
        [
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    () = p.static
    (C1_,C2_,) = u 

    # Heta rules
    C2 = C2_
    C1 = C1_
    C1_proc = 0.5 * C2 - 0.2 * C1
    C2_proc = 0.75 * C1 - 2.1 * C2
    
    #p.static .= []
    du .= [
      C1_proc,  # dC1_/dt
      C2_proc,  # dC2_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        () = integrator.p.static
        (C1_,C2_,) = u

        # Heta rules
        C2 = C2_
        C1 = C1_
        C1_proc = 0.5 * C2 - 0.2 * C1
        C2_proc = 0.75 * C1 - 2.1 * C2
        
        # calculate amounts
        C1_proc_ = C1_proc
        C2_proc_ = C2_proc

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events

### continous events

### event assignments


### OUTPUT ###

x00903 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00903 = x00903
)
tasks = ()

export models, tasks

end
