#= 
    This code was generated by heta-compiler of v0.5.8
    
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
    C = 1.0
    S2 = 0.0 / C
    S3 = 0.0 / C
    k1 = 1.5
    S1 = 1.5 / C
    reaction1 = C * k1 * S1
    S3_proc = 0.15
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
        ],
        
        [
            C,
            k1,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k1,) = p.static
    (S1_,S2_,S3_,) = u 

    # Heta rules
    S2 = S2_ / C
    S3 = S3_ / C
    S1 = S1_ / C
    reaction1 = C * k1 * S1
    S3_proc = 0.15
    
    #p.static .= [C,k1,]
    du .= [
      -reaction1,  # dS1_/dt
      reaction1,  # dS2_/dt
      S3_proc*C,  # dS3_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k1,) = integrator.p.static
        (S1_,S2_,S3_,) = u

        # Heta rules
        S2 = S2_ / C
        S3 = S3_ / C
        S1 = S1_ / C
        reaction1 = C * k1 * S1
        S3_proc = 0.15
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        k1_ = k1
        S3_proc_ = S3_proc

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events
function event1_trigger_(u, t, integrator)
    cons = integrator.p.constants
    (C,k1,) = integrator.p.static
    (S1_,S2_,S3_,) = u

    # Heta rules
    S2 = S2_ / C
    S3 = S3_ / C
    S1 = S1_ / C
    reaction1 = C * k1 * S1
    S3_proc = 0.15
    

    return S1 < 0.1 ? 1 : -1
end

### continous events


### event assignments
function event1_assignment_(integrator)
    cons = integrator.p.constants
    t = integrator.t
    (C,k1,) = integrator.p.static
    (S1_,S2_,S3_,) = integrator.u

    # Heta rules
    S2 = S2_ / C
    S3 = S3_ / C
    S1 = S1_ / C
    reaction1 = C * k1 * S1
    S3_proc = 0.15
    
    # recalculated values
    (S2,) = (1.0,)
    
    # save results

    integrator.u .= [
        S1 * C,
        S2 * C,
        S3 * C,
    ]
    
    integrator.p.static .= [C,k1,]
end


### OUTPUT ###

x00646 = Model(
  start_,
  ode_,
  [
      DEvent(event1_trigger_, event1_assignment_),
  ],
  make_saving_,
  constants_
)

models = (
    x00646 = x00646
)
tasks = ()

export models, tasks

end
