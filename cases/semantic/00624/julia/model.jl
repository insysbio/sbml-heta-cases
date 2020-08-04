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
    k1 = 0.75
    C = 1.0
    S2 = 0.5 / C
    S3 = 3.75 / C
    k2 = 5.0
    S1 = 1.0 / C
    reaction1 = C * k2 * S1
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
        ],
        
        [
            C,
            k1,
            k2,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k1,k2,) = p.static
    (S1_,S2_,) = u 

    # Heta rules
    S2 = S2_ / C
    S3 = k1 * S2
    S1 = S1_ / C
    reaction1 = C * k2 * S1
    
    #p.static .= [C,k1,k2,]
    du .= [
      -reaction1,  # dS1_/dt
      reaction1,  # dS2_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k1,k2,) = integrator.p.static
        (S1_,S2_,) = u

        # Heta rules
        S2 = S2_ / C
        S3 = k1 * S2
        S1 = S1_ / C
        reaction1 = C * k2 * S1
        
        # calculate amounts
        C_ = C
        S3_ = S3 * C
        reaction1_ = reaction1
        k1_ = k1
        k2_ = k2

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events
function event1_trigger_(u, t, integrator)
    cons = integrator.p.constants
    (C,k1,k2,) = integrator.p.static
    (S1_,S2_,) = u

    # Heta rules
    S2 = S2_ / C
    S3 = k1 * S2
    S1 = S1_ / C
    reaction1 = C * k2 * S1
    

    return S1 < 0.1 ? 1 : -1
end

### continous events

### event assignments
function event1_assignment_(integrator)
    cons = integrator.p.constants
    t = integrator.t
    (C,k1,k2,) = integrator.p.static
    (S1_,S2_,) = integrator.u

    # Heta rules
    S2 = S2_ / C
    S3 = k1 * S2
    S1 = S1_ / C
    reaction1 = C * k2 * S1
    
    # recalculated values
    (S2,) = (1.0,)
    
    # save results

    integrator.u .= [
        S1 * C,
        S2 * C,
    ]
    
    integrator.p.static .= [C,k1,k2,]
end


### OUTPUT ###

x00624 = Model(
  start_,
  ode_,
  [
      DEvent(event1_trigger_, event1_assignment_),
  ],
  make_saving_,
  constants_
)

models = (
    x00624 = x00624
)
tasks = ()

export models, tasks

end
